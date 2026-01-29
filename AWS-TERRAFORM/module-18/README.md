# Topic 18: Remote State & Locking (Production Setup)

## What is Terraform State?
Terraform keeps track of the ID and metadata of every resource it creates in a file called `terraform.tfstate`. By default, this file is stored on your local computer.

## The Problem with Local State
1. **Collaboration**: If you work in a team, your teammates can't see your local state file.
2. **Security**: State files can contain sensitive data (passwords, keys).
3. **Corruption**: If you delete your local file, Terraform "forgets" your infrastructure.
4. **Race Conditions**: If two people run `apply` at the same time, they might break the infrastructure.

## The Solution: Remote Backend
This module teaches you how to store your state in **AWS S3** and use **DynamoDB** for locking.

## How it Works (Learning Guide)

### 1. The S3 Bucket
This is the "hard drive" for your state file. It provides versioning and high availability.
```hcl
resource "aws_s3_bucket" "state_bucket" {
  bucket = "my-unique-state-bucket"
}
```

### 2. The DynamoDB Table
This acts as a "lock". When you run `apply`, Terraform places a small record in this table. If someone else tries to run `apply`, Terraform sees the lock and stops them, preventing conflicts.
```hcl
resource "aws_dynamodb_table" "lock_table" {
  name     = "terraform-lock-table"
  hash_key = "LockID" # This must be exactly "LockID"
}
```

### 3. The Backend Block
The `terraform { backend "s3" { ... } }` block tells Terraform where to look for the state.
> [!IMPORTANT]
> You must create the bucket and table **first** before you can use the backend block!

## Hands-on Tutorial

1. **Step 1: Bootstrap**: Comment out the `backend "s3"` block first.
2. **Step 2: Create Resources**: Run `terraform init` and `terraform apply`. This creates the bucket and DynamoDB table.
3. **Step 3: Migration**: Uncomment the `backend "s3"` block.
4. **Step 4: Re-Init**: Run `terraform init`. Terraform will ask: *"Do you want to copy existing state to the new backend?"*. Type **yes**.
5. **Verify**: Check your S3 bucket. You will see a `terraform.tfstate` file there!

## Key Takeaways
- **State Locking**: Always use DynamoDB in a team environment to prevent state corruption.
- **Encryption**: Always set `encrypt = true` in your backend configuration.
- **Bootstrapping**: You usually need one "local" apply to create the infra for the remote state, or create them manually.

> [!CAUTION]
> If you lose access to your S3 bucket, it is very difficult to recover your Terraform management! Always enable S3 Bucket Versioning.

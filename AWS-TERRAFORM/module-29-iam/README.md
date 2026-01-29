# Topic 29: IAM & Data-Driven Infrastructure (YAML)

## What is IAM?
**Identity and Access Management (IAM)** is how you manage who can do what in your AWS account. It consists of:
- **Users**: People or applications.
- **Groups**: Collections of users.
- **Policies**: JSON documents that define permissions (e.g., "Allow S3 Read").
- **Roles**: Temporary identities for services or cross-account access.

## What is Data-Driven Infrastructure?
Instead of writing Terraform code for every single new employee, we store the list of employees in a **YAML file**. Terraform reads this file and automatically creates the users and groups. This is the **Gold Standard** for enterprise infrastructure management.

## Learning Guide: Handling the Complexity

### 1. The YAML Source (`user.yaml`)
A simple human-readable list of your company structure.
```yaml
users:
  - name: alice
    groups: [admin]
  - name: bob
    groups: [developers]
```

### 2. The Logic (`locals.tf`)
We use the `yamldecode()` function to turn that YAML text into a Terraform object, then use `flatten()` to create pairs of "User-Group" relationships that Terraform can loop over.

### 3. The `for_each` Loop
Unlike `count`, `for_each` uses a **Map** or a **Set**. This is safer because if you delete "User A", "User B" is not affected (whereas with `count`, everyone's index might shift).
```hcl
resource "aws_iam_user" "users" {
  for_each = toset(local.users_names)
  name     = each.value
}
```

## How it Works (Logic Flow)
1. Read `user.yaml`.
2. Convert it into Terraform Maps.
3. Use `for_each` to create Groups.
4. Use `for_each` to create Users.
5. Create "Membership" links between them.
6. Create Access Keys so they can login.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Verify**:
   - Go to the AWS IAM Console.
   - Look at the "Users" list. You see them created from the YAML!
   - Look at the "Groups".
4. **Experiment**:
   - Open `user.yaml`.
   - Add a new user under the `users:` list.
   - Run `terraform plan`. Terraform will show that it's creating exactly one new user.

## Key Takeaways
- **Automation at Scale**: You can manage 1,000 users just as easily as 2 using this pattern.
- **Separation of Concerns**: Non-technical managers can update the `user.yaml` file, and a DevOps engineer can run the Terraform.
- **`toset()`**: Mandatory when using a list with `for_each`.

> [!IMPORTANT]
> This module creates **Access Keys** and **Passwords**. They will be visible in your `terraform.tfstate` file. **Never** share your state file publicly!

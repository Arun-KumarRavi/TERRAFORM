# Topic 16: Amazon S3 & The `count` Parameter

## What is Amazon S3?
**Simple Storage Service (S3)** is an object storage service that offers industry-leading scalability, data availability, security, and performance. You can use it to store and protect any amount of data for a range of use cases, such as websites, mobile applications, backup and restore, and archive.

## What is the `count` Meta-Argument?
Instead of writing 10 blocks of code to create 10 S3 buckets, you can use the `count` parameter to tell Terraform to create multiple instances of the same resource.

## Why use `count`?
- **Efficiency**: Scale your infrastructure up or down by simply changing a number.
- **Dynamic Configuration**: Create resources based on the length of a list.

## Learning Guide: Creating Multiple Buckets

### 1. The Variable (`variables.tf`)
We define a list of names we want for our buckets.
```hcl
variable "bucket_names" {
  type    = list(string)
  default = ["my-bucket-1", "my-bucket-2", "my-bucket-3"]
}
```

### 2. The Resource Logic (`main.tf`)
We use `count = length(var.bucket_names)` to tell Terraform to create as many buckets as there are names in the list.
We use `count.index` to pick the correct name for each bucket.
```hcl
resource "aws_s3_sbucket" "buckets" {
  count  = length(var.bucket_names)
  bucket = var.bucket_names[count.index] # Index starts at 0
}
```

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Observation**: Terraform will create multiple S3 buckets with the names provided in the list.
4. **Experiment**: Go to `variables.tf`, add a 4th name to the list, and run `terraform plan`. You will see that Terraform only creates the new bucket!

## Key Takeaways
- **`count.index`**: This is a special variable available within resource blocks that use `count`. It starts at 0 and increments for each resource created.
- **Naming Constraints**: S3 bucket names must be **globally unique**. If someone else has used the name, you will get an error.

> [!CAUTION]
> If you remove an item from the middle of the `bucket_names` list, Terraform might destroy and recreate other buckets because their `count.index` has shifted. For more complex scenarios, use `for_each` instead of `count`.

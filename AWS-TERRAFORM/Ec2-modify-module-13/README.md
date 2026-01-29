# Topic 13: Modifying Resources (Immutable Infrastructure)

## What happens when you change a resource?
One of Terraform's most powerful features is its ability to handle changes. When you modify your `.tf` files and run `terraform apply`, Terraform compares your current configuration with the actual state of your infrastructure.

There are two types of changes:
1. **Update in-place**: Terraform modifies the resource without destroying it (e.g., changing a tag).
2. **Destroy and Re-create**: Terraform must delete the old resource and create a new one because the change cannot be applied to an existing resource (e.g., changing the AMI).

## Why is this important?
Understanding the "Plan" output is critical for avoiding accidental downtime. Terraform follows the principle of **Immutable Infrastructure**: rather than patching a server, we often replace it with a fresh one.

## Learning Guide: This Module's Goal
In this module, we changed two things from Module 12:
- **Instance Type**: Moved from `t2.micro` to `t3.micro`.
- **Tags**: Updated the name to `Myec2-resource-change`.

### How Terraform handles this:
```hcl
resource "aws_instance" "myec2" {
  ami           = "ami-0ecb62995f68bb549"   
  instance_type = "t3.micro" # Changed!

  tags = {
    Name = "Myec2-resource-change" # Changed!
  }
}
```

## Hands-on Tutorial

1. **The Experiment**:
   - If you already ran Module 12, copy this `main.tf` over to that folder.
   - Run `terraform plan`.
2. **Observation**:
   - Look for the `~` symbol in the output. This indicates an **update**.
   - Look for `+/-` symbols. This indicates **replacement** (Destroy and Create).
3. **Apply**: Run `terraform apply` and watch how AWS updates the instance type (it will stop and start the instance).

## Key Takeaways
- **The "~" symbol**: Means an in-place update.
- **The "-/+" symbol**: Means replacement. Pay close attention to this as it causes data loss on the local drive of an EC2!
- **State File**: Terraform uses the `terraform.tfstate` file to know what was already there so it can calculate the difference.

> [!CAUTION]
> Always read the `terraform plan` output carefully before typing `yes`!

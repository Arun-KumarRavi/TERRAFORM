# Topic 23: Data Sources (Querying Existing AWS Infrastructure)

## What are Data Sources?
Data sources allow Terraform to use information defined outside of Terraform, or defined by another separate Terraform configuration. Instead of saying "Create this", a data source says "Go find this".

## Why use Data Sources?
- **Avoid Hardcoding**: Don't hardcode AMI IDs or VPC IDs; let Terraform find them for you.
- **Integration**: Link your Terraform code to resources created manually or by other teams.
- **Dynamic Updates**: Always get the "latest" version of a resource (like an AMI).

## Learning Guide: How to use `data` blocks

### 1. Finding the Default VPC
AWS creates a default VPC for every account. We can find it easily:
```hcl
data "aws_vpc" "default" {
  default = true
}
```

### 2. Finding the Latest AMI
AMIs are updated frequently with security patches. Instead of searching for the ID manually, use a data source:
```hcl
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}
```

### 3. Using the Data
Once found, you reference the data using the prefix `data.`.
```hcl
resource "aws_instance" "ec2_default" {
  ami       = data.aws_ami.amazon_linux.id
  subnet_id = data.aws_subnets.default.ids[0]
}
```

## How it Works (Logic Flow)
1. **Search Phase**: Before doing anything, Terraform "queries" the AWS API.
2. **Result Phase**: AWS returns the IDs and attributes of the requested resources.
3. **Usage Phase**: Terraform uses those real-world IDs to configure your new resources.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Verify**: Check the outputs. You will see the ID of your account's **Default VPC**, even though you never typed that ID in the code!
4. **Experiment**: Change the `ami` data source filter to look for "Ubuntu" instead of "Amazon Linux" and run `terraform plan`. Observe how Terraform automatically finds a new AMI ID.

## Key Takeaways
- **Read-Only**: Data sources are strictly read-only. Terraform will never modify or delete a resource found via a `data` block.
- **Filters**: Most data sources support `filter` blocks, which allow you to narrow down your search using tags or properties.

> [!TIP]
> Use data sources for Subnets and Security Groups to make your code more "portable" across different AWS accounts.

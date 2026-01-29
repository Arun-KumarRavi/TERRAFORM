# Topic 12: Basic AWS EC2 Instance Provisioning

## What is an Amazon EC2 Instance?
Amazon Elastic Compute Cloud (Amazon EC2) provides scalable computing capacity in the AWS Cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster.

In Terraform, an EC2 instance is managed using the `aws_instance` resource.

## Why use Terraform for EC2?
- **Speed**: Provision virtual servers in minutes.
- **Reproducibility**: Use the same configuration to create identical staging, dev, and production environments.
- **Version Control**: Track changes to your server configurations over time.

## Learning Guide: How this Module Works
This module demonstrates the simplest way to launch a virtual server (EC2) and attach an existing SSH key pair for access.

### 1. Provider Configuration
We specify the AWS provider and region.
```hcl
provider "aws" {
  region = "us-east-1"
}
```

### 2. Resource Definition
The `aws_instance` block defines the properties of our server:
- **AMI (Amazon Machine Image)**: The software template (OS, App Server) for the instance.
- **Instance Type**: The hardware configuration (CPU, Memory). `t2.micro` is often free-tier eligible.
- **Key Name**: The name of the SSH key pair you've already created in AWS Console to allow you to log in.

### 3. Tagging
Tags are key-value pairs that help you organize and identify your resources in the AWS dashboard.

## Code Breakdown

| Component | Description |
| :--- | :--- |
| `ami-0ecb62995f68bb549` | Amazon Linux 2023 AMI (Region specific) |
| `t2.micro` | Low-cost, burstable performance instance |
| `mykeypair` | **Important**: Ensure this key pair exists in your AWS account before running! |

## Hands-on Tutorial

1. **Initialize**: Run `terraform init` to download the AWS provider.
2. **Plan**: Run `terraform plan` to see what resources will be created.
3. **Apply**: Run `terraform apply` to launch the instance.
4. **Verify**: Check your AWS Management Console under EC2 to see "Myec2" running.
5. **Clean up**: Run `terraform destroy` to avoid ongoing costs.

> [!TIP]
> Always use `t2.micro` for learning to stay within the AWS Free Tier!

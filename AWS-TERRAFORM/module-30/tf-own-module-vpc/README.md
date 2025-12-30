# Terraform AWS VPC Module (Arun)

A reusable and production-ready Terraform module to create and manage an AWS VPC along with its core networking components.  
This module is designed following Terraform Registry best practices and helps achieve consistency, reusability, and scalability across environments.

---

## Features

- Creates an AWS VPC
- Supports public and private subnets
- Automatically associates route tables
- Internet Gateway support
- Clean and reusable module structure
- Example configuration included
- Ready for Terraform Registry publishing

---

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0 |

---

## Providers

```hcl
provider "aws" {
  region = "us-east-1"
}
Usage
hcl
Copy code
module "vpc" {
  source = "arun/vpc/aws"

  vpc_name = "demo-vpc"
  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}
⚠️ The provider configuration must be defined in the root module and not inside this module.

Inputs
Name	Description	Type	Required
vpc_name	Name of the VPC	string	yes
vpc_cidr	CIDR block for the VPC	string	yes
public_subnet_cidrs	List of public subnet CIDR blocks	list(string)	yes
private_subnet_cidrs	List of private subnet CIDR blocks	list(string)	yes
availability_zones	List of availability zones	list(string)	yes

Outputs
Name	Description
vpc_id	ID of the created VPC
public_subnet_ids	IDs of public subnets
private_subnet_ids	IDs of private subnets

Example
A complete working example is available under:

bash
Copy code
examples/complete
This example shows how to call the module from a root configuration.

Folder Structure
css
Copy code
terraform-aws-arun-vpc/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── README.md
└── examples/
    └── complete/
        ├── main.tf
        ├── outputs.tf
        └── README.md
Versioning
This module follows Semantic Versioning.

Example:

bash
Copy code
git tag v1.0.0
git push origin v1.0.0
License
This project is licensed under the MIT License.

Author
Arun Kumar

Terraform AWS module for reusable and scalable VPC infrastructure.

yaml
Copy code

---

## ✅ Next steps (recommended)

1. Save this as **README.md** in repo root  
2. Run:
```bash
git add README.md
git commit -m "Rewrite README with Arun branding"
git push
Tag and publish:

bash
Copy code
git tag v1.0.0
git push --tags
Go to Terraform Registry → Sign in → Publish Module


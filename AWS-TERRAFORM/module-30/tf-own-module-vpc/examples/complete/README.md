# Terraform AWS VPC Module

A reusable Terraform module to create and manage an AWS VPC with related networking components such as subnets, route tables, internet gateway, and outputs.

This module is designed to follow Terraform Registry best practices and can be easily reused across multiple environments.

---

## Features

- Creates a VPC
- Supports public and private subnets
- Internet Gateway support
- Route tables and associations
- Clean, reusable module structure
- Example usage included
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
  source = "github.com/<your-username>/terraform-aws-arun-vpc"

  vpc_cidr = "10.0.0.0/16"
  vpc_name = "demo-vpc"

  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]

  availability_zones = ["us-east-1a", "us-east-1b"]
}
✅ The above code is extracted from the root implementation and does not include provider configuration inside the module itself.

Inputs
Name	Description	Type	Required
vpc_name	Name of the VPC	string	yes
vpc_cidr	CIDR block for VPC	string	yes
public_subnet_cidrs	Public subnet CIDR blocks	list(string)	yes
private_subnet_cidrs	Private subnet CIDR blocks	list(string)	yes
availability_zones	Availability Zones	list(string)	yes

Outputs
Name	Description
vpc_id	ID of the created VPC
public_subnet_ids	IDs of public subnets
private_subnet_ids	IDs of private subnets

Examples
See the full working example under:

bash
Copy code
examples/complete
Folder Structure
css
Copy code
terraform-aws-subha-vpc/
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
License
This project is licensed under the MIT License.

Author
Created by ARUN KUMAR RAVI
Terraform AWS reusable module for learning and production-ready usage.

yaml
Copy code

---

# ✅ 2️⃣ `examples/complete/README.md`

```md
# Complete VPC Example

This example demonstrates how to use the **terraform-aws-subha-vpc** module in a real Terraform root configuration.

It creates:
- A VPC
- Public subnets
- Private subnets
- Required networking components

---

## Usage

### 1. Configure Provider

```hcl
provider "aws" {
  region = "us-east-1"
}
2. Call the Module
hcl
Copy code
module "vpc" {
  source = "../../"

  vpc_name = "example-vpc"
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
Outputs
After running terraform apply, you can view:

bash
Copy code
terraform output
Example outputs:

VPC ID

Public subnet IDs

Private subnet IDs

Run the Example
bash
Copy code
terraform init
terraform plan
terraform apply
To destroy:

bash
Copy code
terraform destroy
Purpose
This folder exists only for demonstration and testing purposes.
It helps users understand how to consume the module before using it in real projects.

✅ This example follows Terraform Registry best practices.

yaml
Copy code

---

## ✅ Final checklist (you’re almost ready to publish 🚀)

✔ Root README added  
✔ examples/complete README added  
✔ MIT License enabled  
✔ Correct repo name format (`terraform-aws-subha-vpc`)  
✔ Files moved to root  
✔ Examples folder present  
✔ Ready for tagging  

---

## ✅ Next steps (important for Terraform Registry)

Run these commands:

```bash
git add .
git commit -m "Add README and examples for Terraform module"
git tag v1.0.0
git push origin main --tags
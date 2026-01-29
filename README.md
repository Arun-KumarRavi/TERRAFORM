# Terraform AWS Learning Repository

A comprehensive collection of Terraform modules and examples for learning Infrastructure as Code (IaC) with AWS. This repository contains 28 modules covering fundamental to advanced Terraform concepts.

---

## 📚 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Module Structure](#module-structure)
- [Topics Covered](#topics-covered)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 Overview

This repository serves as a hands-on learning path for mastering Terraform with AWS. Each module focuses on specific concepts and builds upon previous knowledge, providing practical examples and real-world use cases.

---

## ✅ Prerequisites

Before getting started, ensure you have:

- **Terraform** installed (v1.0 or higher)
- **AWS Account** with appropriate permissions
- **AWS CLI** configured with credentials
- Basic understanding of cloud computing concepts
- Text editor or IDE (VS Code recommended)

---

## 📁 Module Structure

```
TERRAFORM/
├── AWS-TERRAFORM/
│   ├── Module-XX-Topic/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
├── .gitignore
├── LICENSE
└── README.md
```

---

## 📖 Topics Covered

### **Module 12: AWS EC2 Module**
**Directory:** `Aws-ec2-module-12/`

- Introduction to Terraform modules
- Creating reusable EC2 instance modules
- Module structure and organization
- Best practices for module design

---

### **Module 13: EC2 Create Key Pair**
**Directory:** `EC2-create-keypair/`

- Generating SSH key pairs with Terraform
- Managing EC2 instance access
- Security best practices for key management
- Associating key pairs with EC2 instances

---

### **Module 14: EC2 Modify Module**
**Directory:** `Ec2-modify-module-13/`

- Modifying existing Terraform modules
- Updating resource configurations
- Managing state changes
- Version control for infrastructure

---

### **Module 15: Variables**
**Directory:** `module-14-variables/`

- Input variables declaration
- Variable types (string, number, bool, list, map)
- Default values and validation
- Variable precedence and best practices

---

### **Module 16: Outputs**
**Directory:** `module-15-output/`

- Output values configuration
- Sharing data between modules
- Output formatting and descriptions
- Using outputs for automation

---

### **Module 17: S3 Bucket**
**Directory:** `module-16-S3-bucket/`

- Creating S3 buckets with Terraform
- Bucket policies and permissions
- Versioning and lifecycle rules
- S3 bucket encryption

---

### **Module 18: Random Provider**
**Directory:** `module-17-random-provider/`

- Using the Random provider
- Generating unique resource names
- Random strings, passwords, and IDs
- Managing randomness in infrastructure

---

### **Module 19: Terraform Module 18**
**Directory:** `module-18/`

- Advanced module concepts
- Module composition
- Input/output relationships
- Module versioning

---

### **Module 20: Static Website Project**
**Directory:** `module-19-project-static-website/`

- **PROJECT:** Hosting static websites on S3
- CloudFront distribution setup
- Route53 DNS configuration
- SSL/TLS certificates
- Complete end-to-end deployment

---

### **Module 21: VPC (Virtual Private Cloud)**
**Directory:** `module-20-vpc/`

- VPC creation and configuration
- Subnets (public and private)
- Internet Gateway and NAT Gateway
- Route tables and associations
- Network ACLs and Security Groups

---

### **Module 22: VPC Module 21**
**Directory:** `module-21/`

- Modular VPC design
- Multi-tier network architecture
- VPC peering concepts
- Best practices for VPC design

---

### **Module 23: VPC Module 22**
**Directory:** `module-22/`

- Advanced VPC configurations
- VPC endpoints
- VPN connections
- Transit Gateway concepts

---

### **Module 24: VPC Examples**
**Directory:** `module-23-vpc-ex/`

- Real-world VPC scenarios
- Three-tier architecture
- High availability setups
- Multi-AZ deployments

---

### **Module 25: Advanced VPC Configuration**
**Directory:** `module-24/`

- Complex networking scenarios
- VPC flow logs
- Network monitoring
- Security best practices

---

### **Module 26: Environment Variables**
**Directory:** `module-24-env-var/`

- Managing environment-specific configurations
- Using Terraform workspaces
- Environment variable precedence
- Dev, Staging, Production setups

---

### **Module 27: Local Variables**
**Directory:** `module-25-local-variable/`

- Local values declaration
- Simplifying complex expressions
- DRY (Don't Repeat Yourself) principle
- Local vs. input variables

---

### **Module 28: Terraform Operators & Expressions**
**Directory:** `module-26-tf-operators-expressions/`

- Arithmetic and comparison operators
- Logical operators (AND, OR, NOT)
- Conditional expressions
- For loops and splat expressions

---

### **Module 29: Terraform Functions**
**Directory:** `module-27-functions/`

- Built-in functions overview
- String manipulation functions
- Numeric and collection functions
- Date/time and encoding functions
- File and filesystem functions

---

### **Module 30: Multiple Resources**
**Directory:** `module-28-multiple-resources/`

- Count meta-argument
- For_each meta-argument
- Dynamic blocks
- Managing multiple similar resources

---

### **Module 31: IAM (Identity and Access Management)**
**Directory:** `module-29-iam/`

- IAM users, groups, and roles
- IAM policies and permissions
- Service roles and instance profiles
- IAM best practices and security

---

### **Module 32: Advanced IAM & Resources**
**Directory:** `module-30/`

- Cross-account access
- AssumeRole configurations
- Policy attachments
- IAM role trust relationships

---

### **Module 33: Additional Topics**
**Directory:** `module-32/`

- Additional advanced concepts
- Integration with other AWS services
- Custom configurations

---

### **Module 34: Advanced Concepts**
**Directory:** `module-33/`

- State management
- Remote state backends
- State locking with DynamoDB
- Terraform Cloud/Enterprise

---

### **Module 35: Additional Module 34**
**Directory:** `module-34/`

- Terraform provisioners
- Local-exec and remote-exec
- Null resources
- Provisioner best practices

---

### **Module 36: Advanced Module 35**
**Directory:** `module-35/`

- Data sources
- Terraform import
- Moving resources
- Refactoring infrastructure

---

### **Module 37: Module 36**
**Directory:** `module-36/`

- Terraform registry modules
- Publishing custom modules
- Module documentation
- Semantic versioning

---

### **Module 38: Module 37**
**Directory:** `module-37/`

- Testing Terraform code
- Terraform validate and fmt
- Terratest framework
- CI/CD for Terraform

---

### **Module 39: Module 38**
**Directory:** `module-38/`

- Advanced topics and best practices
- Production-ready configurations
- Cost optimization strategies
- Security hardening

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Arun-KumarRavi/TERRAFORM.git
cd TERRAFORM/AWS-TERRAFORM
```

### 2. Configure AWS Credentials

```bash
aws configure
```

Enter your:
- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g., `us-east-1`)
- Output format (e.g., `json`)

### 3. Navigate to a Module

```bash
cd Aws-ec2-module-12
```

### 4. Initialize Terraform

```bash
terraform init
```

### 5. Review the Execution Plan

```bash
terraform plan
```

### 6. Apply the Configuration

```bash
terraform apply
```

### 7. Destroy Resources (when done)

```bash
terraform destroy
```

---

## 📝 Best Practices

1. **Always use version control** - Track all infrastructure changes
2. **Use remote state** - Store state files in S3 with locking
3. **Implement modules** - Create reusable, composable infrastructure
4. **Document your code** - Add comments and README files
5. **Use variables** - Make configurations flexible and reusable
6. **Tag resources** - Organize and track AWS resources
7. **Review plans carefully** - Always check `terraform plan` before applying
8. **Use workspaces** - Manage multiple environments
9. **Secure sensitive data** - Use AWS Secrets Manager or Parameter Store
10. **Follow naming conventions** - Use consistent, descriptive names

---

## 🔐 Security Considerations

- Never commit AWS credentials or secrets to version control
- Use IAM roles with least privilege principle
- Enable encryption for S3 buckets and EBS volumes
- Implement proper security group rules
- Use private subnets for sensitive resources
- Enable VPC flow logs for network monitoring
- Regularly rotate credentials and keys
- Use AWS Secrets Manager for sensitive data

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-module`)
3. Commit your changes (`git commit -m 'Add new module'`)
4. Push to the branch (`git push origin feature/new-module`)
5. Open a Pull Request

---

## 📚 Additional Resources

- [Terraform Official Documentation](https://www.terraform.io/docs)
- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [HashiCorp Learn](https://learn.hashicorp.com/terraform)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

## 📄 License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

---

## 📧 Contact

For questions, suggestions, or feedback, please open an issue in this repository.

---

## 🎓 Learning Path Recommendation

### Beginner Track
1. Module 12-13: EC2 Basics
2. Module 14-16: Variables and Outputs
3. Module 17: S3 Buckets
4. Module 20-23: VPC Fundamentals

### Intermediate Track
1. Module 24-26: Environment Management
2. Module 27: Functions
3. Module 28: Multiple Resources
4. Module 19: Static Website Project

### Advanced Track
1. Module 29-30: IAM
2. Module 32-38: Advanced Concepts
3. State Management & Testing
4. Production Deployment Strategies

---

**Happy Learning! 🎉**

*Last Updated: January 2026*

# Topic: Automated SSH Key Pair Management

## What is an AWS Key Pair?
A key pair consists of a **public key** that AWS stores and a **private key** that you store. Together, they allow you to connect to your EC2 instances securely via SSH.

Normally, you create these in the AWS Console. This module teaches you how to automate the entire process using Terraform.

## Why Automate Key Pairs?
- **Security**: No need to share physical `.pem` files; the key can be generated on-the-fly.
- **Independence**: You don't need to manually visit the AWS console before running Terraform.
- **Traceability**: The key pair is tied to your Terraform state.

## How it Works (Learning Guide)

This configuration uses a two-step process:

### 1. Generating the Key (The `tls` Provider)
We use the `tls_private_key` resource to generate a secure RSA 4096-bit key. This happens locally within the Terraform process.
```hcl
resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
```

### 2. Registering with AWS
We then take the **public** portion of that generated key and send it to AWS.
```hcl
resource "aws_key_pair" "mykey" {
  key_name   = "mykeypair"
  public_key = tls_private_key.mykey.public_key_openssh
}
```

### 3. Using the Key
Finally, we tell our EC2 instance to use this specific key:
```hcl
key_name = aws_key_pair.mykey.key_name
```

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Extract the Private Key**: Since the private key is sensitive, Terraform hides it. To save it to a file so you can actually SSH, run:
   ```bash
   terraform output -raw private_key_pem > mykey.pem
   ```
4. **Set Permissions**: (Linux/Mac only)
   ```bash
   chmod 400 mykey.pem
   ```
5. **Connect**:
   ```bash
   ssh -i "mykey.pem" ec2-user@<your-instance-ip>
   ```

> [!WARNING]
> Never commit your `terraform.tfstate` file to GitHub after running this! It contains your private key in plain text. Always use `.gitignore`.

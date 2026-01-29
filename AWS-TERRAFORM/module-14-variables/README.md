# Topic 14: Input Variables (Parameterized Configuration)

## What are Input Variables?
Instead of hardcoding values like AMI IDs or instance types directly into your code, we use **variables**. Think of variables as the "arguments" or "parameters" of your Terraform configuration.

## Why use Variables?
- **DRY (Don't Repeat Yourself)**: Define a value once and use it many times.
- **Portability**: Reuse the same code for different environments (Production, Staging) by just changing the variable values.
- **Security**: Avoid hardcoding sensitive information (though secrets should usually be in a `.tfvars` file or environment variable).

## Learning Guide: How to define and use variables

### 1. The Definition (`variables.tf`)
We define what variables we expect, their type, and an optional default value.
```hcl
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Hardware size of the EC2"
}
```

### 2. The Usage (`main.tf`)
We reference the variable using the prefix `var.`.
```hcl
resource "aws_instance" "myec2" {
  instance_type = var.instance_type
}
```

## How to supply values to variables
Terraform looks for values in this order:
1.  **Command Line**: `terraform apply -var="instance_type=t3.medium"`
2.  **Variable Files**: Creating a file named `terraform.tfvars` or `anyname.auto.tfvars`.
3.  **Environment Variables**: `TF_VAR_instance_type=t3.medium`
4.  **Defaults**: If none of the above are provided, Terraform uses the `default` value in `variables.tf`.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply with Default**: Run `terraform apply` and don't provide anything. It will use `t2.micro`.
3. **Apply with Manual Override**:
   ```bash
   terraform apply -var="instance_type=t3.micro"
   ```
4. **Interactive Mode**: Delete the `default` value in `variables.tf` and run `terraform apply`. Terraform will prompt you to type the value in the terminal!

## Key Takeaways
- **Type Constraints**: Always define the `type` (e.g., `string`, `number`, `list`, `map`) to prevent errors.
- **Descriptions**: Always add a `description` to help other developers understand what the variable does.

> [!TIP]
> Use `.tfvars` files for managing many variables at once!

# Topic 24: Environment Variables & Precedence

## The Problem: Setting 100 Variables
If you have a complex project with 100 variables, you don't want to type them manually in the terminal every time you run `apply`. You also don't want to hardcode them in `variables.tf` because they might change between "Dev" and "Prod".

## The Solution: `.tfvars` Files
Terraform allows you to store variable values in files. This module teaches you the difference between standard `.tfvars` and the automatic `.auto.tfvars`.

## Learning Guide: Variable Loading Order

Terraform loads variables in a specific order. Each step overrides the one before it:

1.  **Environment Variables**: `TF_VAR_region=us-east-1` (Lowest priority).
2.  **`terraform.tfvars`**: Loaded automatically.
3.  **`*.auto.tfvars`**: Loaded automatically in alphabetical order.
4.  **CLI Flag**: `terraform apply -var="region=us-west-2"` (Highest priority).

## Comparison: `terraform.tfvars` vs `*.auto.tfvars`

### 1. `terraform.tfvars`
This is the standard place for your "default" project values. Terraform always looks for this exact filename.

### 2. `*.auto.tfvars`
You might have many of these (e.g., `networking.auto.tfvars`, `compute.auto.tfvars`). These are great for organizing values into logical groups. Terraform loads **all** files ending in `.auto.tfvars` automatically.

## Hands-on Tutorial

1. **Test `terraform.tfvars`**:
   - Go to the `terraform-tf-vars/` folder.
   - Run `terraform plan`.
   - Observe how it picked up the `instance_type` without you typing anything.
2. **Test `.auto.tfvars`**:
   - Go to the `terraform-auto-tfvars/` folder.
   - Run `terraform plan`.
   - Even if you have a `terraform.tfvars` file, the values in `.auto.tfvars` will take precedence if there is a conflict.

## Key Takeaways
- **Automation**: Use these files in your CI/CD pipelines to inject environment-specific settings.
- **Security**: **Never** put passwords in `.tfvars` files that you commit to Git. Instead, use a `.tfvars` file that is in your `.gitignore`, or use an environment variable.

> [!TIP]
> Use `.auto.tfvars` to split your values by service (e.g., `database.auto.tfvars`, `webserver.auto.tfvars`) for better organization!

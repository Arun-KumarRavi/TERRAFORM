# Topic 24: Advanced Variable Logic (Validation & Flattening)

## What is Advanced Variable Logic?
As your Terraform projects grow, you need better ways to ensure the data being passed in is correct and easy to work with. This module covers two powerful techniques: **Variable Validation** and **Data Flattening**.

## Why use this?
- **Validation**: Prevent "bad" values (like an invalid instance type) from ever reaching AWS, saving time and money.
- **Flattening**: Simplify complex nested lists and maps into a single, easy-to-use list.

## Learning Guide: Sub-Topics

### 1. Variable Validation (`/validate`)
Inside `variables.tf`, you can add a `validation` block. This block tests the input value against a rule and returns a custom error message if it fails.

```hcl
variable "instance_type" {
  type = string
  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only free-tier eligible instances (t2.micro, t3.micro) are allowed!"
  }
}
```

### 2. Flattening Data (`/flatten`)
Sometimes you have multiple lists (e.g., Public Subnets and Private Subnets) and you want to combine them into one list for a loop. The `flatten()` function is your best friend here.

```hcl
locals {
  all_subnets = flatten([var.public_subnets, var.private_subnets])
}
```

## Hands-on Tutorial

1. **Test Validation**:
   - Go to `validate/`.
   - Run `terraform apply -var="instance_type=m5.large"`.
   - **Observe**: Notice the custom error message you wrote!
2. **Test Flattening**:
   - Go to `flatten/`.
   - Run `terraform apply`.
   - **Observe**: Check the output. You see one single list containing all the subnet IDs you provided.

## Key Takeaways
- **Validation is early**: It happens before the `plan` is even finalized.
- **Flatten removes nesting**: If you have `[[1,2], [3,4]]`, flatten turns it into `[1,2,3,4]`.

> [!TIP]
> Use validation for naming conventions, environment names, and regions to keep your infrastructure consistent!

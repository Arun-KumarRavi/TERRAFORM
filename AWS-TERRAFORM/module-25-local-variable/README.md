# Topic 25: Local Values (Internal Constants)

## What are Local Values?
A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it. Think of them like **internal variables** that the user of your module *cannot* see or change.

## Why use Local Values?
- **DRY (Don't Repeat Yourself)**: If you use the same long strings or tags in 10 different resources, define them once in a `locals` block.
- **Readability**: Give complex expressions a simple name (e.g., `is_production = var.env == "prod" ? true : false`).
- **Standardization**: Enforce naming conventions like `project-env-resource`.

## Locals vs. Variables

| Feature | Input Variables (`var.`) | Local Values (`local.`) |
| :--- | :--- | :--- |
| **Purpose** | Arguments for the module | Internal module constants |
| **Visibility** | User can set these | Private to the code |
| **Usage** | `var.name` | `local.name` |

## Learning Guide: How this Module Works

### 1. Defining Locals
We define a `locals` block with the key-value pairs we need.
```hcl
locals {
  environment = "dev"
  name_prefix = "monica-app"
}
```

### 2. Using Locals
We reference them using the `local.` prefix.
```hcl
resource "aws_instance" "web" {
  tags = {
    # Interpolation combining a local with a string
    Name = "${local.name_prefix}-server"
  }
}
```

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Verify**: Check the tags on your EC2 instance in AWS. You will see `Name = monica-app-web`.
4. **Experiment**: Change the `name_prefix` in the `locals` block and run `terraform plan`. Notice how it updates multiple tags or names everywhere that local is used.

## Key Takeaways
- **Scope**: Locals are only visible within the folder where they are defined.
- **Dynamic**: You can use functions and logic inside locals.
- **No Overrides**: Unlike variables, you cannot override a local value from the command line.

> [!TIP]
> Use locals to build a "Common Tags" map that you apply to every resource in your project!

# Topic 26: Operators, Expressions, and `for` Loops

## What are Expressions in Terraform?
Terraform is not just about static configuration; it's a dynamic language. You can perform math, make comparisons, and transform data using **expressions**.

## Why use Logic in Terraform?
- **Data Transformation**: Convert a list of user objects into a list of just their names.
- **Filtering**: Only create resources for "odd-numbered" servers or "production" instances.
- **Dynamic Naming**: Calculate names based on a loop index.

## Learning Guide: Key Concepts

### 1. Basic Operators
Terraform supports standard math and comparison operators:
- `+`, `-`, `*`, `/` (Math)
- `==`, `!=`, `<`, `>` (Comparison)
- `&&`, `||`, `!` (Logical AND/OR/NOT)

### 2. The `for` Expression (Loops)
The `for` expression is used for transforming one collection into another.
- **Square Brackets `[]`**: Returns a **list**.
- **Curly Braces `{}`**: Returns a **map**.

#### Examples:
- **Doubling a list**: `[for x in var.list : x * 2]`
- **Filtering**: `[for x in var.list : x if x > 10]`
- **Accessing Objects**: `[for person in var.people : person.name]`

## How it Works (Logic Flow)
This module defines several variables (lists and maps) and uses `locals` to apply transformations to them. There are no AWS resources created here; this is a "pure logic" demonstration.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Experiment with Output**: Run `terraform apply` (or just `terraform plan` since there are no resources).
3. **Verify**: Check the outputs. You will see how `John, Jane, Jony` were extracted from the complex list of objects.
4. **Try it Yourself**:
   - Go to `main.tf`.
   - Add a new local: `upper_names = [for n in local.names : upper(n)]`.
   - Add it to `output.tf` and run `terraform apply`.

## Key Takeaways
- **Efficiency**: Use `for` expressions to avoid repetitive code.
- **Debugging**: If your `for` loop is getting too complex, consider breaking it down into multiple `local` blocks.
- **Maps**: When looping over a map, use `for k, v in var.map`.

> [!TIP]
> Use `terraform console` to test your expressions interactively without running a full `apply`!

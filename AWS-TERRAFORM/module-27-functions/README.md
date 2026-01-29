# Topic 27: Built-in Functions (String & List Handling)

## What are Terraform Functions?
The Terraform language includes many built-in functions that you can call from within expressions to transform and combine values. Note that you **cannot** define your own internal functions in Terraform (unlike Python or JavaScript); you can only use the ones provided by HashiCorp.

## Why use Functions?
- **Data Cleanup**: Remove whitespace or change case of server names.
- **Validation**: Check if a list contains a specific value.
- **Dynamic Content**: Join a list of subnets into a comma-separated string for a config file.

## Learning Guide: Categories of Functions

This module demonstrates two common categories:

### 1. String Functions
Used to manipulate text.
- `upper()` / `lower()`: Changes the casing of the string.
- `startswith()` / `endswith()`: Returns true/false based on a prefix or suffix.
- `join()`: Merges a list into a single string with a separator (e.g., `"-"`).

### 2. Collection Functions
Used to work with Lists and Maps.
- `length()`: Returns the number of items in a list or characters in a string.
- `contains()`: Checks if a specific element exists in a list.

## Hands-on Tutorial

1. **Wait! No Provider?**: Notice that `main.tf` has no provider block. This is because functions run locally on your machine during the `plan` phase. You don't need AWS to test these!
2. **Execute**: Run `terraform apply`.
3. **Verify**: Look at the sequence of outputs (`output_1` to `output_13`). See how "hello , world" was transformed into multiple formats.
4. **Interactive Practice**:
   - Run the command `terraform console`.
   - Type `upper("terraform is awesome")` and hit Enter.
   - Type `length(["a", "b", "c"])` and hit Enter.
   - Type `exit` to leave.

## Key Takeaways
- **Case Sensitivity**: Be careful! `contains(["A"], "a")` will return `false`.
- **Nesting**: You can nest functions, e.g., `upper(join("-", ["a", "b"]))`.

> [!TIP]
> Use the **Terraform Documentation** (Functions section) as a cheat sheet whenever you need to transform data.

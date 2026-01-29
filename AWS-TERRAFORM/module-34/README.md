# Topic 34: Advanced Lifecycle (Pre & Post Conditions)

## What are Lifecycle Conditions?
Terraform usually just follows orders. If you tell it to use a weird AMI, it will try. **Preconditions** and **Postconditions** allow you to add "Guardrails" to your code to ensure it is safe and valid.

## Why use Conditions?
- **Validation**: Ensure that a user-provided AMI ID starts with `ami-`.
- **Safety**: Prevent creating expensive resources if certain security rules aren't met.
- **Verification**: Check if AWS *actually* gave the resource an ID or a Public IP after it was created.

## Learning Guide: Pre vs. Post

### 1. Precondition
This check happens **BEFORE** Terraform does anything. If the condition fails, Terraform stops immediately and won't touch your AWS account.
```hcl
precondition {
  condition     = startswith(var.ami_id, "ami-")
  error_message = "Your AMI ID looks wrong! It should start with 'ami-'."
}
```

### 2. Postcondition
This check happens **AFTER** Terraform has finished the task. It checks the live data from AWS. If it fails, Terraform marks the run as a failure, even if the resource was created.
```hcl
postcondition {
  condition     = self.id != ""
  error_message = "The resource was created but something is wrong!"
}
```

## How it Works (Logic Flow)
1. **Plan Phase**: Terraform checks the `precondition`.
2. **Apply Phase**: Terraform creates the resource.
3. **Verify Phase**: Terraform checks the `postcondition` using the `self` keyword.

## Hands-on Tutorial

1. **Test Failure**:
   - Run `terraform apply -var="ami_id=invalid-id"`.
   - Observe how Terraform stops before even trying to talk to AWS.
2. **Test Success**:
   - Run `terraform apply` with the default valid AMI.
   - Observe the successful creation.

## Key Takeaways
- **User Friendly Errors**: You can write your own `error_message` that actually makes sense to a human.
- **`self` Reference**: In a postcondition, `self` refers to the resource being created.

> [!IMPORTANT]
> Use preconditions for validating user input and postconditions for verifying the final state of the infrastructure.

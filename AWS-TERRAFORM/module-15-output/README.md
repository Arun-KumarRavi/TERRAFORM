# Topic 15: Output Values (Data Retrieval)

## What are Output Values?
After Terraform finishes creating your infrastructure, it can "return" or "show" specific pieces of information about the resources it created. These are called **outputs**.

Think of variables as **Inputs** and outputs as **Return Values** from a function.

## Why use Outputs?
- **Visibility**: Easily see the Public IP of your new server without digging through the AWS console.
- **Consumption**: Pass data from one Terraform configuration to another.
- **Automation**: CI/CD pipelines use outputs to know which URLs to test or which resources were deployed.

## Learning Guide: Defining Outputs

### 1. The Definition (`output.tf`)
You specify the `value` you want to extract from a resource. Terraform uses "dot notation" to access resource attributes.
```hcl
output "instance_public_ip" {
  value       = aws_instance.myec2.public_ip
  description = "The public IP address of the server"
}
```

### 2. Accessing Attributes
In the example above, `aws_instance` is the resource type, `myec2` is the logical name, and `public_ip` is an attribute that AWS provides only *after* the instance is created.

## How to view outputs
1. **Automatically**: They appear in the terminal after a successful `terraform apply`.
2. **On Demand**: Run `terraform output` anytime to view all outputs.
3. **Specific Output**: Run `terraform output instance_public_ip` to get just one value.
4. **JSON Format**: Run `terraform output -json` for machine-readable data.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Observation**: At the very end of the output, you will see a section titled `Outputs:` listing the Instance ID, Public IP, and Name.
4. **Experiment**: Run `terraform output instance_id` and see how it only prints that specific value.

## Key Takeaways
- **Sensitive Outputs**: If an output contains a password or secret, add `sensitive = true` to hide it from the terminal log.
- **Post-hoc**: You can add or change outputs *after* creating resources and run `terraform apply` again—Terraform will only update the state and show the new outputs without changing the infrastructure.

> [!TIP]
> Use outputs to display the URL of a website or load balancer you just created!

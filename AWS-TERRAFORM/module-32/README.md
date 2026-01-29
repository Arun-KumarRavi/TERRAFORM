# Topic 32: Resource Dependencies (`depends_on`)

## What are Resource Dependencies?
Terraform is smart enough to figure out the order of operations most of the time. If a Subnet needs a VPC ID, Terraform creates the VPC first. This is called an **Implicit Dependency**.

Sometimes, however, Terraform can't see the link. **`depends_on`** is used to create an **Explicit Dependency**, telling Terraform: "Even if you don't think you need to, wait for Resource A to finish before starting Resource B."

## Why use `depends_on`?
- **Hidden Links**: Some resources depend on each other through internal AWS behavior that isn't visible in the Terraform code.
- **Ordered Bootstrapping**: Ensuring a Security Group is fully ready before launching an EC2 instance that uses it.
- **Reliability**: Preventing "ResourceNotFound" errors during a fast `apply`.

## Learning Guide: How to use it
The `depends_on` argument is a list of resource names. It can be added to any resource block.

```hcl
resource "aws_instance" "main" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"

  # Wait for the Security Group to be created first!
  depends_on = [aws_security_group.main]
}
```

## How it Works (Logic Flow)
1. **Plan**: Terraform builds a "Graph" of all resources.
2. **Sort**: It looks at the `depends_on` lists to decide the order.
3. **Execute**: It creates the Security Group, waits for a "Success" signal from AWS, and *only then* starts creating the EC2 instance.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Observation**: Watch the terminal output. Notice that the Security Group always finishes before the EC2 instance starts its "Creating..." phase.
4. **Experiment**: Remove the `depends_on` line and run `terraform destroy` followed by `apply`. Often, it will still work (because of implicit links), but in complex networks, it might fail!

## Key Takeaways
- **Use Sparingly**: Only use `depends_on` when you have to. Terraform's automatic ordering is very good.
- **List Format**: It is always a list `[]`, even if there is only one dependency.

> [!IMPORTANT]
> Overusing `depends_on` can make your Terraform runs slower because it prevents Terraform from creating resources in parallel.

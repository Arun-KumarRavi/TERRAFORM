# Topic 30: Creating Your Own Modules (Reusable Infrastructure)

## What is a Custom Module?
So far, you have been writing code in the "Root Module" (the folder you run `terraform apply` in). A **Custom Module** is a way to package up a group of resources (like a VPC + Subnets + RT) into a single, reusable component.

## Why Create Modules?
- **Abstraction**: Hide the complexity of 50 VPC resources behind a simple 10-line module call.
- **Consistency**: Ensure every team in your company builds VPCs the same way.
- **Version Control**: You can update the module in one place, and all projects using it can upgrade when they are ready.

## Learning Guide: How it Works

### 1. The Module Definition (`modules/vpc/`)
You put your `resource "aws_vpc"` etc. into a separate folder. This folder defines variables (inputs) and outputs.

### 2. Calling the Module (`main.tf`)
In your main project, you "call" the module using the `module` block and point to the `source` path.
```hcl
module "my_custom_vpc" {
  source   = "./modules/tf-own-module-vpc"
  vpc_cidr = "10.0.0.0/16"
}
```

## How it Works (Logic Flow)
1. **Source**: Terraform goes to the folder specified in `source`.
2. **Inputs**: It passes your variables into that folder.
3. **Execution**: It creates all the resources defined inside that folder.
4. **Outputs**: It returns any values (like `vpc_id`) back to your main code.

## Hands-on Tutorial

1. **Explore**: Go to the `modules/` folder and see how the VPC is defined.
2. **Observe**: Now look at `vpc-implementation-as-root.tf`. See how simple it is?
3. **Initialize**: `terraform init`.
4. **Apply**: `terraform apply`.
5. **Verify**: Terraform will show `module.my_custom_vpc.aws_vpc.main` as the resource name. This tells you the resource "belongs" to the module.

## Key Takeaways
- **The `source` argument**: Can be a local path, a GitHub URL, or the Terraform Registry.
- **Encapsulation**: Resources inside a module are private unless you explicitly "return" them via an `output` block.

> [!TIP]
> Think of a Module like a **Function** in programming. The `variables` are the arguments, and the `outputs` are the return values!

# Topic 28: Orchestrating Multiple Resources (High Availability Pattern)

## What is a High Availability (HA) Pattern?
In the cloud, we want our applications to survive failures. This means we shouldn't put all our servers in one "basket" (Subnet or Availability Zone). This module teaches you how to use Terraform to distribute servers across multiple subnets automatically.

## Why use this Pattern?
- **Resilience**: If one AWS subnet/zone has an issue, your other servers stay online.
- **Scalability**: Easily change from 4 servers to 40 by changing one number.
- **Automation**: Terraform handles the math of which server goes into which subnet.

## Learning Guide: The "Modulo" Secret

This module uses a clever trick in the `aws_instance` resource:

```hcl
subnet_id = element(
  aws_subnet.tf_vpc_subnet[*].id,
  count.index % 2
)
```

### How the math works:
If we have 2 subnets (Index 0 and 1) and we create 4 instances:
- Instance 0: `0 % 2 = 0` -> Subnet 0
- Instance 1: `1 % 2 = 1` -> Subnet 1
- Instance 2: `2 % 2 = 0` -> Subnet 0
- Instance 3: `3 % 2 = 1` -> Subnet 1

The servers are perfectly distributed!

## Code Breakdown

1.  **VPC & Subnets**: Creates the network foundation.
2.  **Security Group**: Opens Port 22 (SSH) for the entire VPC.
3.  **Data Source**: Dynamically finds the latest Amazon Linux 2 AMI.
4.  **Instances**: Launches 4 servers and places them round-robin across the subnets.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Verify**:
   - Go to the EC2 Dashboard.
   - Look at your 4 instances.
   - Verify that 2 are in "Subnet-0" and 2 are in "Subnet-1".
4. **Experiment**: Change the `count` on the `aws_instance` from 4 to 6 and run `apply`. Observe how Terraform launches 2 more servers and keeps the balance perfect.

## Key Takeaways
- **`element()` Function**: Safely picks an item from a list. It wraps around if the index is larger than the list size.
- **The `%` (Modulo) Operator**: Essential for "Round Robin" load balancing in infrastructure code.
- **`*` (Splat) Operator**: `aws_subnet.tf_vpc_subnet[*].id` converts a list of resource objects into a simple list of just their IDs.

> [!TIP]
> This is a basic version of what an **Auto Scaling Group (ASG)** does. Use this pattern when you need a fixed number of specific servers!

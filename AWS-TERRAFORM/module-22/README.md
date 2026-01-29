# Topic 22: Advanced Data Source Queries

## What is Advanced Data Querying?
Building on Topic 23, this module explores how to use Data Sources to link multiple related resources from your existing AWS environment without knowing their specific IDs.

## Why use this?
In large companies, networking teams often create the VPCs and Subnets. The Dev teams then "query" these existing resources to place their applications. This separates responsibilities and prevents "accidental destruction" of shared network infrastructure.

## Learning Guide: Filtering by Tags

This module focuses on how to find a VPC specifically by its **Tags** rather than just searching for the "Default" one.

```hcl
data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["prod-vpc"]
  }
}
```

### Key Attributes available from Data:
- `id`: The unique VPC ID.
- `cidr_block`: The IP range of the VPC.
- `main_route_table_id`: Useful for adding new routes.

## How it Works
1. Terraform searches your AWS account for a VPC with the tag `Name=prod-vpc`.
2. It fetches all the metadata for that VPC.
3. You can now use `data.aws_vpc.existing.id` in your EC2 or Subnet resources.

## Hands-on Tutorial

1. **Prerequisite**: Manually create a VPC in your console with the Tag `Name = prod-vpc`.
2. **Initialize**: `terraform init`
3. **Plan**: `terraform plan`
4. **Observation**: Notice that Terraform does **not** try to create a new VPC. It simply reads the data of the one you just created.

## Key Takeaways
- **No Resource Tag**: Data sources themselves don't have tags; they search *for* tags.
- **Error on Multiple**: If your filter matches *two* VPCs, Terraform will error because it doesn't know which one to pick. Be specific!

> [!TIP]
> Combine filters like `state = "available"` to ensure you don't pick a VPC that is currently being deleted.

# Topic: VPC Subnets, Route Tables, and Internet Gateway

## What are we building?
In this module, we are building a functional networking environment that can talk to the internet. We aren't just creating a "bucket" for resources (the VPC); we are adding the "doors" (IGW) and "road signs" (Route Tables) needed for traffic to flow.

## Core Components Breakdown:

### 1. The Internet Gateway (IGW)
An IGW is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.
```hcl
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
}
```

### 2. Route Tables (RT)
A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet or gateway is directed.
- **Public Route**: Points `0.0.0.0/0` (all traffic) to the `gateway_id` of the IGW.
- **Private Route**: Has no route to an internet gateway.

### 3. Route Table Association
This is the "glue" that connects a Subnet to a specific Route Table. Without this association, a subnet will use the VPC's main route table by default.

## Learning Guide: Traffic Flow
1. An instance in the **Public Subnet** wants to download a file from GitHub.
2. It looks at the **Public Route Table**.
3. The table says: "If the destination is anywhere outside this VPC (`0.0.0.0/0`), send the traffic to the **Internet Gateway**."
4. The IGW sends the request to the internet.

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply`
3. **Verify**:
   - Go to the AWS Console -> VPC -> Route Tables.
   - Find "public-route-table".
   - Click "Routes" and verify you see `0.0.0.0/0` pointing to an `igw-xxxxxxxx`.
4. **Experiment**: Try removing the `aws_route_table_association` for the public subnet and run `apply`. The subnet will become "private" because it won't know how to reach the IGW anymore!

## Key Takeaways
- **Implicit vs Explicit**: Always use **Explicit Associations** (like we do here) rather than relying on the "Main" route table. It's safer and clearer.
- **Security**: This setup doesn't have a NAT Gateway yet, so instances in the **Private Subnet** can't even reach the internet to download updates. They are truly isolated.

> [!IMPORTANT]
> A subnet is only "Public" if it has a route to an Internet Gateway.

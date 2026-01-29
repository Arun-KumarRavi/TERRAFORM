# Topic 20: Amazon VPC (Virtual Private Cloud)

## What is a VPC?
A **Virtual Private Cloud (VPC)** is your own private network in the AWS cloud. It is logically isolated from other virtual networks. You have complete control over your networking environment, including selection of your own IP address range, creation of subnets, and configuration of route tables and network gateways.

## Core Components of a VPC:

1.  **Subnets**: A range of IP addresses in your VPC.
    *   **Public Subnet**: Has a route to an Internet Gateway.
    *   **Private Subnet**: No direct route to the internet.
2.  **Internet Gateway (IGW)**: A gateway that allows communication between your VPC and the internet.
3.  **Route Tables**: A set of rules (routes) used to determine where network traffic is directed.
4.  **Security Groups**: A virtual firewall that controls inbound and outbound traffic for your EC2 instances.

## Why use a VPC?
- **Security**: Isolation from the public internet.
- **Organization**: Group related resources into subnets.
- **Connectivity**: Connect your cloud network to your on-premises data center.

## Learning Guide: Sub-Topics in this Module

This folder is broken down into progressive steps to help you master VPCs:

### 1. [VPC Subnet](./vpc-subnet/)
Learn how to define a CIDR block and create your first subnet.

### 2. [VPC Sub-RT-IGW](./vpc-sub-rt-igw/)
Connect your subnet to the internet using an Internet Gateway and Route Tables.

### 3. [VPC Full](./vpc-full/)
Build a complete architecture with both Public and Private subnets, plus Security Groups.

### 4. [VPC Peering](./vpc-peering/)
Learn how to connect two different VPCs together so they can talk to each other privately.

## Hands-on Tutorial

Pick a sub-folder and follow the README inside! We recommend starting with **vpc-subnet** and working your way up to **vpc-full**.

## Key Takeaways
- **CIDR Blocks**: Always choose an IP range that doesn't overlap with your home or office network (e.g., `10.0.0.0/16`).
- **Isolation**: Keep your databases in Private Subnets for maximum security.

> [!TIP]
> Use the **VPC Reachability Analyzer** in the AWS console to debug if your instances can't talk to the internet!

# Topic 21: NAT Gateways & Network ACLs (Advanced VPC Security)

## The Problem: Private Instances need Updates
In a secure network, your databases and backend servers are in a **Private Subnet** (no direct internet access). However, these servers still need to download security patches or talk to external APIs. How can they go "out" without letting the "bad guys" come "in"?

## The Solution: NAT Gateway
A **Network Address Translation (NAT) Gateway** allows instances in a private subnet to connect to the internet, but prevents the internet from initiating a connection with those instances.

## Why use NAT & NACLs?
- **NAT Gateway**: One-way internet access for your private servers.
- **Network ACLs (NACLs)**: A second layer of security at the **subnet level** (stateless), complementing Security Groups (stateful) which work at the **instance level**.

## Learning Guide: Component Breakdown

### 1. Elastic IP (`aws_eip`)
A NAT Gateway requires a static, public IP address so that when your private servers talk to the internet, they all "appear" to be coming from this one address.

### 2. NAT Gateway (`aws_nat_gateway`)
Placed in a **Public Subnet**. It acts as a middleman for the private servers.
```hcl
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}
```

### 3. Private Route Table
The private subnet's route table points all internet traffic (`0.0.0.0/0`) to the **NAT Gateway ID** instead of an Internet Gateway.

### 4. Network ACLs (`aws_network_acl`)
These are "stateless" firewalls. This means if you allow traffic "in" on port 80, you must also explicitly allow the response "out".

## Hands-on Tutorial

1. **Initialize**: `terraform init`
2. **Apply**: `terraform apply` (This may take 2-3 minutes as NAT Gateways are slow to provision).
3. **Verify**:
   - Go to VPC -> NAT Gateways. See your gateway and its Elastic IP.
   - Go to VPC -> Route Tables. Find the "private-route-table" and see it pointing to the NAT Gateway.
4. **Experiment**: Try changing a rule in the `private_acl` to "deny" and see how it blocks all traffic for the entire subnet.

## Key Takeaways
- **Cost**: NAT Gateways cost money per hour! Keep this in mind when practicing.
- **Placement**: A NAT Gateway **must** be in a public subnet to work.
- **SG vs NACL**: Security Groups are usually enough for most users. Use NACLs only if you need to block specific IP ranges or have very strict compliance needs.

> [!WARNING]
> NAT Gateways are one of the more expensive AWS resources. Remember to run `terraform destroy` when you are finished!

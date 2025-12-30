output "vpc_ids" {
  value = {
    VPC_A = aws_vpc.vpc_a.id
    VPC_B = aws_vpc.vpc_b.id
    VPC_C = aws_vpc.vpc_c.id
  }
}

output "subnet_ids" {
  value = {
    Public_A  = aws_subnet.public_a.id
    Private_A = aws_subnet.private_a.id
    Public_B  = aws_subnet.public_b.id
    Private_B = aws_subnet.private_b.id
    Public_C  = aws_subnet.public_c.id
    Private_C = aws_subnet.private_c.id
  }
}

output "peering_connection_ids" {
  value = {
    Peer_A_B = aws_vpc_peering_connection.peer_ab.id
    Peer_B_C = aws_vpc_peering_connection.peer_bc.id
    Peer_A_C = aws_vpc_peering_connection.peer_ac.id
  }
}

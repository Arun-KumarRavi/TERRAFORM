# VPC A routes to B & C
resource "aws_route" "rt_a_to_b" {
  route_table_id            = aws_route_table.private_rt_a.id
  destination_cidr_block    = aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ab.id
}

resource "aws_route" "rt_a_to_c" {
  route_table_id            = aws_route_table.private_rt_a.id
  destination_cidr_block    = aws_vpc.vpc_c.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ac.id
}

# VPC B routes to A & C
resource "aws_route" "rt_b_to_a" {
  route_table_id            = aws_route_table.private_rt_b.id
  destination_cidr_block    = aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ab.id
}

resource "aws_route" "rt_b_to_c" {
  route_table_id            = aws_route_table.private_rt_b.id
  destination_cidr_block    = aws_vpc.vpc_c.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_bc.id
}

# VPC C routes to A & B
resource "aws_route" "rt_c_to_a" {
  route_table_id            = aws_route_table.private_rt_c.id
  destination_cidr_block    = aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_ac.id
}

resource "aws_route" "rt_c_to_b" {
  route_table_id            = aws_route_table.private_rt_c.id
  destination_cidr_block    = aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer_bc.id
}

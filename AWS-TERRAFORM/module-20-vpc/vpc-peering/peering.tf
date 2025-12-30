resource "aws_vpc_peering_connection" "peer_ab" {
  vpc_id      = aws_vpc.vpc_a.id
  peer_vpc_id = aws_vpc.vpc_b.id
  auto_accept = true
  tags        = { Name = "Peer-A-B" }
}

resource "aws_vpc_peering_connection" "peer_bc" {
  vpc_id      = aws_vpc.vpc_b.id
  peer_vpc_id = aws_vpc.vpc_c.id
  auto_accept = true
  tags        = { Name = "Peer-B-C" }
}

resource "aws_vpc_peering_connection" "peer_ac" {
  vpc_id      = aws_vpc.vpc_a.id
  peer_vpc_id = aws_vpc.vpc_c.id
  auto_accept = true
  tags        = { Name = "Peer-A-C" }
}

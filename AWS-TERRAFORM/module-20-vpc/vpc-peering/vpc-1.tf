##### VPC 1  ####

resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "VPC-A" }
}

resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags   = { Name = "IGW-A" }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "Public-A" }
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "Private-A" }
}

resource "aws_route_table" "public_rt_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags   = { Name = "Public-RT-A" }
}

resource "aws_route" "public_rt_a_internet" {
  route_table_id         = aws_route_table.public_rt_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_a.id
}

resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt_a.id
}

resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags   = { Name = "Private-RT-A" }
}

resource "aws_route_table_association" "private_assoc_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_rt_a.id
}

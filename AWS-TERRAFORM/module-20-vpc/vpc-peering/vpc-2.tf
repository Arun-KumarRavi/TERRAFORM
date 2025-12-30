##### VPC 2  ####


resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
  tags = { Name = "VPC-B" }
}

resource "aws_internet_gateway" "igw_b" {
  vpc_id = aws_vpc.vpc_b.id
  tags   = { Name = "IGW-B" }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.vpc_b.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "Public-B" }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "Private-B" }
}

resource "aws_route_table" "public_rt_b" {
  vpc_id = aws_vpc.vpc_b.id
  tags   = { Name = "Public-RT-B" }
}

resource "aws_route" "public_rt_b_internet" {
  route_table_id         = aws_route_table.public_rt_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_b.id
}

resource "aws_route_table_association" "public_assoc_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt_b.id
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.vpc_b.id
  tags   = { Name = "Private-RT-B" }
}

resource "aws_route_table_association" "private_assoc_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private_rt_b.id
}


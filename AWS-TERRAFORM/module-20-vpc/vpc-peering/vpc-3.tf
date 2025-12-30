##### VPC 3  ####
resource "aws_vpc" "vpc_c" {
  cidr_block = "10.2.0.0/16"
  tags = { Name = "VPC-C" }
}

resource "aws_internet_gateway" "igw_c" {
  vpc_id = aws_vpc.vpc_c.id
  tags   = { Name = "IGW-C" }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.vpc_c.id
  cidr_block              = "10.2.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "Public-C" }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.vpc_c.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "Private-C" }
}

resource "aws_route_table" "public_rt_c" {
  vpc_id = aws_vpc.vpc_c.id
  tags   = { Name = "Public-RT-C" }
}

resource "aws_route" "public_rt_c_internet" {
  route_table_id         = aws_route_table.public_rt_c.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_c.id
}

resource "aws_route_table_association" "public_assoc_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_rt_c.id
}

resource "aws_route_table" "private_rt_c" {
  vpc_id = aws_vpc.vpc_c.id
  tags   = { Name = "Private-RT-C" }
}

resource "aws_route_table_association" "private_assoc_c" {
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_rt_c.id
}


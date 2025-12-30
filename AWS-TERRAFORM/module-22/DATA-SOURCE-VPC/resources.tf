# -----------------------------
# Data source: fetch existing VPC
# -----------------------------
data "aws_vpc" "default" {
  default = true
}

# -----------------------------
# Data source: fetch existing subnets
# -----------------------------
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# -----------------------------
# Data source: fetch latest Ubuntu AMI
# -----------------------------
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

# -----------------------------
# Example EC2 instance using data sources
# -----------------------------
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.default_subnets.ids[0]

  tags = {
    Name = "DataSource-Demo"
  }
}

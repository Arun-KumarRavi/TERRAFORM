# =========================
# Outputs
# =========================

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_subnet_ids" {
  value = data.aws_subnets.default_subnets.ids
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

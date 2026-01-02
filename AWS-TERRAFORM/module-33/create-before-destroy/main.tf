resource "aws_instance" "example_create" {
  ami           = "ami-0ecb62995f68bb549"   # replace with a valid AMI ID in your region
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "example-create-before-destroy"
  }
}

provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source = "./modules/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    vpc_name   = "implementing-vpc-using-own-module"
  }

  aws_subnets = {
    public_sub_1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      public            = true
    }

    public_sub_2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1b"
      public            = true
    }

    private_sub_3 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-1c"
      public            = false
    }
  }
}

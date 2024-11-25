provider "aws" {
    region = "eu-central-1"
    profile = "Cristian"
  
}

terraform {
  backend "s3" {
    bucket = "1-mighty-bucket-cristian"
    key    = "terraform.tfstate"
    region = "eu-central-1"
    profile = "Cristian"
  }
    
  }


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"


  name = "Cristian-VPC"
  cidr = "10.0.0.0/16"
  azs = ["eu-central-1a"]
  public_subnets = ["10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24"]


  public_subnet_tags = {
    Name = "Cristian-VPC-public"
  }

  private_subnet_tags = {
    Name = "Cristian-VPC-private"
  }

  tags = {
    Name = "Owner"
  }


}



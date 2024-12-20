provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "unique-terraform-state-bucket-hcl-3210"
    key            = "module/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "unique-terraform-state-lock-hcl-3210"
  }
}

module "high-level-module" {
  source                = "./high-level-module"
  vpc_name              = "my-vpc"
  vpc_cidr              = "10.0.0.0/16"
  subnet_cidrs          = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
}

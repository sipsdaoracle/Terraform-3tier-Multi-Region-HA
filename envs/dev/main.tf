terraform {
  backend "s3" {
    bucket         = "3tier-state-bucket-name"
    key            = "multi-region-ha/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "3tier-state-lock-table-name"
  }

 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.primary_region
}

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}

module "multi_region_ha" {
  source = "../.."

  providers = {
    aws.primary   = aws
    aws.secondary = aws.secondary
  }

  environment           = "dev"
  primary_region        = var.primary_region
  secondary_region      = var.secondary_region
  vpc_cidr_primary      = "10.0.0.0/16"
  vpc_cidr_secondary    = "10.1.0.0/16"
  instance_type         = "t3.micro"
  asg_min_size          = 2
  asg_max_size          = 4
  asg_desired_capacity  = 2
  db_name               = "3tierapp"
  db_username           = "admin"
}
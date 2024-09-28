provider "aws" {
  region = var.primary_region
  profile = "tf-sips-3tier"
}

provider "aws" {
  alias  = "secondary"
  region = var.secondary_region
}

module "vpc_primary" {
  source = "./modules/vpc"
  region = var.primary_region
  cidr   = var.vpc_cidr_primary
  name   = "${var.environment}-primary"
}

module "vpc_secondary" {
  source = "./modules/vpc"
  providers = {
    aws = aws.secondary
  }
  region = var.secondary_region
  cidr   = var.vpc_cidr_secondary
  name   = "${var.environment}-secondary"
}

module "elb_primary" {
  source        = "./modules/elb"
  name          = "${var.environment}-primary-elb"
  subnets       = module.vpc_primary.public_subnet_ids
  vpc_id        = module.vpc_primary.vpc_id
  instance_port = 80
}

module "elb_secondary" {
  source        = "./modules/elb"
  providers     = {
    aws = aws.secondary
  }
  name          = "${var.environment}-secondary-elb"
  subnets       = module.vpc_secondary.public_subnet_ids
  vpc_id        = module.vpc_secondary.vpc_id
  instance_port = 80
}

module "ec2_primary" {
  source           = "./modules/ec2"
  name             = "${var.environment}-primary-ec2"
  vpc_id           = module.vpc_primary.vpc_id
  subnet_ids       = module.vpc_primary.private_subnet_ids
  elb_name         = module.elb_primary.elb_name
  instance_type    = var.instance_type
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity
}

module "ec2_secondary" {
  source           = "./modules/ec2"
  providers        = {
    aws = aws.secondary
  }
  name             = "${var.environment}-secondary-ec2"
  vpc_id           = module.vpc_secondary.vpc_id
  subnet_ids       = module.vpc_secondary.private_subnet_ids
  elb_name         = module.elb_secondary.elb_name
  instance_type    = var.instance_type
  min_size         = var.asg_min_size
  max_size         = var.asg_max_size
  desired_capacity = var.asg_desired_capacity
}

module "rds_primary" {
  source      = "./modules/rds"
  name        = "${var.environment}-primary-rds"
  subnet_ids  = module.vpc_primary.private_subnet_ids
  vpc_id      = module.vpc_primary.vpc_id
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "rds_secondary" {
  source      = "./modules/rds"
  providers   = {
    aws = aws.secondary
  }
  name        = "${var.environment}-secondary-rds"
  subnet_ids  = module.vpc_secondary.private_subnet_ids
  vpc_id      = module.vpc_secondary.vpc_id
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

module "route53" {
  source            = "./modules/route53"
  domain_name       = var.domain_name
  primary_elb_dns   = module.elb_primary.elb_dns_name
  secondary_elb_dns = module.elb_secondary.elb_dns_name
}

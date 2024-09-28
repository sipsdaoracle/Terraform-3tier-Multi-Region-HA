module "multi_region_ha" {
  source = "../.."

  environment           = "dev"
  primary_region        = "us-east-1"
  secondary_region      = "us-west-2"
  vpc_cidr_primary      = "10.0.0.0/16"
  vpc_cidr_secondary    = "10.1.0.0/16"
  instance_type         = "t3.micro"
  asg_min_size          = 2
  asg_max_size          = 4
  asg_desired_capacity  = 2
  db_name               = "myapp"
  db_username           = "admin
}
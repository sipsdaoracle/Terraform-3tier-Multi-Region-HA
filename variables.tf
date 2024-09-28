variable "environment" {
  default = "dev"
}

variable "primary_region" {
  default = "us-east-1"
}

variable "secondary_region" {
  default = "us-west-2"
}

variable "vpc_cidr_primary" {
  default = "10.0.0.0/16"
}

variable "vpc_cidr_secondary" {
  default = "10.1.0.0/16"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "asg_min_size" {
  default = 2
}

variable "asg_max_size" {
  default = 4
}

variable "asg_desired_capacity" {
  default = 2
}

variable "db_name" {
  default = "myapp"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "Database password"
}

variable "domain_name" {
  default = "example.com"
}

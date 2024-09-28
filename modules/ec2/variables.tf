variable "name" {}
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "elb_name" {}
variable "instance_type" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
variable "elb_security_group_id" {}

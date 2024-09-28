variable "name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "ec2_security_group_id" {}

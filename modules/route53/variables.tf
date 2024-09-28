variable "domain_name" {
    description = "The domain name for the application"
    type        = string
  }
variable "primary_elb_dns" {
     description = "The elb dns name for the application"
     type        = string
}
variable "primary_elb_zone_id" {
    description = "The primary elb zone id for the application"
    type        = string
}
variable "secondary_elb_dns" {
     description = "The secondary elb dns for the application"
  type        = string
}
variable "secondary_elb_zone_id" {
     description = "The second elb zone for the application"
  type        = string
}

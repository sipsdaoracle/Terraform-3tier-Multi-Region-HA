variable "name" {
  description = "The name of the ELB"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ELB will be created"
  type        = string
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = list(string)
}

variable "instance_port" {
  description = "The port on the instance to route to"
  type        = number
  default     = 80
}

variable "instance_protocol" {
  description = "The protocol to use to the instance"
  type        = string
  default     = "HTTP"
}

variable "lb_port" {
  description = "The port to listen on for the load balancer"
  type        = number
  default     = 80
}

variable "lb_protocol" {
  description = "The protocol to listen on for the load balancer"
  type        = string
  default     = "HTTP"
}

variable "health_check_target" {
  description = "The target of the health check"
  type        = string
  default     = "HTTP:80/"
}

variable "health_check_interval" {
  description = "The interval between health checks"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "The length of time before the health check times out"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "The number of checks before the instance is declared healthy"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "The number of checks before the instance is declared unhealthy"
  type        = number
  default     = 2
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

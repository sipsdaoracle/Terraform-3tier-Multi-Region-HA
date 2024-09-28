output "primary_vpc_id" {
  value = module.vpc_primary.vpc_id
}

output "secondary_vpc_id" {
  value = module.vpc_secondary.vpc_id
}

output "primary_elb_dns" {
  value = module.elb_primary.elb_dns_name
}

output "secondary_elb_dns" {
  value = module.elb_secondary.elb_dns_name
}

output "primary_rds_endpoint" {
  value = module.rds_primary.rds_endpoint
}

output "secondary_rds_endpoint" {
  value = module.rds_secondary.rds_endpoint
}

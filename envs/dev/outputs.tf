output "primary_vpc_id" {
  value = module.multi_region_ha.primary_vpc_id
}

output "secondary_vpc_id" {
  value = module.multi_region_ha.secondary_vpc_id
}

output "primary_elb_dns" {
  value = module.multi_region_ha.primary_elb_dns
}

output "secondary_elb_dns" {
  value = module.multi_region_ha.secondary_elb_dns
}

output "primary_rds_endpoint" {
  value = module.multi_region_ha.primary_rds_endpoint
}

output "secondary_rds_endpoint" {
  value = module.multi_region_ha.secondary_rds_endpoint
}


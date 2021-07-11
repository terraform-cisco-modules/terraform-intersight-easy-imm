output "domain_profile" {
  description = "moid of the UCS Domain Profile."
  value       = module.domain_profile
}

output "domain_profile_a" {
  description = "UCS Domain Profile Switch A Outputs."
  value = {
    model  = data.intersight_network_element_summary.fabric_interconnect_a.results.0.model
    moid   = module.domain_profile_a.moid
    serial = data.intersight_network_element_summary.fabric_interconnect_a.results.0.serial
  }
}

output "domain_profile_b" {
  description = "UCS Domain Profile Switch B Outputs."
  value = {
    model  = data.intersight_network_element_summary.fabric_interconnect_b.results.0.model
    moid   = module.domain_profile_b.moid
    serial = data.intersight_network_element_summary.fabric_interconnect_b.results.0.serial
  }
}

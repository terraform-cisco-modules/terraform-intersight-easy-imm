#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_domain_profiles" {
  description = "moid of the UCS Domain Profiles."
  value       = { for v in sort(keys(module.ucs_domain_profiles)) : v => module.ucs_domain_profiles[v].moid }
}

output "profiles_ucs_domain" {
  description = "output local.ucs_domain_profiles."
  value       = local.ucs_domain_profiles
}


#__________________________________________________________
#
# UCS Domain Profile - Fabric A Outputs
#__________________________________________________________

output "ucs_domain_profiles_a" {
  description = "UCS Domain Profile - Fabric Interconnect A moids."
  value       = { for v in sort(keys(module.ucs_domain_profiles_a)) : v => module.ucs_domain_profiles_a[v].moid }
}

output "ucs_domain_profiles_a_hardware" {
  description = "Fabric Interconnect A Hardware Information."
  value = {
    for v in sort(keys(data.intersight_network_element_summary.fi_a)) : v => {
      model  = data.intersight_network_element_summary.fi_a[v].results.0.model
      serial = data.intersight_network_element_summary.fi_a[v].results.0.serial
    } if local.ucs_domain_profiles[v].assign_switches != false
  }
}


#__________________________________________________________
#
# UCS Domain Profile - Fabric B Outputs
#__________________________________________________________

output "ucs_domain_profiles_b" {
  description = "UCS Domain Profile - Fabric Interconnect B moids."
  value       = { for v in sort(keys(module.ucs_domain_profiles_b)) : v => module.ucs_domain_profiles_b[v].moid }
}

output "ucs_domain_profiles_b_hardware" {
  description = "Fabric Interconnect B Hardware Information."
  value = {
    for v in sort(keys(data.intersight_network_element_summary.fi_b)) : v => {
      model  = data.intersight_network_element_summary.fi_b[v].results.0.model
      serial = data.intersight_network_element_summary.fi_b[v].results.0.serial
    } if local.ucs_domain_profiles[v].assign_switches != false
  }
}

#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_domain_profile" {
  description = "moid of the UCS Domain Profiles."
  value       = { for v in sort(keys(module.ucs_domain_profile)) : v => module.ucs_domain_profile[v].moid }
}


#__________________________________________________________
#
# UCS Domain Profile - Fabric A Outputs
#__________________________________________________________

output "ucs_domain_profile_a" {
  description = "UCS Domain Profile - Fabric Interconnect A moids."
  value       = { for v in sort(keys(module.ucs_domain_profile_a)) : v => module.ucs_domain_profile_a[v].moid }
}

output "ucs_domain_profile_a_hardware" {
  description = "Fabric Interconnect A Hardware Information."
  value = var.assign_switches == true ? {
    for v in sort(keys(data.intersight_network_element_summary.fi_a)) : v => {
      model  = data.intersight_network_element_summary.fi_a[v].results.0.model
      serial = data.intersight_network_element_summary.fi_a[v].results.0.serial
    }
  } : {}
}


#__________________________________________________________
#
# UCS Domain Profile - Fabric B Outputs
#__________________________________________________________

output "ucs_domain_profile_b" {
  description = "UCS Domain Profile - Fabric Interconnect B moids."
  value       = { for v in sort(keys(module.ucs_domain_profile_b)) : v => module.ucs_domain_profile_b[v].moid }
}

output "ucs_domain_profile_b_hardware" {
  description = "Fabric Interconnect B Hardware Information."
  value = var.assign_switches == true ? {
    for v in sort(keys(data.intersight_network_element_summary.fi_b)) : v => {
      model  = data.intersight_network_element_summary.fi_b[v].results.0.model
      serial = data.intersight_network_element_summary.fi_b[v].results.0.serial
    }
  } : {}
}

#__________________________________________________________
#
# UCS Domain VLAN Policy Outputs
#__________________________________________________________

output "vlan_policy" {
  description = "moid of the UCS Domain VLAN Policies."
  value       = { for v in sort(keys(module.vlan_policy)) : v => module.vlan_policy[v].moid }
}



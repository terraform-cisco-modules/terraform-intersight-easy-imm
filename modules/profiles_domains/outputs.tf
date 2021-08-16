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
# UCS Domain Profile - Outputs
#__________________________________________________________

output "ucs_domain_profiles_a" {
  description = "UCS Domain Profile - Fabric Interconnect A moids."
  value       = { for v in sort(keys(module.ucs_domain_profiles_a)) : v => module.ucs_domain_profiles_a[v].moid }
}

output "ucs_domain_profiles_b" {
  description = "UCS Domain Profile - Fabric Interconnect B moids."
  value       = { for v in sort(keys(module.ucs_domain_profiles_b)) : v => module.ucs_domain_profiles_b[v].moid }
}

output "ucs_domain_profiles_a_hardware" {
  description = "Fabric Interconnect A Hardware Information."
  value = {
    for v in sort(keys(data.intersight_network_element_summary.fi_a)) : v => {
      model  = data.intersight_network_element_summary.fi_a[v].results.0.model
      serial = data.intersight_network_element_summary.fi_a[v].results.0.serial
    } if local.ucs_domain_profiles[v].profile.assign_switches != false
  }
}

output "ucs_domain_profiles_b_hardware" {
  description = "Fabric Interconnect B Hardware Information."
  value = {
    for v in sort(keys(data.intersight_network_element_summary.fi_b)) : v => {
      model  = data.intersight_network_element_summary.fi_b[v].results.0.model
      serial = data.intersight_network_element_summary.fi_b[v].results.0.serial
    } if local.ucs_domain_profiles[v].profile.assign_switches != false
  }
}


#__________________________________________________________
#
# Flow Control Policy Outputs
#__________________________________________________________

output "policies_flow_control" {
  value = {
    for v in sort(keys(module.policies_flow_control)) : v => module.policies_flow_control[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Link Aggregation Policy Outputs
#__________________________________________________________

output "policies_link_aggregation" {
  value = {
    for v in sort(keys(module.policies_link_aggregation)) : v => module.policies_link_aggregation[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Link Control Policy Outputs
#__________________________________________________________

output "policies_link_control" {
  value = {
    for v in sort(keys(module.policies_link_control)) : v => module.policies_link_control[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Network Connectivity (DNS) Policy Outputs
#__________________________________________________________

output "policies_network_connectivity" {
  value = {
    for v in sort(keys(module.policies_network_connectivity)) : v => module.policies_network_connectivity[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# NTP Policy Outputs
#__________________________________________________________

output "policies_ntp" {
  value = {
    for v in sort(keys(module.policies_ntp)) : v => module.policies_ntp[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Port Channel LAN Policy Outputs
#__________________________________________________________

output "policies_port_channel_lan_a" {
  value = {
    for v in sort(keys(module.policies_port_channel_lan_a)) : v => module.policies_port_channel_lan_a[v].moid
    if v != null
  }
}

output "policies_port_channel_lan_b" {
  value = {
    for v in sort(keys(module.policies_port_channel_lan_b)) : v => module.policies_port_channel_lan_b[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# SNMP Policy Outputs
#__________________________________________________________

output "policies_snmp" {
  value = {
    for v in sort(keys(module.policies_snmp)) : v => module.policies_snmp[v].moid
    if v != null
  }
}

output "policies_snmp_1_user" {
  value = {
    for v in sort(keys(module.policies_snmp_1_user)) : v => module.policies_snmp_1_user[v].moid
    if v != null
  }
}

output "policies_snmp_2_users" {
  value = {
    for v in sort(keys(module.policies_snmp_2_users)) : v => module.policies_snmp_2_users[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Switch Control Policy Outputs
#__________________________________________________________

output "policies_switch_control" {
  value = {
    for v in sort(keys(module.policies_switch_control)) : v => module.policies_switch_control[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Syslog Policy Outputs
#__________________________________________________________

output "policies_syslog" {
  value = {
    for v in sort(keys(module.policies_syslog)) : v => module.policies_syslog[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# System QoS Policy Outputs
#__________________________________________________________

output "policies_system_qos_1" {
  value = {
    for v in sort(keys(module.policies_system_qos_1)) : v => module.policies_system_qos_1[v].moid
    if v != null
  }
}

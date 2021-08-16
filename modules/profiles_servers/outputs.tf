#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_server_profiles" {
  description = "moid of the UCS Server Profiles."
  value = {
    for v in sort(keys(module.ucs_server_profiles)) : v => {
      moid = module.ucs_server_profiles[v].moid
      name = module.ucs_server_profiles[v].name
    }
  }
}


#__________________________________________________________
#
# UCS Server Moid
#__________________________________________________________

output "physical_servers" {
  description = "Moid of the Physical Servers in the Account."
  value = {
    for v in sort(keys(data.intersight_compute_physical_summary.server)) : v => {
      moid        = data.intersight_compute_physical_summary.server[v].results[0].moid
      name        = data.intersight_compute_physical_summary.server[v].results[0].name
      object_type = data.intersight_compute_physical_summary.server[v].results[0].source_object_type
    } if v != null
  }
}

#__________________________________________________________
#
# BIOS Policy Outputs
#__________________________________________________________

output "policies_bios_nvmeof" {
  value = {
    for v in sort(keys(module.policies_bios_nvmeof)) : v => module.policies_bios_nvmeof[v].moid
    if v != null
  }
}

output "policies_bios_virtual_node" {
  value = {
    for v in sort(keys(module.policies_bios_virtual_node)) : v => module.policies_bios_virtual_node[v].moid
    if v != null
  }
}

output "policies_bios_virtual_rack" {
  value = {
    for v in sort(keys(module.policies_bios_virtual_rack)) : v => module.policies_bios_virtual_rack[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Boot Order Policy Outputs
#__________________________________________________________

output "policies_boot_order" {
  value = {
    for v in sort(keys(module.policies_boot_order)) : v => module.policies_boot_order[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Device Connector Policy Outputs
#__________________________________________________________

output "policies_device_connector" {
  value = {
    for v in sort(keys(module.policies_device_connector)) : v => module.policies_device_connector[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# IMC Access Policy Outputs
#__________________________________________________________

output "policies_imc_access" {
  value = {
    for v in sort(keys(module.policies_imc_access)) : v => module.policies_imc_access[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# IPMI over LAN Policy Outputs
#__________________________________________________________

output "policies_ipmi_over_lan" {
  value = {
    for v in sort(keys(module.policies_ipmi_over_lan)) : v => module.policies_ipmi_over_lan[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# LDAP Policy Outputs
#__________________________________________________________

output "policies_ldap" {
  value = {
    for v in sort(keys(module.policies_ldap)) : v => module.policies_ldap[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Local User Policy Outputs
#__________________________________________________________

output "policies_local_users" {
  value = {
    for v in sort(keys(module.policies_local_users)) : v => module.policies_local_users[v].moid
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
# (vNIC) LAN Connectivity Policy Outputs
#__________________________________________________________

output "vnic_lan_connectivity" {
  value = {
    for v in sort(keys(module.vnic_lan_connectivity)) : v => module.vnic_lan_connectivity[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet (vNIC) Adapter Policy Outputs
#__________________________________________________________

output "vnic_adapter" {
  value = {
    for v in sort(keys(module.vnic_adapter)) : v => module.vnic_adapter[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet (vNIC) Network Control Policy Outputs
#__________________________________________________________

output "vnic_network_control_policy" {
  value = {
    for v in sort(keys(module.vnic_network_control_policy)) : v => module.vnic_network_control_policy[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet (vNIC) Network Group (VLAN Groups) Policy Outputs
#__________________________________________________________

output "vnic_vlan_group" {
  value = {
    for v in sort(keys(module.vnic_vlan_group)) : v => module.vnic_vlan_group[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet (vNIC) QoS Policy Outputs
#__________________________________________________________

output "vnic_qos" {
  value = {
    for v in sort(keys(module.vnic_qos)) : v => module.vnic_qos[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet (vNIC) Template Outputs
#__________________________________________________________

output "vnic_templates_a" {
  value = {
    for v in sort(keys(module.vnic_templates_a)) : v => module.vnic_templates_a[v].moid
    if v != null
  }
}

output "vnic_templates_b" {
  value = {
    for v in sort(keys(module.vnic_templates_b)) : v => module.vnic_templates_b[v].moid
    if v != null
  }
}

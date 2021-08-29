
#__________________________________________________________
#
# BIOS Policy Outputs
#__________________________________________________________

output "bios_policies_nvmeof" {
  value = {
    for v in sort(keys(module.bios_policies_nvmeof)) : v => module.bios_policies_nvmeof[v].moid
    if v != null
  }
}

output "bios_policies_virtual_node" {
  value = {
    for v in sort(keys(module.bios_policies_virtual_node)) : v => module.bios_policies_virtual_node[v].moid
    if v != null
  }
}

output "bios_policies_virtual_rack" {
  value = {
    for v in sort(keys(module.bios_policies_virtual_rack)) : v => module.bios_policies_virtual_rack[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Boot Order Policy Outputs
#__________________________________________________________

output "boot_order_policies" {
  value = {
    for v in sort(keys(module.boot_order_policies)) : v => module.boot_order_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Device Connector Policy Outputs
#__________________________________________________________

output "device_connector_policies" {
  value = {
    for v in sort(keys(module.device_connector_policies)) : v => module.device_connector_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet Adapter Policy Outputs
#__________________________________________________________

output "ethernet_adapter" {
  value = {
    for v in sort(keys(module.ethernet_adapter)) : v => module.ethernet_adapter[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet Network Control Policy Outputs
#__________________________________________________________

output "ethernet_network_control_policy" {
  value = {
    for v in sort(keys(module.ethernet_network_control_policy)) : v => module.ethernet_network_control_policy[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet Network Group (VLAN Groups) Policy Outputs
#__________________________________________________________

output "ethernet_vlan_group" {
  value = {
    for v in sort(keys(module.ethernet_vlan_group)) : v => module.ethernet_vlan_group[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Ethernet QoS Policy Outputs
#__________________________________________________________

output "ethernet_qos" {
  value = {
    for v in sort(keys(module.ethernet_qos)) : v => module.ethernet_qos[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Flow Control Policy Outputs
#__________________________________________________________

output "flow_control_policies" {
  value = {
    for v in sort(keys(module.flow_control_policies)) : v => module.flow_control_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Link Aggregation Policy Outputs
#__________________________________________________________

output "link_aggregation_policies" {
  value = {
    for v in sort(keys(module.link_aggregation_policies)) : v => module.link_aggregation_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Link Control Policy Outputs
#__________________________________________________________

output "link_control_policies" {
  value = {
    for v in sort(keys(module.link_control_policies)) : v => module.link_control_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# IMC Access Policy Outputs
#__________________________________________________________

output "imc_access_policies" {
  value = {
    for v in sort(keys(module.imc_access_policies)) : v => module.imc_access_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# IPMI over LAN Policy Outputs
#__________________________________________________________

output "ipmi_over_lan_policies" {
  value = {
    for v in sort(keys(module.ipmi_over_lan_policies)) : v => module.ipmi_over_lan_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# LAN Connectivity Policy Outputs
#__________________________________________________________

output "lan_connectivity" {
  value = {
    for v in sort(keys(module.lan_connectivity)) : v => module.lan_connectivity[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# LAN Connectivity - vNIC Outputs
#__________________________________________________________

output "lan_connectivity_vnic_a" {
  value = {
    for v in sort(keys(module.lan_connectivity_vnic_a)) : v => module.lan_connectivity_vnic_a[v].moid
    if v != null
  }
}

output "lan_connectivity_vnic_b" {
  value = {
    for v in sort(keys(module.lan_connectivity_vnic_b)) : v => module.lan_connectivity_vnic_b[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# LDAP Policy Outputs
#__________________________________________________________

output "ldap_policies" {
  value = {
    for v in sort(keys(module.ldap_policies)) : v => module.ldap_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Local User Policy Outputs
#__________________________________________________________

output "local_user_policies" {
  value = {
    for v in sort(keys(module.local_user_policies)) : v => module.local_user_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Network Connectivity (DNS) Policy Outputs
#__________________________________________________________

output "network_connectivity_policies" {
  value = {
    for v in sort(keys(module.network_connectivity_policies)) : v => module.network_connectivity_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# NTP Policy Outputs
#__________________________________________________________

output "ntp_policies" {
  value = {
    for v in sort(keys(module.ntp_policies)) : v => module.ntp_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Port Policies - Ethernet Port Channel Policy Outputs
#__________________________________________________________

output "port_policies_ethernet_uplink_port_channel_a" {
  value = {
    for v in sort(keys(module.port_policies_ethernet_uplink_port_channel_a)) : v => module.port_policies_ethernet_uplink_port_channel_a[v].moid
    if v != null
  }
}

output "port_policies_ethernet_uplink_port_channel_b" {
  value = {
    for v in sort(keys(module.port_policies_ethernet_uplink_port_channel_b)) : v => module.port_policies_ethernet_uplink_port_channel_b[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Power Policy Outputs
#__________________________________________________________

output "power_policies" {
  value = {
    for v in sort(keys(module.power_policies)) : v => module.power_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# SNMP Policy Outputs
#__________________________________________________________

output "snmp_policies" {
  value = {
    for v in sort(keys(module.snmp_policies)) : v => module.snmp_policies[v].moid
    if v != null
  }
}

output "snmp_policies_1_user" {
  value = {
    for v in sort(keys(module.snmp_policies_1_user)) : v => module.snmp_policies_1_user[v].moid
    if v != null
  }
}

output "snmp_policies_2_users" {
  value = {
    for v in sort(keys(module.snmp_policies_2_users)) : v => module.snmp_policies_2_users[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Switch Control Policy Outputs
#__________________________________________________________

output "switch_control_policies" {
  value = {
    for v in sort(keys(module.switch_control_policies)) : v => module.switch_control_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Syslog Policy Outputs
#__________________________________________________________

output "syslog_policies" {
  value = {
    for v in sort(keys(module.syslog_policies)) : v => module.syslog_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# System QoS Policy Outputs
#__________________________________________________________

output "system_qos_policies_1" {
  value = {
    for v in sort(keys(module.system_qos_policies_1)) : v => module.system_qos_policies_1[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# Thermal Policy Outputs
#__________________________________________________________

output "thermal_policies" {
  value = {
    for v in sort(keys(module.thermal_policies)) : v => module.thermal_policies[v].moid
    if v != null
  }
}


#__________________________________________________________
#
# UCS Chassis Profile Outputs
#__________________________________________________________

output "ucs_chassis_profiles" {
  description = "moid of the UCS Chassis Profiles."
  value = {
    for v in sort(keys(module.ucs_chassis_profiles)) : v => {
      moid = module.ucs_chassis_profiles[v].moid
      name = module.ucs_chassis_profiles[v].name
    }
  }
}


#__________________________________________________________
#
# UCS Chassis Hardware Moid
#__________________________________________________________

output "physical_chassis" {
  description = "Moid of the Physical Chassis in the Account."
  value = {
    for v in sort(keys(data.intersight_equipment_chassis.chassis)) : v => {
      moid  = data.intersight_equipment_chassis.chassis[v].results[0].moid
      model = data.intersight_equipment_chassis.chassis[v].results[0].model
      name  = data.intersight_equipment_chassis.chassis[v].results[0].name
    }
  }
}


#__________________________________________________________
#
# UCS Domain Profile Outputs
#__________________________________________________________

output "ucs_domain_profiles" {
  description = "moid of the UCS Domain Profiles."
  value       = { for v in sort(keys(module.ucs_domain_profiles)) : v => module.ucs_domain_profiles[v].moid }
}


#__________________________________________________________
#
# UCS Domain Profile - Switch - Outputs
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
# UCS Server Profiles Outputs
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
# UCS Servers Hardware Moid
#__________________________________________________________

output "ucs_servers_physical" {
  description = "Moid of the Physical Servers in the Account."
  value = {
    for v in sort(keys(data.intersight_compute_physical_summary.server)) : v => {
      moid        = data.intersight_compute_physical_summary.server[v].results[0].moid
      model       = data.intersight_compute_physical_summary.server[v].results[0].model
      name        = data.intersight_compute_physical_summary.server[v].results[0].name
      object_type = data.intersight_compute_physical_summary.server[v].results[0].source_object_type
    } if v != null
  }
}

#______________________________________________
#
# UCS Domain Profiles
#______________________________________________

ucs_domain_profiles = {
  "#Organization#" = {
    action                      = "No-op"
    assign_switches             = false
    description                 = "#Organization# UCS Domain Profile."
    device_model                = "UCS-FI-6454" # Options are UCS-FI-6454 or UCS-FI-64108 Currently
    network_connectivity_policy = "#Organization#_dns"
    ntp_policy                  = "#Organization#_ntp"
    organization                = "#Organization#"
    port_policy_fabric_a        = "#Organization#_Fabric_A"
    port_policy_fabric_b        = "#Organization#_Fabric_B"
    snmp_policy                 = "#Organization#_snmp"
    serial_number_fabric_a      = ""
    serial_number_fabric_b      = ""
    switch_control_policy       = "#Organization#_swctrl"
    syslog_policy               = "#Organization#_syslog"
    system_qos_policy           = "#Organization#_system_qos"
    vlan_policy_fabric_a        = "#Organization#_vlans"
    vlan_policy_fabric_b        = "#Organization#_vlans"
    vsan_policy_fabric_a        = "#Organization#_Fabric_A"
    vsan_policy_fabric_b        = "#Organization#_Fabric_B"
    tags                        = []
  }
}

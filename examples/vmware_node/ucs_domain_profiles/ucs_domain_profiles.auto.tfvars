#______________________________________________
#
# UCS Domain Profiles
#______________________________________________

ucs_domain_profiles = {
  "#domain_name#" = {
    action                      = "No-op"
    assign_switches             = false
    description                 = "UCS Domain Profile."
    device_model                = "UCS-FI-6454" # Options are UCS-FI-6454 or UCS-FI-64108 Currently
    network_connectivity_policy = "dns"
    ntp_policy                  = "ntp"
    port_policy_fabric_a        = "Fabric_A"
    port_policy_fabric_b        = "Fabric_B"
    snmp_policy                 = "snmp"
    serial_number_fabric_a      = ""
    serial_number_fabric_b      = ""
    switch_control_policy       = "swctrl"
    syslog_policy               = "syslog"
    system_qos_policy           = "system_qos"
    vlan_policy_fabric_a        = "vlans"
    vlan_policy_fabric_b        = "vlans"
    vsan_policy_fabric_a        = "Fabric_A"
    vsan_policy_fabric_b        = "Fabric_B"
    tags                        = []
  }
}

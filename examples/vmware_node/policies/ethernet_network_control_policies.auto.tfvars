#______________________________________________
#
# Ethernet Network Control Policy Variables
#______________________________________________

ethernet_network_control_policies = {
  "both_enabled" = {
    cdp_enable           = true
    description          = "Both CDP and LLDP Enabled Network Control Policy."
    lldp_enable_receive  = true
    lldp_enable_transmit = true
    mac_register_mode    = "allVlans"
    mac_security_forge   = "allow"
    tags                 = []
  }
  "cdp_enabled" = {
    cdp_enable           = true
    description          = "CDP Enabled Network Control Policy."
    lldp_enable_receive  = false
    lldp_enable_transmit = false
    mac_register_mode    = "allVlans"
    mac_security_forge   = "allow"
    tags                 = []
  }
  "lldp_enabled" = {
    cdp_enable           = false
    description          = "LLDP Enabled Network Control Policy."
    lldp_enable_receive  = true
    lldp_enable_transmit = true
    mac_register_mode    = "allVlans"
    mac_security_forge   = "allow"
    tags                 = []
  }
}

#______________________________________________
#
# Ethernet Network Control Policy Variables
#______________________________________________

ethernet_network_control_policies = {
  "#Organization#_both_enabled" = {
    cdp_enable            = true
    description           = "#Organization# Both CDP and LLDP Enabled Network Control Policy."
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "allVlans"
    mac_security_forge    = "allow"
    organization          = "#Organization#"
    tags                  = []
  }
  "#Organization#_cdp_enabled" = {
    cdp_enable           = true
    description          = "#Organization# CDP Enabled Network Control Policy."
    lldp_enable_receive  = false
    lldp_enable_transmit = false
    mac_register_mode    = "allVlans"
    mac_security_forge   = "allow"
    organization         = "#Organization#"
    tags                 = []
  }
  "#Organization#_lldp_enabled" = {
    cdp_enable           = false
    description          = "#Organization# LLDP Enabled Network Control Policy."
    lldp_enable_receive  = true
    lldp_enable_transmit = true
    mac_register_mode    = "allVlans"
    mac_security_forge   = "allow"
    organization         = "#Organization#"
    tags                 = []
  }
}

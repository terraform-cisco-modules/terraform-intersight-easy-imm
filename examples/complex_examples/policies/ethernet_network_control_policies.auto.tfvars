#______________________________________________
#
# Ethernet Network Control Policy Variables
#______________________________________________

ethernet_network_control_policies = {
  "UCS-DEMO2_appliance" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = false
    description           = ""
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
  "ncp-appliance_appliance" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = true
    description           = ""
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
  "CDP-enable" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = true
    description           = ""
    lldp_enable_receive   = false
    lldp_enable_transmit  = false
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
  "CDP-LLDP-ENABLE" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = true
    description           = ""
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
  "default" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = false
    description           = ""
    lldp_enable_receive   = false
    lldp_enable_transmit  = false
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
  "Enable-CDP-LLDP" = {
    action_on_uplink_fail = "linkDown"
    cdp_enable            = true
    description           = ""
    lldp_enable_receive   = true
    lldp_enable_transmit  = true
    mac_register_mode     = "nativeVlanOnly"
    mac_security_forge    = "allow"
    tags                  = []
  }
}

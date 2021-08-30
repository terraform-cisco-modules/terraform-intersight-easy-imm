#_________________________________________________________________________
#
# Ethernet Network Control Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet Network Control
#_________________________________________________________________________

variable "ethernet_network_control_policies" {
  default {
    default = {
      action_on_uplink_fail = "linkDown"
      cdp_enable            = false
      description           = ""
      lldp_enable_receive   = false
      lldp_enable_transmit  = false
      mac_register_mode     = "nativeVlanOnly"
      mac_security_forge    = "allow"
      organization          = "default"
      tags                  = []
    }
  }
}

module "ethernet_network_control_templates" {
  depends_on = [
    local.org_moids
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/ethernet_network_control_policies"
  for_each              = local.policies_vnic_templates
  cdp_enabled           = each.value.neighbor_discovery == "cdp" || each.value.neighbor_discovery == "both" ? true : false
  description           = each.value.description != "" ? each.value.description : "${each.key} Ethernet Network Control Policy - ${each.value.neighbor_discovery}."
  forge_mac             = each.value.mac_forge
  mac_registration_mode = each.value.mac_registration_mode
  lldp_receive          = each.value.neighbor_discovery == "lldp" || each.value.neighbor_discovery == "both" ? true : false
  lldp_transmit         = each.value.neighbor_discovery == "lldp" || each.value.neighbor_discovery == "both" ? true : false
  name                  = "${each.key}_netwkctrl"
  org_moid              = local.org_moids[each.value.organization].moid
  tags                  = length(each.value.tags) > 0 ? each.value.tags : local.tags
  uplink_fail_action    = each.value.uplink_fail_action
}

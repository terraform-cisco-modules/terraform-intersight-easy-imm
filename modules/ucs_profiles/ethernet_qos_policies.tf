#_________________________________________________________________________
#
# Ethernet QoS Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet QoS
#_________________________________________________________________________

variable "ethernet_qos_policies" {
  default {
    default = {
      burst                 = 10240
      description           = ""
      enable_trust_host_cos = false
      priority              = "Best Effort"
      mtu                   = 1500
      organization          = "default"
      rate_limit            = 0
      tags                  = []
    }
  }
}

module "ethernet_qos_policies" {
  depends_on = [
    local.org_moids
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/ethernet_qos_policies"
  for_each       = local.policies_vnic_templates
  description    = each.value.description != "" ? each.value.description : "${each.key} Ethernet QoS Policy."
  name           = "${each.key}_qos"
  mtu            = each.value.qos_mtu
  burst          = each.value.qos_burst
  priority       = each.value.qos_priority
  rate_limit     = each.value.qos_rate_limit
  trust_host_cos = each.value.qos_trust_host_cos
  org_moid       = local.org_moids[each.value.organization].moid
  tags           = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

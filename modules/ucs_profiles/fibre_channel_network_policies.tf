#________________________________________________________________
#
# Fibre Channel Network Policies
# GUI Location: Policies > Create Policy > Fibre Channel Network
#________________________________________________________________

variable "fibre_channel_network_policies" {
  default {
    default = {
      default_vlan_id = 4
      description     = ""
      vsan_id         = 4
      organization    = "default"
      tags            = []
    }
  }
}

module "fibre_channel_network_policies_a" {
  depends_on = [
    local.org_moids
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/fibre_channel_network_policies"
  for_each        = local.san_connectivity_policies
  default_vlan_id = each.value.target_platform == "Standalone" ? each.value.vsan_a_default_vlan_id : 0
  description     = each.value.description != "" ? each.value.description : "${each.key} Fibre Channel Network Policy - Fabric A."
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vsan_id         = each.value.vsan_a
}

module "fibre_channel_network_policies_b" {
  depends_on = [
    local.org_moids
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/fibre_channel_network_policies"
  for_each        = local.san_connectivity_policies
  default_vlan_id = each.value.target_platform == "Standalone" ? each.value.vsan_b_default_vlan_id : 0
  description     = each.value.description != "" ? each.value.description : "${each.key} Fibre Channel Network Policy - Fabric B."
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vsan_id         = each.value.vsan_b
}



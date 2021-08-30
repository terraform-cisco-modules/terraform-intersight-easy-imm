#_________________________________________________________________________
#
# Ethernet Network Group Policies (VLAN Groups)
# GUI Location: Configure > Policies > Create Policy > Ethernet Network Group
#_________________________________________________________________________

module "ethernet_network_group_policies" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/ethernet_network_group_policies"
  for_each    = local.policies_vnic_templates
  description = each.value.description != "" ? each.value.description : "${each.key} Ethernet Network Group Policy (VLAN Group)."
  name        = "${each.key}_vlan_group"
  native_vlan = each.value.vlan_native_vlan
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vlan_list   = each.value.vlan_list
}

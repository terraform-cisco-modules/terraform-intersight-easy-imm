#_________________________________________________________________________
#
# Intersight Multicast Policy
# GUI Location: Create > Policy > Create Policy > Multicast > Start
#_________________________________________________________________________

module "multicast_policy" {
  depends_on = [
    local.org_moids
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/domain_multicast"
  for_each       = local.vlan_policy
  description    = each.value.description != "" ? each.value.description : "${each.key} Multicast Policy."
  name           = "${each.key}_mulcast"
  org_moid       = local.org_moids[each.value.organization].moid
  querier_ip     = each.value.querier_ip
  querier_state  = each.value.querier_state
  snooping_state = each.value.snooping_state
  tags           = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

#______________________________________________
#
# Assign a Native VLAN to VLAN Policies
#______________________________________________

module "vlan_policy_native" {
  depends_on = [
    local.org_moids,
    module.multicast_policy,
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vlan"
  for_each = {
    for k, v in local.vlan_lists : k => v
    if v.vlan_native != null
  }
  is_native        = true
  multicast_moid   = module.multicast_policy[each.value.multicast_policy].moid
  vlan             = each.value.vlan_native
  vlan_policy_moid = local.vlan_policy[each.value.vlan_policy]
  vlan_prefix      = each.value.vlan_prefix
}

#______________________________________________
#
# Assign VLANs to VLAN Policies
#______________________________________________

module "vlan_policy" {
  depends_on = [
    local.org_moids,
    module.multicast_policy,
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_list"
  for_each = {
    for k, v in local.vlan_lists : k => v
    if v.vlan_list != null
  }
  is_native        = false
  multicast_moid   = module.multicast_policy[each.value.multicast_policy].moid
  vlan_list        = each.value.vlan_list
  vlan_policy_moid = local.vlan_policy[each.value.vlan_policy]
  vlan_prefix      = each.value.vlan_prefix
}

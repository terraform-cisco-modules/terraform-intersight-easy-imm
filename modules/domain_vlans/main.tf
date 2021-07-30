#_________________________________________________________________________
#
# Intersight UCS Domain Switch Cluster
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

#____________________________________________________________
#
# Intersight Multicast Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "multicast" {
  depends_on = [
    local.org_moids
  ]
  source             = "terraform-cisco-modules/imm/intersight//modules/domain_multicast"
  for_each           = local.ucs_domain_profile
  description        = each.value.multicast_description != "" ? each.value.multicast_description : "${each.value.organization} ${each.key} Multicast Policy."
  name               = "${each.key}_multicast"
  org_moid           = local.org_moids[each.value.organization].moid
  querier_ip         = each.value.multicast_querier_ip
  querier_state      = each.value.multicast_querier_state
  snooping_state     = each.value.multicast_snooping_state
  tags               = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Assign Native VLAN to VLAN Policy
#______________________________________________

module "native_vlan" {
  depends_on = [
    local.org_moids,
    module.multicast,
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vlan"
  for_each         = local.ucs_domain_profile
  is_native        = true
  multicast_moid   = module.multicast[each.key].moid
  vlan             = each.value.vlan_native
  vlan_policy_moid = module.vlan_policy[each.key].moid
  vlan_prefix      = each.value.organization
}

#______________________________________________
#
# Assign VLAN List to VLAN Policy
#______________________________________________

module "vlan_list" {
  depends_on = [
    local.org_moids,
    module.multicast,
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_list"
  for_each         = local.ucs_domain_profile
  is_native        = false
  multicast_moid   = module.multicast[each.key].moid
  vlan_list        = each.value.vlan_list
  vlan_policy_moid = module.vlan_policy[each.key].moid
  vlan_prefix      = each.value.organization
}

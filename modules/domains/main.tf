#_________________________________________________________________________
#
# Intersight UCS Domain Switch Cluster
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

#______________________________________________
#
# Create UCS Domain Profile
#______________________________________________

module "ucs_domain_profile" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster"
  for_each    = local.ucs_domain_profile
  description = each.value.description_domain != "" ? each.value.description_domain : "${each.value.organization} ${each.key} UCS Domain."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Fabric Interconnect A Switch Profile
#______________________________________________

module "ucs_domain_profile_a" {
  depends_on = [
    data.intersight_network_element_summary.fi_a,
    local.org_moids,
    module.ucs_domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profile
  action          = each.value.action
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fi_a[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profile[each.key].moid
  description     = each.value.description_fi_a != "" ? each.value.description_fi_a : "${each.value.organization} ${each.key} Fabric Interconnect A Profile."
  name            = "${each.key}-a"
  policy_bucket   = each.value.policy_bucket
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}


#______________________________________________
#
# Create Fabric Interconnect B Switch Profile
#______________________________________________

module "ucs_domain_profile_b" {
  depends_on = [
    data.intersight_network_element_summary.fi_b,
    local.org_moids,
    module.ucs_domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profile
  action          = each.value.action
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fi_b[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profile[each.key].moid
  description     = each.value.description_fi_b != "" ? each.value.description_fi_b : "${each.value.organization} ${each.key} Fabric Interconnect B Profile."
  name            = "${each.key}-b"
  policy_bucket   = each.value.policy_bucket
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}

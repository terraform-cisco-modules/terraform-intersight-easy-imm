#____________________________________________________________
#
# Intersight VSAN Policies
# GUI Location: Configure > Policy > Create Policy > VSAN
#____________________________________________________________

module "vsan_policies_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_switches_a,
    module.ucs_domain_switches_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/vsan_policies"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  description     = each.value.profile.vsan_a_description != "" ? each.value.profile.vsan_a_description : "${each.key} VSAN Policy Fabric A."
  enable_trunking = each.value.profile.vsan_enable_trunking
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.profile.organization].moid
  tags            = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  profiles        = [module.ucs_domain_switches_a[each.key].moid]
}

module "vsan_policies_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_switches_a,
    module.ucs_domain_switches_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/vsan_policies"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  description     = each.value.profile.vsan_b_description != "" ? each.value.profile.vsan_b_description : "${each.key} VSAN Policy Fabric B."
  enable_trunking = each.value.profile.vsan_enable_trunking
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.profile.organization].moid
  tags            = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  profiles        = [module.ucs_domain_switches_b[each.key].moid]
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_policy_add_vsan_a" {
  depends_on = [
    local.org_moids,
    module.vsan_policies_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/vsan_policy_add_vsan"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  vsan_policy_moid = module.vsan_policies_a[each.key].moid
  vsan_prefix      = each.value.profile.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.profile.vsan_a_fcoe != null ? each.value.profile.vsan_a_fcoe : each.value.profile.vsan_a
      vsan_id   = each.value.profile.vsan_a
    }
  }
}


#______________________________________________
#
# Assign VSAN to VSAN Fabric B Policy
#______________________________________________

module "vsan_policy_add_vsan_b" {
  depends_on = [
    local.org_moids,
    module.vsan_policies_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/vsan_policy_add_vsan"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  vsan_policy_moid = module.vsan_policies_b[each.key].moid
  vsan_prefix      = each.value.profile.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.profile.vsan_b_fcoe != null ? each.value.profile.vsan_b_fcoe : each.value.profile.vsan_b
      vsan_id   = each.value.profile.vsan_b
    }
  }
}

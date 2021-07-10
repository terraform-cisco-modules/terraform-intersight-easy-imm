#____________________________________________________________
#
# Intersight UCS Domain Switch Cluster
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#____________________________________________________________

module "domain_profile" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster"
  description = "${var.cluster_name} UCS Domain."
  name        = var.cluster_name
  org_moid    = local.org_moid
  tags        = local.tags
}

#____________________________________________________________
#
# Intersight UCS Domain Switch Profiles
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#____________________________________________________________

#______________________________________________
#
# Create Fabric A Switch Profile
#______________________________________________

module "domain_profile_a" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_a,
    data.intersight_organization_organization.org_moid,
    module.domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fabric_interconnect_a.results.0.moid] : []
  cluster_moid    = module.domain_profile.moid
  description     = "${var.cluster_name} Switch A Profile."
  name            = "${var.cluster_name}-a"
  tags            = local.tags
  switch_action   = var.switch_action
}


#______________________________________________
#
# Create Fabric B Switch Profile
#______________________________________________

module "domain_profile_b" {
  depends_on = [
    data.intersight_network_element_summary.fabric_interconnect_b,
    data.intersight_organization_organization.org_moid,
    module.domain_profile,
    module.domain_profile_a
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  action          = var.action
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fabric_interconnect_b.results.0.moid] : []
  cluster_moid    = module.domain_profile.moid
  description     = "${var.cluster_name} Switch B Profile."
  name            = "${var.cluster_name}-b"
  tags            = local.tags
}

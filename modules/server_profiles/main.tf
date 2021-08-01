#_________________________________________________________________________
#
# Intersight UCS Server Profile Module
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

module "ucs_server_profile" {
  depends_on = [
    local.org_moids
  ]
  source              = "../../../terraform-intersight-imm/modules/server_profile"
  # source              = "terraform-cisco-modules/imm/intersight//modules/server_profile"
  for_each            = local.ucs_server_profile
  action              = each.value.action
  description         = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.value.name} Server Profile."
  name                = each.value.name != "" ? each.value.name : each.key
  org_moid            = local.org_moids[each.value.organization].moid
  policy_bucket       = each.value.policy_bucket
  src_template        = each.value.src_template
  tags                = each.value.tags != "" ? each.value.tags : local.tags
  target_platform     = each.value.target_platform == "Standalone" ? "Standalone" : "FIAttached"
  wait_for_completion = each.value.wait_for_completion
  assigned_server     = each.value.assign_server == true ? [
    {
      moid        = data.intersight_compute_physical_summary.server[each.key].results[0].moid
      object_type = data.intersight_compute_physical_summary.server[each.key].results[0].source_object_type
    }
  ] : []
}

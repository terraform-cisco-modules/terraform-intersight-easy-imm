
#____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# WWPN Pools
#______________________________________________

module "wwpn_pools" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/fc_pools"
  for_each         = local.wwpn_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.key} ${each.value.pool_purpose} Pool."
  id_blocks        = each.value.id_blocks
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  pool_purpose     = each.value.pool_purpose
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# IQN Pools
#______________________________________________

module "iqn_pools" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/iqn_pools"
  for_each         = local.iqn_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.key} IQN Pool."
  prefix           = each.value.prefix
  iqn_blocks       = each.value.iqn_blocks
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

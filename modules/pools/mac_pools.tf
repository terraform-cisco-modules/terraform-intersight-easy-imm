
#____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# MAC Pools
#______________________________________________

module "mac_pools" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/mac_pools"
  for_each         = local.mac_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.key} MAC Pool."
  mac_blocks       = each.value.mac_blocks
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

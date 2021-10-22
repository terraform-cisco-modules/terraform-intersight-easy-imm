
##____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# UUID Pools
#______________________________________________

module "uuid_pools" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/uuid_pools"
  for_each         = local.uuid_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.key} UUID Pool."
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  prefix           = each.value.prefix
  tags             = each.value.tags != [] ? each.value.tags : local.tags
  uuid_blocks      = each.value.uuid_blocks
}


#____________________________________________________________
#
# Intersight Pools Module
# GUI Location: Pools > Create Pool
#____________________________________________________________

#______________________________________________
#
# IP Pools
#______________________________________________

module "ip_pools" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/ip_pools"
  for_each         = local.ip_pools
  assignment_order = each.value.assignment_order
  description      = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.key} IP Pool."
  ipv4_block       = each.value.ipv4_block
  ipv4_config      = each.value.ipv4_config
  ipv6_block       = each.value.ipv6_block
  ipv6_config      = each.value.ipv6_config
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

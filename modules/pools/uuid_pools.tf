
#______________________________________________
#
# UUID Pool Variables
#______________________________________________

variable "uuid_pools" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      organization     = "default"
      prefix           = "000025B5-0000-0000"
      tags             = []
      uuid_blocks = [
        {
          from = "0000-000000000000"
          size = 1000
        }
      ]
    }
  }
  description = <<-EOT
  key - Name of the UUID Pool.
  * Assignment order decides the order in which the next identifier is allocated.
    - default - (Default) Assignment order is decided by the system.
    - sequential - Identifiers are assigned in a sequential order.
  * description - Description to Assign to the Pool.
  * prefix - Prefix to assign to the UUID Pool..  The default is "000025B5-0000-0000".
  * uuid_blocks - Map of Addresses to Assign to the Pool.
    - from - Starting UUID Address.  Default is "0000-000000000000".
    - size - Size of UUID Pool.  Default is "32768".
  * organization - Name of the Intersight Organization to assign this pool to.  Default is default.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Pool.
  EOT
  type = map(object(
    {
      assignment_order = optional(string)
      description      = optional(string)
      organization     = optional(string)
      prefix           = optional(string)
      tags             = optional(list(map(string)))
      uuid_blocks      = optional(list(map(string)))
    }
  ))
}


#____________________________________________________________
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

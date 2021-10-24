
#______________________________________________
#
# IQN Pool Variables
#______________________________________________

variable "iqn_pools" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      prefix           = "iqn.1984-12.com.cisco"
      organization     = "default"
      tags             = []
      iqn_blocks = [
        {
          from   = 1
          size   = 255
          suffix = "ucs-host"
        }
      ]
    }
  }
  description = <<-EOT
  key - Name of the IQN Pool.
  * Assignment order decides the order in which the next identifier is allocated.
    - default - (Default) Assignment order is decided by the system.
    - sequential - Identifiers are assigned in a sequential order.
  * description - Description to Assign to the Pool.
  * iqn_blocks - Map of Addresses to Assign to the Pool.
    - pool_size - staring WWxN Address.  Default is 255.
    - starting_iqn - ending WWxN Address.  Default is 01.
    - suffix - Suffix to assign to the IQN Pool.  Default is "ucs-host".
  * organization - Name of the Intersight Organization to assign this pool to.  Default is default.
    - https://intersight.com/an/settings/organizations/
  * prefix - The prefix for IQN blocks created for this pool.  The default is "iqn.1984-12.com.cisco".
  * tags - List of Key/Value Pairs to Assign as Attributes to the Pool.
  EOT
  type = map(object(
    {
      assignment_order = optional(string)
      description      = optional(string)
      iqn_blocks       = optional(list(map(string)))
      organization     = optional(string)
      prefix           = optional(string)
      tags             = optional(list(map(string)))
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

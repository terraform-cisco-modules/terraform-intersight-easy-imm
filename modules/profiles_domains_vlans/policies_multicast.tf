#_________________________________________________________________________
#
# Intersight Multicast Policy Variables
# GUI Location: Configure > Policies > Create Policy > Multicast > Start
#_________________________________________________________________________

variable "policies_multicast" {
  default = {
    default = {
      description    = ""
      organization   = "default"
      querier_ip     = ""
      querier_state  = "Disabled"
      snooping_state = "Enabled"
      tags           = []
    }
  }
  description = <<-EOT
  key - Name of the Multicast Policy.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * querier_ip - IP Address of the IGMP Querier to Assign to the VLAN through this Policy.
  * querier_state - Administrative state of the IGMP Querier for the VLANs Assigned to this Policy.  Options are:
    - Disabled - (Default)
    - Enabled
  * snooping_state - Administrative State for Snooping for the VLANs Assigned to this Policy.
    - Disabled
    - Enabled - (Default)
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description    = optional(string)
      organization   = optional(string)
      querier_ip     = optional(string)
      querier_state  = optional(string)
      snooping_state = optional(string)
      tags           = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Intersight Multicast Policy
# GUI Location: Create > Policy > Create Policy > Multicast > Start
#_________________________________________________________________________

module "policies_multicast" {
  depends_on = [
    local.org_moids
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/domain_multicast"
  for_each       = local.policies_multicast
  description    = each.value.description != "" ? each.value.description : "${each.key} Multicast Policy."
  name           = each.key
  org_moid       = local.org_moids[each.value.organization].moid
  querier_ip     = each.value.querier_ip
  querier_state  = each.value.querier_state
  snooping_state = each.value.snooping_state
  tags           = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


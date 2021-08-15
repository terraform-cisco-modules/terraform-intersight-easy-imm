#_________________________________________________________________________
#
# Intersight Link Aggregation Policies Variables
# GUI Location: Configure > Policy > Create Policy > Link Aggregation
#_________________________________________________________________________

variable "policies_link_aggregation" {
  default = {
    default = {
      description        = ""
      lacp_rate          = "normal"
      organization       = "default"
      suspend_individual = false
      tags               = []
    }
  }
  description = <<-EOT
  key - Name of the Link Aggregation Policy.
  * description - Description to Assign to the Policy.
  * lacp_rate - Flag used to indicate whether LACP PDUs are to be sent 'fast', i.e., every 1 second.
    - fast - The fast timeout rate is 1 second.
    - normal - (Default) - The normal timeout rate is 30 seconds.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * suspend_individual - Flag tells the switch whether to suspend the port if it didn’t receive LACP PDU.  Default is false.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description        = optional(string)
      lacp_rate          = optional(string)
      organization       = optional(string)
      suspend_individual = optional(string)
      tags               = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Link Aggregation Policies
# GUI Location: Configure > Policy > Create Policy > Link Aggregation
#_________________________________________________________________________

module "policies_link_aggregation" {
  depends_on = [
    local.org_moids
  ]
  source             = "terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation"
  for_each           = local.policies_link_aggregation
  description        = each.value.description != "" ? each.value.description : "${each.key} Link Aggregation Policy."
  lacp_rate          = each.value.lacp_rate
  name               = each.key
  org_moid           = local.org_moids[each.value.organization].moid
  suspend_individual = each.value.suspend_individual
  tags               = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


#_________________________________________________________________________
#
# Intersight Link Control Policies Variables
# GUI Location: Configure > Policies > Create Policy > Link Control
#_________________________________________________________________________

variable "policy_link_control" {
  default = {
    default = {
      description      = ""
      organization     = "default"
      tags             = []
      udld_admin_state = "Enabled"
      udld_mode        = "normal"
    }
  }
  description = <<-EOT
  key - Name of the Link Control Policy.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * udld_admin_state - Admin configured UDLD State for this port.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * udld_mode - Admin configured UDLD Mode for this port.
    - normal - (Default) - Admin configured 'normal' UDLD mode.
    - aggressive - Admin configured 'aggressive' UDLD mode.
  EOT
  type = map(object(
    {
      description      = optional(string)
      organization     = optional(string)
      tags             = optional(list(map(string)))
      udld_admin_state = optional(string)
      udld_mode        = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# Link Control Policies
# GUI Location: Configure > Policies > Create Policy > Link Control
#_________________________________________________________________________

module "policy_link_control" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_link_control"
  for_each         = local.policy_link_control
  description      = each.value.description != "" ? each.value.description : "${each.key} Link Control Policy."
  name             = each.key
  org_moid         = local.org_moids[each.value.organization].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
  udld_admin_state = each.value.udld_admin_state
  udld_mode        = each.value.udld_mode
}


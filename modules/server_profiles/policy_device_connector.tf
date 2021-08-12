#_________________________________________________________________________
#
# Intersight Device Connector Policies Variables
# GUI Location: Configure > Policies > Create Policy > Device Connector
#_________________________________________________________________________

variable "policy_device_connector" {
  default = {
    default = {
      description  = ""
      lockout      = false
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the Device Connector Policy.
  1. description - Description to Assign to the Policy.
  2. lockout - Enables configuration lockout on the endpoint.
  3. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  4. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description  = optional(string)
      lockout      = optional(bool)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Device Connector Policies
# GUI Location: Configure > Policies > Create Policy > Device Connector
#_________________________________________________________________________

module "policy_device_connector" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_device_connector"
  for_each    = local.policy_device_connector
  description = each.value.description != "" ? each.value.description : "${each.key} Device Connector Policy."
  lockout     = each.value.lockout
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  profiles    = [for s in sort(keys(
    local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_device_connector == each.key]
  tags        = each.value.tags != [] ? each.value.tags : local.tags
}

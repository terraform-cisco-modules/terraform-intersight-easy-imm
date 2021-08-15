#_________________________________________________________________________
#
# Intersight Device Connector Policies Variables
# GUI Location: Configure > Policies > Create Policy > Device Connector
#_________________________________________________________________________

variable "policies_device_connector" {
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
  * description - Description to Assign to the Policy.
  * lockout - Enables configuration lockout on the endpoint.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
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

module "policies_device_connector" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_device_connector"
  for_each    = local.policies_device_connector
  description = each.value.description != "" ? each.value.description : "${each.key} Device Connector Policy."
  lockout     = each.value.lockout
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_device_connector == each.key
  ]
}

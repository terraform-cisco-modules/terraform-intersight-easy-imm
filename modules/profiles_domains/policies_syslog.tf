#_________________________________________________________________________
#
# Intersight Syslog Policies Variables
# GUI Location: Configure > Policy > Create Policy > Syslog > Start
#_________________________________________________________________________

variable "policies_syslog" {
  default = {
    default = {
      description         = ""
      local_min_severity  = "warning"
      organization        = "default"
      syslog_destinations = []
      tags                = []
    }
  }
  description = <<-EOT
  key - Name of the Syslog Policy.
  * description - Description to Assign to the Policy.
  * local_min_severity - Lowest level of messages to be included in the local log.
    - warning - Use logging level warning for logs classified as warning.
    - emergency - Use logging level emergency for logs classified as emergency.
    - alert - Use logging level alert for logs classified as alert.
    - critical - Use logging level critical for logs classified as critical.
    - error - Use logging level error for logs classified as error.
    - notice - Use logging level notice for logs classified as notice.
    - informational - Use logging level informational for logs classified as informational.
    - debug - Use logging level debug for logs classified as debug.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * syslog_destinations - Enables configuration lockout on the endpoint.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description         = optional(string)
      local_min_severity  = optional(string)
      organization        = optional(string)
      syslog_destinations = optional(list(map(string)))
      tags                = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Syslog Policies
# GUI Location: Configure > Policy > Create Policy > Syslog > Start
#_________________________________________________________________________

module "policies_syslog" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source             = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  for_each           = local.policies_syslog
  description        = each.value.description != "" ? each.value.description : "${each.key} Syslog Policy."
  name               = each.key
  org_moid           = local.org_moids[each.value.organization].moid
  remote_clients     = each.value.syslog_destinations
  local_min_severity = each.value.local_min_severity
  tags               = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profile_type       = "domain"
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    [module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid]
    if local.ucs_domain_profiles[s].profile.policies_syslog == each.key
  ])
}

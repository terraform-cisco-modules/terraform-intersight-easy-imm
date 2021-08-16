#_________________________________________________________________________
#
# Intersight NTP Policies Variables
# GUI Location: Configure > Policy > Create Policy > NTP > Start
#_________________________________________________________________________

variable "policies_ntp" {
  default = {
    default = {
      description  = ""
      enabled      = true
      ntp_servers  = ["time-a-g.nist.gov", "time-b-g.nist.gov"]
      organization = "default"
      tags         = []
      timezone     = "Etc/GMT"
    }
  }
  description = <<-EOT
  key - Name of the NTP Policy.
  * description - Description to Assign to the Policy.
  * enabled - Flag to Enable or Disable the Policy.
  * ntp_servers - List of NTP Servers to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * timezone - Timezone to Assign to the Policy.  For a List of supported timezones see the following URL.
    - https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md.
  EOT
  type = map(object(
    {
      description  = optional(string)
      enabled      = optional(bool)
      ntp_servers  = optional(set(string))
      organization = optional(string)
      tags         = optional(list(map(string)))
      timezone     = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# NTP Policies
# GUI Location: Configure > Policy > Create Policy > NTP > Start
#_________________________________________________________________________

module "policies_ntp" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  for_each     = local.policies_ntp
  description  = each.value.description != "" ? each.value.description : "${each.key} NTP Policy."
  enabled      = each.value.enabled
  name         = each.key
  ntp_servers  = each.value.ntp_servers
  org_moid     = local.org_moids[each.value.organization].moid
  tags         = length(each.value.tags) > 0 ? each.value.tags : local.tags
  timezone     = each.value.timezone
  profile_type = "domain"
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    [module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid]
    if local.ucs_domain_profiles[s].profile.policies_ntp == each.key
  ])
}

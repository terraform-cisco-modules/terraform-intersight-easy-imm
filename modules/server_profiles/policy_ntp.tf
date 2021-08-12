#_________________________________________________________________________
#
# Intersight NTP Policies Variables
# GUI Location: Configure > Policies > Create Policy > NTP > Start
#_________________________________________________________________________

variable "policy_ntp" {
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
  1. description - Description to Assign to the Policy.
  2. enabled - Flag to Enable or Disable the Policy.
  3. ntp_servers - List of NTP Servers to Assign to the Policy.
  4. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  5. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  6. timezone - Timezone to Assign to the Policy.  For a List of supported timezones see the following URL. https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md.
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
# GUI Location: Configure > Policies > Create Policy > NTP > Start
#_________________________________________________________________________

module "policy_ntp" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  for_each    = local.policy_ntp
  description = each.value.description != "" ? each.value.description : "${each.key} NTP Policy."
  enabled     = each.value.enabled
  name        = each.key
  ntp_servers = each.value.ntp_servers
  org_moid    = local.org_moids[each.value.organization].moid
  profiles    = [for s in sort(keys(
    local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_ntp == each.key]
  tags        = each.value.tags != [] ? each.value.tags : local.tags
  timezone    = each.value.timezone
}

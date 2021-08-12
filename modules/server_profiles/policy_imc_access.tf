#_________________________________________________________________________
#
# Intersight IMC Access Policies Variables
# GUI Location: Configure > Policies > Create Policy > IMC Access > Start
#_________________________________________________________________________

variable "policy_imc_access" {
  default = {
    default = {
      description  = ""
      imc_ip_pool  = ""
      inband_vlan  = 1
      ipv4_enable  = true
      ipv6_enable  = false
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the IMC Access Policy
  1. description - Description to Assign to the Policy.
  2. imc_ip_pool - Name of the IP Pool to Assign to the IMC Access Policy.
  3. inband_vlan - VLAN ID to Assign as the Inband Management VLAN for IMC Access.
  4. ipv4_enable - Flag to Enable or Disable the IPv4 Address Family for Poliices.
  5. ipv6_enable - Flag to Enable or Disable the IPv6 Address Family for Poliices.
  6. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  7. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description  = optional(string)
      inband_vlan  = optional(number)
      imc_ip_pool  = optional(string)
      ipv4_enable  = optional(bool)
      ipv6_enable  = optional(bool)
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# IMC Access Policies
# GUI Location: Configure > Policies > Create Policy > IMC Access > Start
#_________________________________________________________________________

module "policy_imc_access" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "../../../terraform-intersight-imm/modules/policies_imc_access"
  for_each    = local.policy_imc_access
  description = each.value.description != "" ? each.value.description : "${each.key} IMC Access Policy."
  imc_ip_pool = each.value.imc_ip_pool != "" ? local.ip_pools[each.value.imc_ip_pool] : null
  inband_vlan = each.value.inband_vlan
  ipv4_enable = each.value.ipv4_enable
  ipv6_enable = each.value.ipv6_enable
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  profiles = [for s in sort(keys(
  local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_imc_access == each.key]
  tags = each.value.tags != [] ? each.value.tags : local.tags
}

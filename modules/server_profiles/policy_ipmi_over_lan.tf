#_________________________________________________________________________
#
# Intersight IPMI over LAN Policies Variables
# GUI Location: Configure > Policies > Create Policy > IPMI over LAN
#_________________________________________________________________________

variable "ipmi_key_1" {
  default     = ""
  description = "Encryption key 1 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "ipmi_key_2" {
  default     = ""
  description = "Encryption key 2 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "ipmi_key_3" {
  default     = ""
  description = "Encryption key 3 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "ipmi_key_4" {
  default     = ""
  description = "Encryption key 4 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "ipmi_key_5" {
  default     = ""
  description = "Encryption key 5 to use for IPMI communication. It should have an even number of hexadecimal characters and not exceed 40 characters."
  sensitive   = true
  type        = string
}

variable "policy_ipmi_over_lan" {
  default = {
    default = {
      description  = ""
      enabled      = true
      ipmi_key     = null
      organization = "default"
      privilege    = "admin"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the IPMI over LAN Policy.
  1. description - Description to Assign to the Policy.
  2. enabled - Flag to Enable or Disable the Policy.
  3. encryption_key - number to indicate the variable being set to 'ipmi_encryption_key_[value]'.
  4. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  5. privilege - The highest privilege level that can be assigned to an IPMI session on a server.
    * admin - Privilege to perform all actions available through IPMI.
    * user - Privilege to perform some functions through IPMI but restriction on performing administrative tasks.
    * read-only - Privilege to view information throught IPMI but restriction on making any changes.
  6. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description  = optional(string)
      enabled      = optional(bool)
      ipmi_key     = optional(number)
      organization = optional(string)
      privilege    = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# IPMI over LAN Policies
# GUI Location: Configure > Policies > Create Policy > IPMI over LAN
#_________________________________________________________________________

module "policy_ipmi_over_lan" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_ipmi_over_lan"
  for_each       = local.policy_ipmi_over_lan
  description    = each.value.description != "" ? each.value.description : "${each.key} IPMI over LAN Policy."
  enabled        = each.value.enabled
  encryption_key = each.value.ipmi_key == 1 ? var.ipmi_key_1 : each.value.ipmi_key == 2 ? var.ipmi_key_2 : each.value.ipmi_key == 3 ? var.ipmi_key_3 : each.value.ipmi_key == 4 ? var.ipmi_key_4 : each.value.ipmi_key == 5 ? var.ipmi_key_5 : null
  privilege      = each.value.privilege
  name           = each.key
  org_moid       = local.org_moids[each.value.organization].moid
  profiles       = [for s in sort(keys(local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_ipmi_over_lan == each.key]
  tags           = each.value.tags != [] ? each.value.tags : local.tags
}

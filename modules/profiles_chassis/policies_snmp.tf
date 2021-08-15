#_________________________________________________________________________
#
# Intersight SNNMP Policies Variables
# GUI Location: Configure > Policy > Create Policy > SNMP > Start
#_________________________________________________________________________

variable "snmp_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "snmp_trap_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "snmp_user_1_auth_password" {
  default     = ""
  description = "Authorization password for the user."
  sensitive   = true
  type        = string
}

variable "snmp_user_1_privacy_password" {
  default     = ""
  description = "Privacy password for the user."
  sensitive   = true
  type        = string
}

variable "snmp_user_2_auth_password" {
  default     = ""
  description = "Authorization password for the user."
  sensitive   = true
  type        = string
}

variable "snmp_user_2_privacy_password" {
  default     = ""
  description = "Privacy password for the user."
  sensitive   = true
  type        = string
}


variable "policies_snmp" {
  default = {
    default = {
      description                = ""
      enabled                    = true
      organization               = "default"
      snmp_access                = "Full"
      snmp_engine_id             = ""
      snmp_port                  = 161
      snmp_trap_destinations     = []
      snmp_user_1_auth_type      = "SHA"
      snmp_user_1_name           = ""
      snmp_user_1_security_level = "AuthPriv"
      snmp_user_2_auth_type      = "SHA"
      snmp_user_2_name           = ""
      snmp_user_2_security_level = "AuthPriv"
      system_contact             = ""
      system_location            = ""
      tags                       = []
    }
  }
  description = <<-EOT
  key - Name of the SSH Policy.
  * description - Description to Assign to the Policy.
  * enabled - State of SSH service on the endpoint.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * snmp_access - Controls access to the information in the inventory tables. Applicable only for SNMPv1 and SNMPv2c users.
    - Disabled - Blocks access to the information in the inventory tables.
    - Full - Full access to read the information in the inventory tables.
    - Limited - Partial access to read the information in the inventory tables.
  * snmp_engine_id - Unique string to identify the device for administration purpose. This is generated from the SNMP Input Engine ID if it is already defined, else it is derived from the BMC serial number.
  * snmp_port - Port on which Cisco IMC SNMP agent runs. Enter a value between 1-65535. Reserved ports not allowed (22, 23, 80, 123, 389, 443, 623, 636, 2068, 3268, 3269).  Default is 161.
  * snmp_trap_destinations - List of SNMP Trap Destinations to Assign to the Policy.
  * snmp_user_1_auth_type - Authorization protocol for authenticating the user.  Currently Options are:
    - MD5
    - SHA
  * In the future these options will be added.
    - NA - Authentication protocol is not applicable.
    - SHA-224 - SHA-224 protocol is used to authenticate SNMP user.
    - SHA-256 - SHA-256 protocol is used to authenticate SNMP user.
    - SHA-384 - SHA-384 protocol is used to authenticate SNMP user.
    - SHA-512 - SHA-512 protocol is used to authenticate SNMP user.
  * snmp_user_1_name - Username. Must have a minimum of 1 and and a maximum of 31 characters.
  * snmp_user_1_security_level - Security mechanism used for communication between agent and manager.
    - AuthNoPriv - The user requires an authorization password but not a privacy password.
    - AuthPriv - The user requires both an authorization password and a privacy password.
    - NoAuthNoPriv - The user does not require an authorization or privacy password.
  * snmp_user_2_auth_type - Authorization protocol for authenticating the user.  Currently Options are:
    - MD5
    - SHA
  * In the future these options will be added.
    - NA - Authentication protocol is not applicable.
    - SHA-224 - SHA-224 protocol is used to authenticate SNMP user.
    - SHA-256 - SHA-256 protocol is used to authenticate SNMP user.
    - SHA-384 - SHA-384 protocol is used to authenticate SNMP user.
    - SHA-512 - SHA-512 protocol is used to authenticate SNMP user.
  * snmp_user_2_name - Username. Must have a minimum of 1 and and a maximum of 31 characters.
  * snmp_user_2_security_level - Security mechanism used for communication between agent and manager.
    - AuthNoPriv - The user requires an authorization password but not a privacy password.
    - AuthPriv - The user requires both an authorization password and a privacy password.
    - NoAuthNoPriv - The user does not require an authorization or privacy password.
  * system_contact - Contact person responsible for the SNMP implementation. Enter a string up to 64 characters, such as an email address or a name and telephone number.
  * system_location - Location of host on which the SNMP agent (server) runs.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description                = optional(string)
      enabled                    = optional(bool)
      organization               = optional(string)
      snmp_access                = optional(string)
      snmp_engine_id             = optional(string)
      snmp_port                  = optional(number)
      snmp_trap_destinations     = optional(list(map(string)))
      snmp_user_1_auth_type      = optional(string)
      snmp_user_1_name           = optional(string)
      snmp_user_1_security_level = optional(string)
      snmp_user_2_auth_type      = optional(string)
      snmp_user_2_name           = optional(string)
      snmp_user_2_security_level = optional(string)
      system_contact             = optional(string)
      system_location            = optional(string)
      tags                       = optional(list(map(string)))
    }
  ))
}

#____________________________________________________________
#
# SNMP Policy
# GUI Location: Policies > Create Policy > SNMP
#____________________________________________________________

module "policies_snmp" {
  depends_on = [
    local.org_moids,
    module.ucs_chassis_profiles
  ]
  for_each = {
    for k, v in local.policies_snmp : k => v
    if v.snmp_user_1_name == "" && v.snmp_user_2_name == ""
  }
  source = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  # source                  = each.value.snmp_user_2_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users" : each.value.snmp_user_1_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_users" : "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description     = each.value.description != "" ? each.value.description : "${each.key} SNMP Policy."
  enabled         = each.value.enabled
  name            = each.key
  org_moid        = local.org_moids[each.value.organization].moid
  snmp_access     = each.value.snmp_access
  snmp_community  = var.snmp_community
  snmp_engine_id  = each.value.snmp_engine_id
  snmp_port       = each.value.snmp_port
  snmp_traps      = each.value.snmp_trap_destinations
  system_contact  = each.value.system_contact
  system_location = each.value.system_location
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  trap_community  = var.snmp_trap_community
  v2_enabled      = var.snmp_community != "" ? true : false
  v3_enabled      = each.value.snmp_user_1_name != "" ? true : false
  profile_type    = "chassis"
  profiles = [
    for s in sort(keys(local.ucs_chassis_profiles)) :
    module.ucs_chassis_profiles[s].moid
    if local.ucs_chassis_profiles[s].profile.policies_snmp == each.key
  ]
}

module "policies_snmp_1_user" {
  depends_on = [
    local.org_moids,
    module.ucs_chassis_profiles
  ]
  for_each = {
    for k, v in local.policies_snmp : k => v
    if v.snmp_user_1_name != "" && v.snmp_user_2_name == ""
  }
  source = "terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_user"
  # source                  = each.value.snmp_user_2_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users" : each.value.snmp_user_1_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_users" : "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description             = each.value.description != "" ? each.value.description : "${each.key} SNMP Policy."
  enabled                 = each.value.enabled
  name                    = each.key
  org_moid                = local.org_moids[each.value.organization].moid
  snmp_access             = each.value.snmp_access
  snmp_community          = var.snmp_community
  snmp_engine_id          = each.value.snmp_engine_id
  snmp_port               = each.value.snmp_port
  snmp_traps              = each.value.snmp_trap_destinations
  user_1_auth_password    = var.snmp_user_1_auth_password
  user_1_auth_type        = each.value.snmp_user_1_auth_type
  user_1_name             = each.value.snmp_user_1_name
  user_1_privacy_password = var.snmp_user_1_privacy_password
  user_1_security_level   = each.value.snmp_user_1_security_level
  system_contact          = each.value.system_contact
  system_location         = each.value.system_location
  tags                    = length(each.value.tags) > 0 ? each.value.tags : local.tags
  trap_community          = var.snmp_trap_community
  v2_enabled              = var.snmp_community != "" ? true : false
  v3_enabled              = each.value.snmp_user_1_name != "" ? true : false
  profile_type            = "chassis"
  profiles = [
    for s in sort(keys(local.ucs_chassis_profiles)) :
    module.ucs_chassis_profiles[s].moid
    if local.ucs_chassis_profiles[s].profile.policies_snmp == each.key
  ]
}

module "policies_snmp_2_users" {
  depends_on = [
    local.org_moids,
    module.ucs_chassis_profiles
  ]
  for_each = {
    for k, v in local.policies_snmp : k => v
    if v.snmp_user_2_name != ""
  }
  source = "terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users"
  # source                  = each.value.snmp_user_2_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users" : each.value.snmp_user_1_name != "" ? "terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_users" : "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description             = each.value.description != "" ? each.value.description : "${each.key} SNMP Policy."
  enabled                 = each.value.enabled
  name                    = each.key
  org_moid                = local.org_moids[each.value.organization].moid
  snmp_access             = each.value.snmp_access
  snmp_community          = var.snmp_community
  snmp_engine_id          = each.value.snmp_engine_id
  snmp_port               = each.value.snmp_port
  snmp_traps              = each.value.snmp_trap_destinations
  user_1_auth_password    = var.snmp_user_1_auth_password
  user_1_auth_type        = each.value.snmp_user_1_auth_type
  user_1_name             = each.value.snmp_user_1_name
  user_1_privacy_password = var.snmp_user_1_privacy_password
  user_1_security_level   = each.value.snmp_user_1_security_level
  user_2_auth_password    = var.snmp_user_2_auth_password
  user_2_auth_type        = each.value.snmp_user_2_auth_type
  user_2_name             = each.value.snmp_user_2_name
  user_2_privacy_password = var.snmp_user_2_privacy_password
  user_2_security_level   = each.value.snmp_user_2_security_level
  system_contact          = each.value.system_contact
  system_location         = each.value.system_location
  tags                    = length(each.value.tags) > 0 ? each.value.tags : local.tags
  trap_community          = var.snmp_trap_community
  v2_enabled              = var.snmp_community != "" ? true : false
  v3_enabled              = each.value.snmp_user_1_name != "" ? true : false
  profile_type            = "chassis"
  profiles = [
    for s in sort(keys(local.ucs_chassis_profiles)) :
    module.ucs_chassis_profiles[s].moid
    if local.ucs_chassis_profiles[s].profile.policies_snmp == each.key
  ]
}

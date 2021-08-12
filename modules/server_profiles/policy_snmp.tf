#_________________________________________________________________________
#
# Intersight SNNMP Policies Variables
# GUI Location: Configure > Policies > Create Policy > SNMP > Start
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

variable "policy_snmp" {
  default = {
    default = {
      description            = ""
      enabled                = true
      organization           = "default"
      snmp_access            = "Full"
      snmp_engine_id         = ""
      snmp_port              = 161
      snmp_trap_destinations = []
      snmp_users             = []
      system_contact         = ""
      system_location        = ""
      tags                   = []
      v2_enabled             = true
      v3_enabled             = true
    }
  }
  description = <<-EOT
  key - Name of the SSH Policy.
  1. description - Description to Assign to the Policy.
  2. enabled - State of SSH service on the endpoint.
  3. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  4. snmp_access - Controls access to the information in the inventory tables. Applicable only for SNMPv1 and SNMPv2c users.
    * Disabled - Blocks access to the information in the inventory tables.
    * Full - Full access to read the information in the inventory tables.
    * Limited - Partial access to read the information in the inventory tables.
  5. snmp_engine_id - Unique string to identify the device for administration purpose. This is generated from the SNMP Input Engine ID if it is already defined, else it is derived from the BMC serial number.
  6. snmp_port - Port on which Cisco IMC SNMP agent runs. Enter a value between 1-65535. Reserved ports not allowed (22, 23, 80, 123, 389, 443, 623, 636, 2068, 3268, 3269).  Default is 161.
  7. snmp_trap_destinations - List of SNMP Trap Destinations to Assign to the Policy.
  8. snmp_users - List of SNMP Users to Assign to the Policy.
  9. system_contact - Contact person responsible for the SNMP implementation. Enter a string up to 64 characters, such as an email address or a name and telephone number.
  10. system_location - Location of host on which the SNMP agent (server) runs.
  11. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  12. v2_enabled - State of the SNMPv2c on the endpoint. If enabled, the endpoint sends SNMPv2c properties to the designated host.
  13. v3_enabled - State of the SNMPv3 on the endpoint. If enabled, the endpoint sends SNMPv3 properties to the designated host.
  EOT
  type = map(object(
    {
      description            = optional(string)
      enabled                = optional(bool)
      organization           = optional(string)
      snmp_access            = optional(string)
      snmp_engine_id         = optional(string)
      snmp_port              = optional(number)
      snmp_trap_destinations = optional(list(map(string)))
      snmp_users             = optional(list(map(string)))
      system_contact         = optional(string)
      system_location        = optional(string)
      tags                   = optional(list(map(string)))
      v2_enabled             = optional(bool)
      v3_enabled             = optional(bool)
    }
  ))
}


#____________________________________________________________
#
# SNMP Policy
# GUI Location: Policies > Create Policy > SNMP
#____________________________________________________________

module "snmp" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profile
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  for_each    = local.policy_snmp
  description = each.value.description != "" ? each.value.description : "${each.key} SNMP Policy."
  enabled     = each.value.enabled
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  profiles = [for s in sort(keys(
  local.ucs_server_profiles)) : module.ucs_server_profile[s].moid if local.ucs_server_profiles[s].policy_snmp == each.key]
  snmp_access     = each.value.snmp_access
  snmp_community  = var.snmp_community
  snmp_engine_id  = each.value.snmp_engine_id
  snmp_port       = each.value.snmp_port
  snmp_traps      = each.value.snmp_trap_destinations
  snmp_users      = each.value.snmp_users
  system_contact  = each.value.system_contact
  system_location = each.value.system_location
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  trap_community  = var.snmp_trap_community
  v2_enabled      = each.value.v2_enabled
  v3_enabled      = each.value.v3_enabled
}



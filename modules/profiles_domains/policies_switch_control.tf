#_________________________________________________________________________
#
# Intersight Switch Control Policies Variables
# GUI Location: Configure > Policy > Create Policy > Switch Control
#_________________________________________________________________________

variable "policies_switch_control" {
  default = {
    default = {
      description           = ""
      mac_aging_option      = "Default"
      mac_aging_time        = 14500
      organization          = "default"
      tags                  = []
      udld_message_interval = 15
      udld_recovery_action  = "none"
      vlan_optimization     = false
    }
  }
  description = <<-EOT
  key - Name of the Link Control Policy.
  * description - Description to Assign to the Policy.
  * mac_aging_option - This specifies one of the option to configure the MAC address aging time.
    - Custom - This option allows the the user to configure the MAC address aging time on the switch. For Switch Model UCS-FI-6454 or higher, the valid range is 120 to 918000 seconds and the switch will set the lower multiple of 5 of the given time.
    - Default - (Default) This option sets the default MAC address aging time to 14500 seconds for End Host mode.
    - Never - This option disables the MAC address aging process and never allows the MAC address entries to get removed from the table.
  * mac_aging_time  - Define the MAC address aging time in seconds.  Range is between 120 to 918000, in multiples of 5, when mac_aging_option is set to Custom.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * udld_message_interval - Configures the time between UDLD probe messages on ports that are in advertisement mode and arecurrently determined to be bidirectional.  Valid values are from 7 to 90 seconds.  Default is 15.
  * udld_recovery_action - UDLD recovery when enabled, attempts to bring an UDLD error-disabled port out of reset.
    - none - (Default) No action is taken when a port has been disabled.
    - reset - The switch will attempt to bring a UDLD error-disabled port back online.
  * vlan_optimization - To enable or disable the VLAN port count optimization.  Default is false.
  EOT
  type = map(object(
    {
      description           = optional(string)
      mac_aging_option      = optional(string)
      mac_aging_time        = optional(number)
      organization          = optional(string)
      tags                  = optional(list(map(string)))
      udld_message_interval = optional(number)
      udld_recovery_action  = optional(string)
      vlan_optimization     = optional(bool)
    }
  ))
}


#_________________________________________________________________________
#
# Switch Control Policies
# GUI Location: Configure > Policy > Create Policy > Switch Control
#_________________________________________________________________________

module "policies_switch_control" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_switch_control"
  for_each              = local.policies_switch_control
  description           = each.value.description != "" ? each.value.description : "${each.key} Switch Control Policy."
  name                  = each.key
  mac_aging_option      = each.value.mac_aging_option
  mac_aging_time        = each.value.mac_aging_time
  udld_message_interval = each.value.udld_message_interval
  udld_recovery_action  = each.value.udld_recovery_action
  vlan_optimization     = each.value.vlan_optimization
  org_moid              = local.org_moids[each.value.organization].moid
  tags                  = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    [module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid]
    if local.ucs_domain_profiles[s].profile.policies_switch_control == each.key
  ])
}



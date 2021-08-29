#_________________________________________________________________________
#
# Intersight UCS Chassis Profile Variables
# GUI Location: Profiles > UCS Chassis Profile > Create UCS Chassis Profile
#_________________________________________________________________________

variable "ucs_chassis_profiles" {
  default = {
    default = {
      action              = "No-op"
      assigned_chassis    = false
      description         = ""
      name                = "" # If Name is not specified the Serial Will be assigned as the Hostname
      src_template        = ""
      tags                = []
      wait_for_completion = false
    }
  }
  description = <<-EOT
  key - Serial Number of the Chassis.
  * action - Action to Perform on the Chassis Profile Assignment.  Options are:
    - Deploy
    - No-op
    - Unassign
  * assigned_chassis - A reference to a equipmentChassis resource.
  * description - Description for the Profile.
  * name - If Name is not specified the Serial Will be assigned as the Hostname.
  * src_template - The Name of the ucs_chassis_template to apply to the chassis.
  * tags -
  * wait_for_completion -
  EOT
  type = map(object(
    {
      action              = optional(string)
      assigned_chassis    = optional(bool)
      description         = optional(string)
      name                = optional(string)
      src_template        = optional(string)
      tags                = optional(list(map(string)))
      wait_for_completion = optional(bool)
    }
  ))
}

variable "ucs_chassis_templates" {
  default = {
    default = {
      imc_access_policies   = ""
      organization          = "default"
      power_policies        = ""
      snmp_policies         = ""
      snmp_1_user_policies  = ""
      snmp_2_users_policies = ""
      target_platform       = "FIAttached"
      thermal_policies      = ""
    }
  }
  description = <<-EOT
  key - Name of the UCS Chassis Template.
  * imc_access_policies - Name of the IMC Access Policy Created.
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  * power_policies - Name of the Power Policy Created.
  * snmp_policies - Name of the SNMP Policy Created.
  * snmp_1_user_policies - Name of the SNMP Policy Created.
  * snmp_2_users_policies - Name of the SNMP Policy Created.
  * target_platform - The platform for which the chassis profile is applicable. It can either be a chassis that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    - FIAttached - Chassis which are connected to a Fabric Interconnect that is managed by Intersight.
  * thermal_policies - Name of the Thermal Policy Created.
  EOT
  type = map(object(
    {
      imc_access_policies   = optional(string)
      organization          = optional(string)
      power_policies        = optional(string)
      snmp_policies         = optional(string)
      snmp_1_user_policies  = optional(string)
      snmp_2_users_policies = optional(string)
      target_platform       = optional(string)
      thermal_policies      = optional(string)
    }
  ))
}

#_________________________________________________________________________
#
# Intersight UCS Chassis Profile Module
# GUI Location: Profiles > UCS Chassis Profile > Create UCS Chassis Profile
#_________________________________________________________________________

module "ucs_chassis_profiles" {
  depends_on = [
    local.org_moids
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/chassis_profile"
  # source              = "terraform-cisco-modules/imm/intersight//modules/chassis_profile"
  for_each            = local.ucs_chassis_profiles
  action              = each.value.profile.action
  description         = each.value.profile.description != "" ? each.value.profile.description : "${each.value.profile.name} Chassis Profile."
  name                = each.value.profile.name != "" ? each.value.profile.name : each.key
  org_moid            = local.org_moids[each.value.profile.organization].moid
  tags                = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  target_platform     = each.value.profile.target_platform == "Standalone" ? "Standalone" : "FIAttached"
  wait_for_completion = each.value.profile.wait_for_completion
  assigned_chassis = each.value.profile.assigned_chassis == true ? [
    {
      moid = data.intersight_equipment_chassis.chassis[each.key].results[0].moid
    }
  ] : []
  # src_template        = each.value.src_template
}

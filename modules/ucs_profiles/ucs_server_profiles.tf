#_________________________________________________________________________
#
# Intersight UCS Server Profile Variables
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

variable "ucs_server_profiles" {
  default = {
    default = {
      action                      = "No-op"
      assign_server               = false
      description                 = ""
      name                        = "" # If Name is not specified the Serial Will be assigned as the Hostname
      ucs_server_profile_template = ""
      tags                        = []
      wait_for_completion         = false
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  key - Serial Number for a/the physical server.
  * action - Action to Perform on the Chassis Profile Assignment.  Options are:
    - Deploy
    - No-op
    - Unassign
  * assign_server - Flag to determine if a physical server should be assigned to the server profile or not.  Default is false.
  * description - Description to Assign to the Profile.
  * name - Name to assign to the server profile.
  * ucs_server_profile_template - Name of the server template to apply to the server profile.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * wait_for_completion - This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state.
  EOT
  type = map(object(
    {
      action                      = optional(string)
      assign_server               = optional(bool)
      description                 = optional(string)
      name                        = optional(string)
      ucs_server_profile_template = optional(string)
      tags                        = optional(list(map(string)))
      wait_for_completion         = optional(bool)
    }
  ))
}

#_________________________________________________________________________
#
# Intersight UCS Server Profile Module
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

module "ucs_server_profiles" {
  depends_on = [
    local.org_moids
  ]
  source              = "../../../terraform-intersight-imm/modules/ucs_server_profiles"
  for_each            = local.ucs_server_profiles
  # action              = each.value.profile.action
  # description         = each.value.profile.description != "" ? each.value.profile.description : "${each.value.profile.organization} ${each.value.profile.name} Server Profile."
  # name                = each.value.profile.name != "" ? each.value.profile.name : each.key
  org_moid            = ""
  # org_moid            = local.org_moids[each.value.profile.organization].moid
  # tags                = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  # target_platform     = each.value.profile.target_platform == "Standalone" ? "Standalone" : "FIAttached"
  # wait_for_completion = each.value.profile.wait_for_completion
  # assigned_server = each.value.profile.assign_server == true ? [
  #   {
  #     moid        = data.intersight_compute_physical_summary.server[each.key].results[0].moid
  #     object_type = data.intersight_compute_physical_summary.server[each.key].results[0].source_object_type
  #   }
  # ] : []
  # src_template        = each.value.src_template
}

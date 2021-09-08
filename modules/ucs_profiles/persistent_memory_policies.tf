#_________________________________________________________________________
#
# Intersight Persistent Memory Policies Variables
# GUI Location: Configure > Policies > Create Policy > Persistent Memory
#_________________________________________________________________________

variable "persistent_passphrase" {
  default     = ""
  description = "Secure passphrase to be applied on the Persistent Memory Modules on the server. The allowed characters are a-z, A to Z, 0-9, and special characters =, \u0021, &, #, $, %, +, ^, @, _, *, -."
  sensitive   = true
  type        = string
}

variable "persistent_memory_policies" {
  default = {
    default = {
      description                  = ""
      goals_memory_percentage      = 0
      goals_persistent_memory_type = "app-direct"
      logical_namespaces           = []
      management_mode              = "configured-from-intersight"
      organization                 = "default"
      retain_namespaces            = true
      tags                         = []
    }
  }
  description = <<-EOT
  key - Name of the Persistent Memory Policy.
  * description - Description to Assign to the Policy.
  * goals_memory_percentage - Volatile memory percentage.  Range is 0-100.
  * goals_persistent_memory_type - Type of the Persistent Memory configuration where the Persistent Memory Modules are combined in an interleaved set or not.
    - app-direct - The App Direct interleaved Persistent Memory type.
    - app-direct-non-interleaved - The App Direct non-interleaved Persistent Memory type.
  * logical_namespaces - List of Profiles to Assign to the Policy.
  * management_mode - Management Mode of the policy. This can be either Configured from Intersight or Configured from Operating System.
    - configured-from-intersight - The Persistent Memory Modules are configured from Intersight thorugh Persistent Memory policy.
    - configured-from-operating-system - The Persistent Memory Modules are configured from operating system thorugh OS tools.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * retain_namespaces - Persistent Memory Namespaces to be retained or not.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description                  = optional(string)
      goals_memory_percentage      = optional(number)
      goals_persistent_memory_type = optional(string)
      logical_namespaces           = optional(list(map(string)))
      management_mode              = optional(string)
      organization                 = optional(string)
      retain_namespaces            = optional(bool)
      tags                         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Persistent Memory Policies
# GUI Location: Configure > Policies > Create Policy > Persistent Memory
#_________________________________________________________________________

module "persistent_memory_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles,
    module.ucs_server_profile_templates
  ]
  source                       = "terraform-cisco-modules/imm/intersight//modules/persistent_memory_policies"
  for_each                     = local.persistent_memory_policies
  description                  = each.value.description != "" ? each.value.description : "${each.key} Persistent Memory Policy."
  goals_memory_percentage      = each.value.goals_memory_percentage
  goals_persistent_memory_type = each.value.goals_persistent_memory_type
  logical_namespaces           = each.value.logical_namespaces
  management_mode              = each.value.management_mode
  name                         = each.key
  org_moid                     = local.org_moids[each.value.organization].moid
  retain_namespaces            = each.value.retain_namespaces
  secure_passphrase            = var.persistent_passphrase
  tags                         = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merged_server_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merged_server_moids[k].persistent_memory_policy == each.key
  }
}



terraform {
  experiments = [module_variable_optional_attrs]
}

#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}


#__________________________________________________________
#
# Global Variables
#__________________________________________________________

variable "organizations" {
  default     = ["default"]
  description = "Intersight Organization Names."
  type        = set(string)
}

variable "tags" {
  default     = []
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  type        = list(map(string))
}


#_________________________________________________________________________
#
# Intersight UCS Server Profile Module
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

variable "ucs_server_profiles" {
  default = {
    default = {
      action              = "No-op"
      assign_server       = false
      bios_policy         = "vmware_node"
      description         = ""
      name                = "" # If Name is not specified the Serial Will be assigned as the Hostname
      operating_system    = "vmware"
      organization        = "default"
      policy_bucket       = []
      src_template        = []
      tags                = []
      target_platform     = "FIAttached"
      type                = "instance"
      wait_for_completion = false
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  1. organization - Name of the Intersight Organization to assign this pool to:
    *  https://intersight.com/an/settings/organizations/
  2. For the remainder of the option documentation refer to these sources:
    * https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/server_profile
  EOT
  type = map(object(
    {
      action              = optional(string)
      assign_server       = optional(bool)
      bios_policy         = optional(string)
      description         = optional(string)
      name                = optional(string)
      operating_system    = optional(string)
      organization        = optional(string)
      policy_bucket       = optional(list(map(string)))
      src_template        = optional(set(string))
      tags                = optional(list(map(string)))
      target_platform     = optional(string)
      type                = optional(string)
      wait_for_completion = optional(bool)
    }
  ))
}

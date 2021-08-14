terraform {
  experiments = [module_variable_optional_attrs]
}

#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

variable "tfc_organization" {
  description = "Terraform Cloud Organization Name."
  type        = string
}

variable "ws_domain" {
  default     = "Kubernetes_Policies"
  description = "Name of the domain workspace."
  type        = string
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
# Intersight Multicast Policy Variables
# GUI Location: Configure > Policies > Create Policy > Multicast > Start
#_________________________________________________________________________

variable "multicast_policy" {
  default = {
    default = {
      description    = ""
      organization   = "default"
      querier_ip     = ""
      querier_state  = "Disabled"
      snooping_state = "Enabled"
      tags           = []
    }
  }
  description = <<-EOT
  key - Name of the Power Policy.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * querier_ip - IP Address of the IGMP Querier to Assign to the VLAN through this Policy.
  * querier_state - Administrative state of the IGMP Querier for the VLANs Assigned to this Policy.  Options are:
    - Disabled - (Default)
    - Enabled
  * snooping_state - Administrative State for Snooping for the VLANs Assigned to this Policy.
    - Disabled
    - Enabled - (Default)
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description    = optional(string)
      organization   = optional(string)
      querier_ip     = optional(string)
      querier_state  = optional(string)
      snooping_state = optional(string)
      tags           = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Intersight VLAN Policy Variables
# GUI Location: Configure > Policies > Create Policy > VLAN > Start
#_________________________________________________________________________

variable "vlan_lists" {
  default = {
    default = {
      multicast_policy = ""
      vlan_native      = null
      vlan_list        = null
      vlan_policy      = null
      vlan_prefix      = ""
    }
  }
  description = <<-EOT
  key - Name of the Power Policy.
  * multicast_policy - Name of the Multicast Policy to Assign to the VLAN Group.
  * vlan_list - List of VLANs to assign to the VLAN Policy.
  * vlan_policy - Name of the VLAN Policy
  * vlan_prefix - Prefix to Assign to the VLANs in the VLAN Map.
  EOT
  type = map(object(
    {
      multicast_policy = string
      vlan_native      = optional(number)
      vlan_list        = string
      vlan_policy      = string
      vlan_prefix      = optional(string)
    }
  ))
}

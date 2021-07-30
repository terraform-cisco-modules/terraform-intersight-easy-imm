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


#__________________________________________________________
#
# Intersight UCS Domain Profile Variables
#__________________________________________________________

variable "assign_switches" {
  default     = false
  description = "Setting this Flag to True will Assign Switches to Profile."
  type        = bool
}

variable "ucs_domain_profile" {
  default = {
    default = { # The UCS Domain Profile Name will be {each.key}.  In this case it would be default if left like this.
      action             = "No-op"
      description_domain = ""
      description_fi_a   = ""
      description_fi_b   = ""
      fabric_a_serial    = ""
      fabric_b_serial    = ""
      policy_bucket      = []
      organization       = "default"
      tags               = []
    }
  }
  description = "Intersight UCS Domain Profile Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to these sources:\r\n* https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/domain_profile_cluster\r\n* https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/domain_profile_switch"
  type = map(object(
    {
      action             = optional(string)
      description_domain = optional(string)
      description_fi_a   = optional(string)
      description_fi_b   = optional(string)
      fabric_a_serial    = optional(string)
      fabric_b_serial    = optional(string)
      organization       = optional(string)
      policy_bucket      = optional(list(map(string)))
      tags               = optional(list(map(string)))
    }
  ))
}

# variable "tfc_variables" {
#   description = "Object Map of Variables to Assign to the Domain Profile."
#   type        = object({
#     serial_a              = string
#     serial_b              = string
#     dns_policy            = optional(string)
#     ntp_policy            = optional(string)
#     port_policy           = optional(string)
#     snmp_policy           = optional(string)
#     switch_control_policy = optional(string)
#     syslog_policy         = optional(string)
#     system_qos_policy     = optional(string)
#     vlan_policy           = optional(string)
#     vsan_policy           = optional(string)
#   })
# }

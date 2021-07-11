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

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name."
  type        = string
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

variable "action" {
  default     = "No-op"
  description = "Action to Perform on the Switch Profile Assignment.  Options are {Deploy|No-op|Unassign}."
  type        = string
}

variable "assign_switches" {
  default     = true
  description = "Setting this Flag to True will Assign Switches to Profile."
  type        = bool
}

variable "cluster_name" {
  default     = "easyimm"
  description = "The cluster name will be assigned for service-profile naming."
  type        = string
}

variable "serial_switch_a" {
  default     = ""
  description = "Serial Number of Fabric Interconnect A."
  type        = string
}

variable "serial_switch_b" {
  default     = ""
  description = "Serial Number of Fabric Interconnect B."
  type        = string
}

variable "tfc_variables" {
  type = object({
    serial_a           = string
    serial_b           = string
    dns_policy         = optional(string)
    ntp_policy         = optional(string)
    port_policy        = optional(string)
    snmp_policy        = optional(string)
    switch_ctrl_policy = optional(string)
    syslog_policy      = optional(string)
    system_qos_policy  = optional(string)
    vlan_policy        = optional(string)
    vsan_policy        = optional(string)
  })
}


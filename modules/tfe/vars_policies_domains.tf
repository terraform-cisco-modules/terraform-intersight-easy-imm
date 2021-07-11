#______________________________________________
#
# Terraform Cloud domain_workspace Workspace
#______________________________________________

variable "domain_workspace" {
  description = "Domain Workspace Name."
  type        = string
}

variable "assign_domain" {
  default     = true
  description = "Flag to Assign Policies to Domain or not."
  type        = bool
}

variable "snmp_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}

variable "snmp_users" {
  default     = []
  description = "List of SNMP User Settings."
  type        = list(map(string))
}

variable "trap_community" {
  default     = ""
  description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
  sensitive   = true
  type        = string
}


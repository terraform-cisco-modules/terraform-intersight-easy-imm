#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
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
  description = "Serial Number of Fabric Interconnect A."
  type        = string
}

variable "serial_switch_b" {
  description = "Serial Number of Fabric Interconnect B."
  type        = string
}

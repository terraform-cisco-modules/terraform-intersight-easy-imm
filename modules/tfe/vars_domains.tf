#__________________________________________________________
#
# UCS Domain Variables
#__________________________________________________________

variable "domain_list" {
  description = "List of UCS Domain Names to Create workspaces for."
  type        = map(object({
    domain        = string
    tfc_variables = string
  }))
}

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


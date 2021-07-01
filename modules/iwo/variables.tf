#__________________________________________________________
#
# Terraform Cloud Organization
#__________________________________________________________

variable "tfc_organization" {
  default     = "CiscoDevNet"
  description = "Terraform Cloud Organization."
  type        = string
}


#______________________________________________
#
# Terraform Cloud global_vars Workspace
#______________________________________________

variable "ws_global_vars" {
  default     = ""
  description = "Global Variables Workspace Name.  The default value will be set to {cluster_name}_global_vars by the tfe variable module."
  type        = string
}

variable "ws_kube" {
  default     = ""
  description = "Intersight Kubernetes Service (IKS) kube_config Workspace Name.  The default value will be set to {cluster_name}_kube by the tfe variable module."
  type        = string
}

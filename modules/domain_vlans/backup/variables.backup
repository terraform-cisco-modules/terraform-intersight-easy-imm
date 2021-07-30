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
  default     = "[\"default\"]"
  description = "Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "tags" {
  default     = "[]"
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = string
}


#__________________________________________________________
#
# Intersight UCS Domain Profile Variables
#__________________________________________________________

variable "ucs_domain_profile" {
  description = "Please Refer to the ucs_domain_profile variable information in the tfe module.  In the domains module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

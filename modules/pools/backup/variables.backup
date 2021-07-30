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
  default     = "[\"default\"]"
  description = "Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "tags" {
  default     = "[]"
  description = "Tags to be Associated with Objects Created in Intersight."
  type        = string
}


#______________________________________________
#
# Fibre-Channel Pool Variables
#______________________________________________

variable "fc_pools_create" {
  default     = false
  description = "Set this to True if you want to Create a Fibre-Channel Pool."
  type        = bool
}

variable "fc_pools_map" {
  description = "Please Refer to the fc_pools_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

variable "ip_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an IP Pool."
  type        = bool
}

variable "ip_pools_map" {
  description = "Please Refer to the ip_pools_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# IQN Pool Variables
#______________________________________________

variable "iqn_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an IQN Pool."
  type        = bool
}

variable "iqn_pools_map" {
  description = "Please Refer to the iqn_pools_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# MAC Pool Variables
#______________________________________________

variable "mac_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an MAC Pool."
  type        = bool
}

variable "mac_pools_map" {
  description = "Please Refer to the mac_pools_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}


#______________________________________________
#
# UUID Pool Variables
#______________________________________________

variable "uuid_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an MAC Pool."
  type        = bool
}

variable "uuid_pools_map" {
  description = "Please Refer to the uuid_pools_map variable information in the tfe module.  In the pools module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals."
  type        = string
}

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
# Terraform Workspace Variables
#__________________________________________________________

variable "tfc_workspaces" {
  default = [
    {
      backend          = "remote"
      tfc_organization = "default"
      ws_pools         = "default_pools"
      ws_policies      = "default_ucs_domain_profiles"
    }
  ]
  description = <<-EOT
  * backend: Options are:
    - local - The backend is on the Local Machine
    - Remote - The backend is in TFCB.
  * tfc_organization: Name of the Terraform Cloud Organization
  * ws_policies: Name of the policies workspace
  * ws_pools: Name of the pools workspace.
  EOT
  type = list(object(
    {
      backend          = string
      tfc_organization = string
      ws_pools         = string
      ws_policies      = string
    }
  ))
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

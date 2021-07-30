#_______________________________________________________________________
#
# Terraform Required Parameters - Intersight Provider
# https://registry.terraform.io/providers/CiscoDevNet/intersight/latest
#_______________________________________________________________________

terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.11"
    }
  }
}

#______________________________________________
#
# Intersight Provider Settings
#______________________________________________

provider "intersight" {
  apikey    = var.apikey
  endpoint  = yamldecode(data.terraform_remote_state.global.outputs.endpoint)
  secretkey = var.secretkey
}

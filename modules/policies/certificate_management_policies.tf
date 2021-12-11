#____________________________________________________________________________
#
# Intersight Certificate Management Policies Variables
# GUI Location: Configure > Policies > Create Policy > Certificate Management
#____________________________________________________________________________

variable "base64_certificate_1" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_2" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_3" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_4" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_certificate_5" {
  default     = ""
  description = "The Server Certificate in Base64 format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_1" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_2" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_3" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_4" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "base64_private_key_5" {
  default     = ""
  description = "Private Key in Base64 Format."
  sensitive   = true
  type        = string
}

variable "certificate_management_policies" {
  default = {
    default = {
      certificate_number = 1
      description        = ""
      enabled            = true
      organization       = "default"
      private_key_number = 1
      tags               = []
    }
  }
  description = <<-EOT
  key - Name of the Adapter Configuration Policy.
  * certificate_number - The Number of the base64_certificate Variable.  i.e. 1 = base64_certificate_1.
  * description - Description to Assign to the Policy.
  * enabled - "Enable/Disable the Certificate Management policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * private_key_number - The Number of the base64_private_key Variable.  i.e. 1 = base64_private_key_1.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      certificate_number = number
      description        = optional(string)
      enabled            = optional(bool)
      organization       = optional(string)
      private_key_number = number
      tags               = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Certificate Management Policies
# GUI Location: Configure > Policies > Create Policy > Certificate Management
#_________________________________________________________________________

module "certificate_management_policies" {
  depends_on = [
    local.org_moids,
    local.merged_profile_policies,
  ]
  version  = ">=0.9.6"
  source   = "terraform-cisco-modules/imm/intersight//modules/certificate_management_policies"
  for_each = local.certificate_management_policies
  base64_certificate = length(
    regexall("1", each.value.certificate_number)
    ) > 0 ? var.base64_certificate_1 : length(
    regexall("2", each.value.certificate_number)
    ) > 0 ? var.base64_certificate_2 : length(
    regexall("3", each.value.certificate_number)
    ) > 0 ? var.base64_certificate_3 : length(
    regexall("4", each.value.certificate_number)
    ) > 0 ? var.base64_certificate_4 : length(
    regexall("5", each.value.certificate_number)
  ) > 0 ? var.base64_certificate_5 : null
  description = each.value.description != "" ? each.value.description : "${each.key} Certificate Management Policy."
  enabled     = each.value.enabled
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  base64_private_key = length(
    regexall("1", each.value.private_key_number)
    ) > 0 ? var.base64_private_key_1 : length(
    regexall("2", each.value.private_key_number)
    ) > 0 ? var.base64_private_key_2 : length(
    regexall("3", each.value.private_key_number)
    ) > 0 ? var.base64_private_key_3 : length(
    regexall("4", each.value.private_key_number)
    ) > 0 ? var.base64_private_key_4 : length(
    regexall("5", each.value.private_key_number)
  ) > 0 ? var.base64_private_key_5 : null
  tags = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merged_profile_policies : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merged_profile_policies[k].certificate_management_policy == each.key
  }
}

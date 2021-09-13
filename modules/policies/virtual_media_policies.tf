#_________________________________________________________________________
#
# Intersight Virtual Media Policies Variables
# GUI Location: Configure > Policies > Create Policy > Virtual Media
#_________________________________________________________________________

variable "virtual_media_policies" {
  default = {
    default = {
      description                     = ""
      enabled                         = true
      enable_low_power_usb            = false
      enable_virtual_media_encryption = true
      organization                    = "default"
      tags                            = []
      vmedia_mappings                 = []
    }
  }
  description = <<-EOT
  key - Name of the Virtual Media Policy.
  * description - Description to Assign to the Policy.
  * enabled - Default is true.  Flag to Enable or Disable the Policy.
  * enable_low_power_usb - Default is false.  If enabled, the virtual drives appear on the boot selection menu after mapping the image and rebooting the host.
  * enable_virtual_media_encryption - Default is true.  If enabled, allows encryption of all Virtual Media communications.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * vmedia_mappings - List of Properties to Assign to the Policy.
  EOT
  type = map(object(
    {
      description                     = optional(string)
      enabled                         = optional(bool)
      enable_low_power_usb            = optional(bool)
      enable_virtual_media_encryption = optional(bool)
      organization                    = optional(string)
      tags                            = optional(list(map(string)))
      vmedia_mappings                 = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Virtual Media Policies
# GUI Location: Configure > Policies > Create Policy > Virtual Media
#_________________________________________________________________________

module "virtual_media_policies" {
  depends_on = [
    local.org_moids,
    # module.ucs_server_profiles
  ]
  source                          = "terraform-cisco-modules/imm/intersight//modules/virtual_media_policies"
  for_each                        = local.virtual_media_policies
  description                     = each.value.description != "" ? each.value.description : "${each.key} Virtual Media Policy."
  enabled                         = each.value.enabled
  enable_virtual_media_encryption = each.value.enable_virtual_media_encryption
  enable_low_power_usb            = each.value.enable_low_power_usb
  mappings                        = each.value.vmedia_mappings
  name                            = each.key
  org_moid                        = local.org_moids[each.value.organization].moid
  tags                            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merged_server_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merged_server_moids[k].virtual_media_policy == each.key
  }
}

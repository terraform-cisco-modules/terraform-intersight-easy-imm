#_________________________________________________________________________
#
# Intersight Virtual Media Policies Variables
# GUI Location: Configure > Policies > Create Policy > Virtual Media
#_________________________________________________________________________

variable "policies_virtual_media" {
  default = {
    default = {
      description     = ""
      enabled         = true
      encryption      = true
      low_power_usb   = false
      organization    = "default"
      tags            = []
      vmedia_mappings = []
    }
  }
  description = <<-EOT
  key - Name of the Virtual Media Policy.
  * description - Description to Assign to the Policy.
  * enabled - Flag to Enable or Disable the Policy.
  * encryption - If enabled, allows encryption of all Virtual Media communications.
  * low_power_usb - If enabled, the virtual drives appear on the boot selection menu after mapping the image and rebooting the host.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * vmedia_mappings - List of Properties to Assign to the Policy.
  EOT
  type = map(object(
    {
      description     = optional(string)
      enabled         = optional(bool)
      encryption      = optional(bool)
      low_power_usb   = optional(bool)
      organization    = optional(string)
      tags            = optional(list(map(string)))
      vmedia_mappings = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Virtual Media Policies
# GUI Location: Configure > Policies > Create Policy > Virtual Media
#_________________________________________________________________________

module "virtual_media" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/policies_virtual_media"
  for_each      = local.policies_virtual_media
  description   = each.value.description != "" ? each.value.description : "${each.key} Virtual Media Policy."
  enabled       = each.value.enabled
  encryption    = each.value.encryption
  low_power_usb = each.value.low_power_usb
  mappings      = each.value.vmedia_mappings
  name          = each.key
  org_moid      = local.org_moids[each.value.organization].moid
  tags          = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_virtual_media == each.key
  ]
}


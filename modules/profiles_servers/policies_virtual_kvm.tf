#_________________________________________________________________________
#
# Intersight Virtual KVM Policies Variables
# GUI Location: Configure > Policies > Create Policy > Virtual KVM
#_________________________________________________________________________

variable "policies_virtual_kvm" {
  default = {
    default = {
      description        = ""
      enabled            = true
      local_server_video = true
      maximum_sessions   = 4
      organization       = "default"
      remote_port        = 2068
      tags               = []
      video_encryption   = true
    }
  }
  description = <<-EOT
  key - Name of the Virtual KVM Policy.
  * description - Description to Assign to the Policy.
  * enabled - Flag to Enable or Disable the Policy.
  * local_server_video - If enabled, displays KVM session on any monitor attached to the server.
  * maximum_sessions - The maximum number of concurrent KVM sessions allowed. Range is 1 to 4.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * remote_port - The port used for KVM communication. Range is 1 to 65535.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * video_encryption - If enabled, encrypts all video information sent through KVM.
  EOT
  type = map(object(
    {
      description        = optional(string)
      enabled            = optional(bool)
      local_server_video = optional(bool)
      maximum_sessions   = optional(number)
      organization       = optional(string)
      remote_port        = optional(number)
      tags               = optional(list(map(string)))
      video_encryption   = optional(bool)
    }
  ))
}


#_________________________________________________________________________
#
# Virtual KVM Policies
# GUI Location: Configure > Policies > Create Policy > Virtual KVM
#_________________________________________________________________________

module "policies_virtual_kvm" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source                    = "terraform-cisco-modules/imm/intersight//modules/policies_virtual_kvm"
  for_each                  = local.policies_virtual_kvm
  description               = each.value.description != "" ? each.value.description : "${each.key} Virtual KVM Policy."
  enable_local_server_video = each.value.local_server_video
  enable_video_encryption   = each.value.video_encryption
  enabled                   = each.value.enabled
  maximum_sessions          = each.value.maximum_sessions
  name                      = each.key
  org_moid                  = local.org_moids[each.value.organization].moid
  remote_port               = each.value.remote_port
  tags                      = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_virtual_kvm == each.key
  ]
}

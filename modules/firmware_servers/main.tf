#_________________________________________________________________________
#
# Intersight Server Firmware Variables
# GUI Location: Operate > Server > {Select a Server} > Click Drop Down > Upgrade Firmware
#_________________________________________________________________________

variable "auth_password_direct" {
  default     = ""
  description = "Password for Direct Download Authentication."
  sensitive   = true
  type        = string
}

variable "auth_password_filesrv" {
  default     = ""
  description = "Password for File Server Authentication."
  sensitive   = true
  type        = string
}

variable "firmware_upgrade_server" {
  default = {
    default = {
      auth_username         = "**REQUIRED**"
      exclude_components    = []
      file_location         = ""
      file_server           = ""
      http_image_url        = ""
      image_source          = "cisco"
      map_type              = "www"
      mount_options         = ""
      organization          = "default"
      skip_estimate_impact  = false
      server_names          = []
      tags                  = []
      upgrade_type          = "direct_upgrade"
      upgradeoption_direct  = "upgrade_full"
      upgradeoption_filesrv = "nw_upgrade_full"

    }
  }
  description = <<-EOT
  key - Version of UCS Software to Apply to the environment.  I.e 4.1(3c)
  * auth_username - Username used to authenticate to any service; i.e. cifs, direct, nfs and www.
  * exclude_components    - An Array of Elements to Exclude from the Upgrade Proceedure.
  * file_location - ""
  * file_server - ""
  * http_image_url - ""
  * image_source - "cisco"
  * map_type - "www"
  * mount_options - ""
  * organization - "default"
  * skip_estimate_impact - false
  * server_names - []
  * tags - []
  * upgrade_type - "direct_upgrade"
  * upgradeoption_direct - "upgrade_full"
  * upgradeoption_filesrv - "nw_upgrade_full"
  * com_port - Communications Port to Assign to the Policy.  Options are:
    - com0
    - com1
  * description - Description to Assign to the Policy.
  * enabled - Flag to Enable or Disable the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * ssh_port - SSH Port to Assign to the Policy.  Range is between 1024-65535.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      baud_rate    = optional(number)
      com_port     = optional(string)
      description  = optional(string)
      enabled      = optional(bool)
      organization = optional(string)
      ssh_port     = optional(number)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Serial over LAN Policies
# GUI Location: Configure > Policies > Create Policy > Serial over LAN
#_________________________________________________________________________

module "ucs_server_firmware" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/ucs_server_firmware"
  for_each    = local.policies_serial_over_lan
  baud_rate   = each.value.baud_rate
  com_port    = each.value.com_port
  description = each.value.description != "" ? each.value.description : "${each.key} Serial over LAN Policy."
  enabled     = each.value.enabled
  ssh_port    = each.value.ssh_port
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_serial_over_lan == each.key
  ]
}



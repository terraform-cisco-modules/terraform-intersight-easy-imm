#_________________________________________________________________________
#
# Intersight Serial over LAN Policies Variables
# GUI Location: Configure > Policies > Create Policy > Serial over LAN
#_________________________________________________________________________

variable "policies_serial_over_lan" {
  default = {
    default = {
      baud_rate    = 115200
      com_port     = "com0"
      description  = ""
      enabled      = true
      organization = "default"
      ssh_port     = 2400
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the Serial over LAN Policy.
  * baud_rate - Baud Rate to Assign to the Policy.  Options are:
    - 9600
    - 19200
    - 38400
    - 57600
    - 115200
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

module "policies_serial_over_lan" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_serial_over_lan"
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



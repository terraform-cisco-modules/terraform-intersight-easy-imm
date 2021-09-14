#_________________________________________________________________________
#
# Ethernet Network Policies - Standalone Servers
# GUI Location: Configure > Policies > Create Policy > Ethernet Network
#_________________________________________________________________________

variable "ethernet_network_policies" {
  default = {
    default = {
      allowed_vlans = ""
      description   = ""
      mode          = "ACCESS"
      native_vlan   = 0
      organization  = "default"
      tags          = []
    }
  }
  description = <<-EOT
  key - Name of the Ethernet Network Group Policy
  * allowed_vlans - List of VLAN's to Add to the VLAN Group Policy.
  * description - Description for the Policy.
  * mode - Default is ACCESS.  Option to determine if the port can carry single VLAN (Access) or multiple VLANs (Trunk) traffic.
    - ACCESS - An access port carries traffic only for a single VLAN on the interface.
    - TRUNK - A trunk port can have two or more VLANs configured on the interface. It can carry traffic for several VLANs simultaneously.
  * native_vlan - Default is 0.  Native VLAN ID of the virtual interface or the corresponding vethernet on the peer Fabric Interconnect to which the virtual interface is connected. Setting the ID to 0 will not associate any native VLAN to the traffic on the virtual interface.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - Default is [].  List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      allowed_vlans = optional(string)
      description   = optional(string)
      mode          = optional(string)
      native_vlan   = optional(number)
      organization  = optional(string)
      tags          = optional(list(map(string)))
    }
  ))
}

module "ethernet_network_policies" {
  depends_on = [
    local.org_moids
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/ethernet_network_policies"
  for_each      = var.ethernet_network_policies
  allowed_vlans = each.value.allowed_vlans
  description   = each.value.description != "" ? each.value.description : "${each.key} Ethernet Network Policy."
  mode          = each.value.mode
  name          = each.key
  native_vlan   = each.value.native_vlan
  org_moid      = local.org_moids[each.value.organization].moid
  tags          = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

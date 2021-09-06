#_________________________________________________________________________
#
# Intersight iSCSI Adapter Policy Variables
# GUI Location: Configure > Policies > Create Policy > iSCSI Adapter
#_________________________________________________________________________

variable "iscsi_adapter_policies" {
  default = {
    default = {
      description            = ""
      dhcp_timeout           = 60
      lun_busy_retry_count   = 15
      organization           = "default"
      tags                   = []
      tcp_connection_timeout = 15
    }
  }
  description = <<-EOT
  key - Name of the iSCSI Adapter Policy.
  * description - Description to Assign to the Policy.
  * dhcp_timeout - Default is 60.  The number of seconds to wait before the initiator assumes that the DHCP server is unavailable.  Range is 60-300.
  * lun_busy_retry_count - Default is 15.  The number of times to retry the connection in case of a failure during iSCSI LUN discovery.  Range is 0-60.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * tcp_connection_timeout - Default is 15.  The number of seconds to wait until Cisco UCS assumes that the initial login has failed and the iSCSI adapter is unavailable.  Range is 0-255.
  EOT
  type = map(object(
    {
      description            = optional(string)
      dhcp_timeout           = optional(string)
      lun_busy_retry_count   = optional(string)
      organization           = optional(string)
      tags                   = optional(list(map(string)))
      tcp_connection_timeout = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# iSCSI Adapter Policies
# GUI Location: Configure > Policies > Create Policy > iSCSI Adapter
#_________________________________________________________________________

module "iscsi_adapter_policies" {
  depends_on = [
    local.org_moids
  ]
  source                 = "../../../terraform-intersight-imm/modules/iscsi_adapter_policies"
  for_each               = local.iscsi_adapter_policies
  description            = each.value.description != "" ? each.value.description : "${each.key} iSCSI Adapter Policy."
  dhcp_timeout           = each.value.dhcp_timeout
  lun_busy_retry_count   = each.value.lun_busy_retry_count
  org_moid               = local.org_moids[each.value.organization].moid
  tags                   = length(each.value.tags) > 0 ? each.value.tags : local.tags
  tcp_connection_timeout = each.value.tcp_connection_timeout
}

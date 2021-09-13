#_________________________________________________________________________
#
# Intersight iSCSI Boot Policy Variables
# GUI Location: Configure > Policies > Create Policy > iSCSI Boot
#_________________________________________________________________________

variable "chap_password_1" {
  default     = ""
  description = "Chap Password to Assign to the Policy if doing CHAP Authentication."
  sensitive   = true
  type        = string
}

variable "mschap_password_1" {
  default     = ""
  description = "MSChap Password to Assign to the Policy if doing MSCHAP Authentication."
  sensitive   = true
  type        = string
}

variable "iscsi_boot_policies" {
  default = {
    default = {
      chap_password                    = ""
      chap_user_id                     = ""
      dhcp_vendor_id_iqn               = ""
      description                      = ""
      initiator_ip_pool                = ""
      initiator_ip_source              = "Pool"
      initiator_static_default_gateway = ""
      initiator_static_ip_address      = ""
      initiator_static_primary_dns     = ""
      initiator_static_secondary_dns   = ""
      initiator_static_subnet_mask     = ""
      iscsi_adapter_policy             = ""
      mschap_password                  = ""
      mschap_user_id                   = ""
      primary_target_policy            = ""
      organization                     = "default"
      secondary_target_policy          = ""
      target_source_type               = "Auto"
      tags                             = []
    }
  }
  description = <<-EOT
  key - Name of the iSCSI Boot Policy.
  * chap_password - Chap Password Identifier. I.e. 1 would be for chap_password_1.
  * chap_user_id - Chap User Id, if doing chap authentication.
  * dhcp_vendor_id_iqn - Auto target interface that is represented via the Initiator name or the DHCP vendor ID. The vendor ID can be up to 32 alphanumeric characters.
  * description - Description to Assign to the Policy.
  * initiator_ip_pool - A reference to a ippoolPool resource.
  * initiator_ip_source - Default is Pool.  Source Type of Initiator IP Address - DHCP/Static/Pool.
    - DHCP - The IP address is assigned using DHCP, if available.
    - Static - Static IPv4 address is assigned to the iSCSI boot interface based on the information entered in this area.
    - Pool - An IPv4 address is assigned to the iSCSI boot interface from the management IP address pool.
  * initiator_static_default_gateway - IP address of the default IPv4 gateway.
  * initiator_static_ip_address -  Static IP address provided for iSCSI Initiator.
  * initiator_static_primary_dns - IP Address of the primary Domain Name System (DNS) server.
  * initiator_static_secondary_dns - IP Address of the secondary Domain Name System (DNS) server.
  * initiator_static_subnet_mask - A subnet mask is a 32-bit number that masks an IP address and divides the IP address into network address and host address.
  * iscsi_adapter_policy - The Name of the iSCSI Adapter Policy to Assign to the iSCSI Boot Policy.
  * mschap_password -  MSChap Password Identifier. I.e. 1 would be for mschap_password_1.
  * mschap_user_id - Mutual Chap User Id, if doing mschap authentication.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * primary_target_policy - Name of the Primary iSCSI Static Target Policy to Associate to the iSCSI Boot Policy.
  * secondary_target_policy - Name of the Secondary iSCSI Static Target Policy to Associate to the iSCSI Boot Policy.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * target_source_type - Default is Auto.  Source Type of Targets - Auto/Static.
    - Auto - Type indicates that the system selects the target interface automatically during iSCSI boot.
    - Static - Type indicates that static target interface is assigned to iSCSI boot.
  EOT
  type = map(object(
    {
      chap_password                    = optional(string)
      chap_user_id                     = optional(string)
      dhcp_vendor_id_iqn               = optional(string)
      description                      = optional(string)
      initiator_ip_pool                = optional(string)
      initiator_ip_source              = optional(string)
      initiator_static_default_gateway = optional(string)
      initiator_static_ip_address      = optional(string)
      initiator_static_primary_dns     = optional(string)
      initiator_static_secondary_dns   = optional(string)
      initiator_static_subnet_mask     = optional(string)
      iscsi_adapter_policy             = optional(string)
      mschap_password                  = optional(string)
      mschap_user_id                   = optional(string)
      organization                     = optional(string)
      primary_target_policy            = optional(string)
      secondary_target_policy          = optional(string)
      tags                             = optional(list(map(string)))
      target_source_type               = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# iSCSI Boot Policies
# GUI Location: Configure > Policies > Create Policy > iSCSI Boot
#_________________________________________________________________________

module "iscsi_boot_policies" {
  depends_on = [
    data.terraform_remote_state.pools,
    local.org_moids,
    module.iscsi_adapter_policies,
    module.iscsi_static_target_policies,
  ]
  source                           = "terraform-cisco-modules/imm/intersight//modules/iscsi_boot_policies"
  for_each                         = var.iscsi_boot_policies
  chap_password                    = each.value.chap_password == 1 ? var.chap_password_1 : ""
  chap_user_id                     = each.value.chap_user_id != null ? each.value.chap_user_id : ""
  dhcp_vendor_id_iqn               = each.value.dhcp_vendor_id_iqn != null ? each.value.dhcp_vendor_id_iqn : ""
  description                      = each.value.description != null ? each.value.description : "${each.key} iSCSI Boot Policy."
  initiator_ip_source              = each.value.initiator_ip_source != null ? each.value.initiator_ip_source : ""
  initiator_static_default_gateway = each.value.initiator_static_default_gateway != null ? each.value.initiator_static_default_gateway : ""
  initiator_static_ip_address      = each.value.initiator_static_ip_address != null ? each.value.initiator_static_ip_address : ""
  initiator_static_primary_dns     = each.value.initiator_static_primary_dns != null ? each.value.initiator_static_primary_dns : ""
  initiator_static_secondary_dns   = each.value.initiator_static_secondary_dns != null ? each.value.initiator_static_secondary_dns : ""
  initiator_static_subnet_mask     = each.value.initiator_static_subnet_mask != null ? each.value.initiator_static_subnet_mask : ""
  mschap_password                  = each.value.mschap_password == 1 ? var.mschap_password_1 : ""
  mschap_user_id                   = each.value.mschap_user_id != null ? each.value.mschap_user_id : ""
  name                             = each.key
  primary_target_policy_moid = length(
    regexall("[a-zA-Z0-9]+", each.value.primary_target_policy)
  ) > 0 ? [module.iscsi_static_target_policies[each.value.primary_target_policy].moid] : []
  target_source_type = each.value.target_source_type != null ? each.value.target_source_type : "Auto"
  org_moid           = each.value.organization != null ? local.org_moids[each.value.organization].moid : local.org_moids["default"].moid
  tags               = each.value.tags != null ? each.value.tags : local.tags
  initiator_ip_pool = length(
    regexall("Pool", each.value.initiator_ip_source)
  ) > 0 ? [local.ip_pools[each.value.initiator_ip_pool]] : []
  iscsi_adapter_policy_moid = length(
    regexall("[a-zA-Z0-9]+", each.value.iscsi_adapter_policy)
  ) > 0 ? [module.iscsi_adapter_policies[each.value.iscsi_adapter_policy].moid] : []
  secondary_target_policy_moid = length(
    regexall("[a-zA-Z0-9]+", each.value.secondary_target_policy)
  ) > 0 ? [module.iscsi_static_target_policies[each.value.primary_target_policy].moid] : []
}

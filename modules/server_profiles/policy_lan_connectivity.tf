#_________________________________________________________________________
#
# Intersight Local User Policies Variables
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

variable "policy_local_users" {
  default = {
    default = {
      description              = ""
      enforce_strong_password  = true
      force_send_password      = false
      grace_period             = 0
      local_users              = []
      notification_period      = 15
      organization             = "default"
      password_expiry          = false
      password_expiry_duration = 90
      password_history         = 5
      tags                     = []
    }
  }
  description = <<-EOT
  key - Name of the Local User Policy.
  1. description - Description to Assign to the Policy.
  2. force_send_password - User password will always be sent to endpoint device. If the option is not selected, then user password will be sent to endpoint device for new users and if user password is changed for existing users.
  3. grace_period - Time period until when you can use the existing password, after it expires.
  4. local_users -
  5. notification_period - The duration after which the password will expire.
  6. organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  7. password_expiry - Enables password expiry on the endpoint.
  7. password_expiry_duration - Set time period for password expiration. Value should be greater than notification period and grace period.
  8. password_history - Tracks password change history. Specifies in number of instances, that the new password was already used.
  9. tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description              = optional(string)
      enforce_strong_password  = optional(bool)
      force_send_password      = optional(bool)
      grace_period             = optional(number)
      local_users              = optional(list(map(string)))
      notification_period      = optional(number)
      organization             = optional(string)
      password_expiry          = optional(bool)
      password_expiry_duration = optional(number)
      password_history         = optional(number)
      tags                     = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Local User Policies
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

#____________________________________________________________
#
# Ethernet (vNIC) Adapter Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_adapter_linux" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - Linux." : "${local.org_name} vNIC Adapter Policy - Linux."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_linux" : "${local.org_name}_linux"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queues = 2
  # Interrupt Settings - Reduce Interrupts
  interrupt_interrupts = 4
  # Disable Receive Side Scaling
  receive_side_scaling = false
  # Reduce Receive Queues
  rx_queue_count = 1
}

module "vnic_adapter_nvmeof" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy for NVMe over Fabric." : "${local.org_name} vNIC Adapter Policy for NVMe over Fabric."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_nvmeof" : "${local.org_name}_nvmeof"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Increase Completion Queues
  completion_queues = 16
  # Interrupt Settings - Increase Interrupts
  interrupt_interrupts = 256
  # Enable RoCE
  roce_enable          = true
  roce_memory_regions  = 131072
  roce_queue_pairs     = 1024
  roce_resource_groups = 8
  # Recieve Settings - Increase Receive Settings
  rx_queue_count = 8
  rx_ring_size   = 4096
  # Transmit Settings - Increase Transmit Settings
  tx_queue_count = 8
  tx_ring_size   = 4096
}

module "vnic_adapter_vmware" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - VMware." : "${local.org_name} vNIC Adapter Policy - VMware."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_vmware" : "${local.org_name}_vmware"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queues = 2
  # Interrupt Settings - Reduce Interupts
  interrupt_interrupts = 4
  # Disable Receive Side Scaling
  receive_side_scaling = false
  # Reduce Receive Queues
  rx_queue_count = 1
}

module "vnic_adapter_windows" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - Windows." : "${local.org_name} vNIC Adapter Policy - Windows."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_windows" : "${local.org_name}_windows"
  org_moid    = local.org_moid
  tags        = var.tags
}


#____________________________________________________________
#
# Ethernet (vNIC) Network Control Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_netctrl_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy." : "${local.org_name} vNIC Network Control Policy."
  mac_registration_mode = "allVlans"
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}" : "${local.org_name}"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_cdp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  cdp_enabled           = true
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy - CDP Eanbled." : "${local.org_name} vNIC Network Control Policy - CDP Eanbled."
  mac_registration_mode = "allVlans"
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}_cdp" : "${local.org_name}_cdp"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_lldp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy - LLDP Eanbled." : "${local.org_name} vNIC Network Control Policy - LLDP Eanbled."
  mac_registration_mode = "allVlans"
  lldp_receive          = true
  lldp_transmit         = true
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}_lldp" : "${local.org_name}_lldp"
  org_moid              = local.org_moid
  tags                  = var.tags
}


#____________________________________________________________
#
# Ethernet (vNIC) Network Group Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_vlan_group_livem" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Live Migration VLANs." : "${local.org_name} vNIC Network Group Policy - Live Migration VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_live_migration" : "${local.org_name}_live_migration"
  native_vlan = local.vnic_livem_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_livem_vlan_list
}

module "vnic_vlan_group_mgmt" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Management VLANs." : "${local.org_name} vNIC Network Group Policy - Management VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_mgmt" : "${local.org_name}_mgmt"
  native_vlan = local.vnic_mgmt_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_mgmt_vlan_list
}

module "vnic_vlan_group_stg" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Storage VLANs." : "${local.org_name} vNIC Network Group Policy - Storage VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_storage" : "${local.org_name}_storage"
  native_vlan = local.vnic_stg_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_stg_vlan_list
}

module "vnic_vlan_group_vms" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Virtual Machine VLANs." : "${local.org_name} vNIC Network Group Policy - Virtual Machine VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_virtual_machines" : "${local.org_name}_virtual_machines"
  native_vlan = local.vnic_vms_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_vms_vlan_list
}

#______________________________________________
#
# Ethernet (vNIC) QoS Policies
# GUI Location: Policies > Create Policy
#______________________________________________

module "vnic_qos_platinum" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Platinum." : "${local.org_name} vNIC QoS Policy - Platinum."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_platinum" : "${local.org_name}_platinum"
  mtu            = local.vnic_platinum_mtu
  burst          = local.vnic_platinum_burst
  priority       = "Platinum"
  rate_limit     = local.vnic_platinum_rate_limit
  trust_host_cos = local.vnic_platinum_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_gold" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Gold." : "${local.org_name} vNIC QoS Policy - Gold."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_gold" : "${local.org_name}_gold"
  mtu            = local.vnic_gold_mtu
  burst          = local.vnic_gold_burst
  priority       = "Gold"
  rate_limit     = local.vnic_gold_rate_limit
  trust_host_cos = local.vnic_gold_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_silver" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Silver." : "${local.org_name} vNIC QoS Policy - Silver."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_silver" : "${local.org_name}_silver"
  mtu            = local.vnic_silver_mtu
  burst          = local.vnic_silver_burst
  priority       = "Silver"
  rate_limit     = local.vnic_silver_rate_limit
  trust_host_cos = local.vnic_silver_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_bronze" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Bronze." : "${local.org_name} vNIC QoS Policy - Bronze."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_bronze" : "${local.org_name}_bronze"
  mtu            = local.vnic_bronze_mtu
  burst          = local.vnic_bronze_burst
  priority       = "Bronze"
  rate_limit     = local.vnic_bronze_rate_limit
  trust_host_cos = local.vnic_bronze_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_best_effort" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Best Effort." : "${local.org_name} vNIC QoS Policy - Best Effort."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_best_effort" : "${local.org_name}_best_effort"
  mtu            = local.vnic_best_effort_mtu
  burst          = local.vnic_best_effort_burst
  priority       = "Bronze"
  rate_limit     = local.vnic_best_effort_rate_limit
  trust_host_cos = local.vnic_best_effort_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}


#______________________________________________
#
# LAN Connectivity
#______________________________________________

module "vnic_lan_connectivity" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_lan_connectivity"
  description = local.vnic_lan_connectivity != "" ? "${local.vnic_lan_connectivity} vNIC LAN Connectivity Policy." : "${local.org_name} vNIC LAN Connectivity Policy."
  name        = local.vnic_lan_connectivity != "" ? local.vnic_lan_connectivity : local.org_name
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
}


#______________________________________________
#
# Create vNICs
#______________________________________________

module "vnic_loop" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vnic_adapter_policy,
    module.vnic_lan_connectivity,
    module.vnic_netctrl_policy,
    module.vnic_vlan_group_livem,
    module.vnic_vlan_group_mgmt,
    module.vnic_vlan_group_stg,
    module.vnic_vlan_group_vms,
    module.vnic_qos_platinum,
    module.vnic_qos_gold,
    module.vnic_qos_silver,
    module.vnic_qos_bronze,
    module.vnic_qos_best_effort,
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_loop"
  cdn_source            = "vnic"
  lan_connectivity_moid = module.vnic_lan_connectivity.moid
  mac_address_type      = "POOL"
  placement_pci_link    = local.vnic_placement_pci_link
  placement_uplink      = local.vnic_placement_uplink
  placement_slot_id     = local.vnic_placement_slot_id
  fabric_vnic = {
    vNIC_0 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_management
      vnic_name         = "MANAGEMENT-A"
      vnic_order        = 0
      vnic_qos_moid     = module.vnic_qos_silver.moid
      vnic_vlans_moid   = module.vnic_vlan_group_mgmt.moid
    },
    vNIC_1 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_management
      vnic_name         = "MANAGEMENT-B"
      vnic_order        = 1
      vnic_qos_moid     = module.vnic_qos_silver.moid
      vnic_vlans_moid   = module.vnic_vlan_group_mgmt.moid
    },
    vNIC_2 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_migration
      vnic_name         = "MIGRATION-A"
      vnic_order        = 2
      vnic_qos_moid     = module.vnic_qos_bronze.moid
      vnic_vlans_moid   = module.vnic_vlan_group_livem.moid
    },
    vNIC_3 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_migration
      vnic_name         = "MIGRATION-B"
      vnic_order        = 3
      vnic_qos_moid     = module.vnic_qos_bronze.moid
      vnic_vlans_moid   = module.vnic_vlan_group_livem.moid
    },
    vNIC_4 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_storage
      vnic_name         = "STORAGE-A"
      vnic_order        = 4
      vnic_qos_moid     = module.vnic_qos_platinum.moid
      vnic_vlans_moid   = module.vnic_vlan_group_stg.moid
    },
    vNIC_5 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_storage
      vnic_name         = "STORAGE-B"
      vnic_order        = 5
      vnic_qos_moid     = module.vnic_qos_platinum.moid
      vnic_vlans_moid   = module.vnic_vlan_group_stg.moid
    }
    vNIC_6 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_virtual
      vnic_name         = "VIRTUAL-A"
      vnic_order        = 6
      vnic_qos_moid     = module.vnic_qos_gold.moid
      vnic_vlans_moid   = module.vnic_vlan_group_vms.moid
    },
    vNIC_7 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_virtual
      vnic_name         = "VIRTUAL-B"
      vnic_order        = 7
      vnic_qos_moid     = module.vnic_qos_gold.moid
      vnic_vlans_moid   = module.vnic_vlan_group_vms.moid
    }
  }
}

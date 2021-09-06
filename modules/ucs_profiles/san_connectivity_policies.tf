#_________________________________________________________________________
#
# Intersight SAN Connectivity Policies Variables
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Adapter
# GUI Location: Configure > Policies > Create Policy > Fibre Channel Network
# GUI Location: Configure > Policies > Create Policy > Fibre Channel QoS
# GUI Location: Configure > Policies > Create Policy > SAN Connectivity
#_________________________________________________________________________

variable "policies_vhba_san_connectivity" {
  default = {
    default = {
      adapter_template             = "VMware" # Linux, VMware, Windows
      description                  = ""
      organization                 = "default"
      placement_mode               = "custom"
      target_platform              = "FIAttached"
      qos_burst                    = 1024
      qos_cos                      = 3
      qos_max_data_field_size      = 2112
      qos_rate_limit               = 0
      tags                         = []
      vsan_a                       = 100
      vsan_a_default_vlan_id       = 0
      vsan_b                       = 200
      vsan_b_default_vlan_id       = 0
      vhba_name_a                  = "vhba-a"
      vhba_name_b                  = "vhba-b"
      vhba_order_a                 = 2
      vhba_order_b                 = 3
      vhba_persistent_lun_bindings = false
      vhba_placement_pci_link_a    = 0
      vhba_placement_pci_link_b    = 0
      vhba_placement_slot_id       = "MLOM"
      vhba_placement_switch_a      = "A"
      vhba_placement_switch_b      = "B"
      vhba_placement_uplink        = 0
      vhba_type                    = "fc-initiator"
      wwnn_address_static          = ""
      wwnn_address_type            = "POOL"
      wwnn_pool                    = ""
      wwpn_address_a_static        = ""
      wwpn_address_b_static        = ""
      wwpn_address_type            = "POOL"
      wwpn_pool_a_name             = ""
      wwpn_pool_b_name             = ""
    }
  }
  description = <<-EOT
  key - Name of the vHBA Template Policy.
  * adapter_template - The Type of vhba Adapter Policy to assign to the vhba Template.  Options are:
    - FCNVMeTarget
    - FCNVMeInitiator
    - Initiator
    - Linux
    - Solaris
    - Target
    - VMware
    - Windows
    - WindowBoot
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * placement_mode - The mode used for placement of vhbas on network adapters. Options are:
    - auto
    - custom
  * qos_burst - The burst traffic, in bytes, allowed on the vHBA.  Value can be between 1024-1000000.
  * qos_cos - Class of Service to be associated to the traffic on the virtual interface.  Value can be between 0-6. For FIAttached this should always be 0.
  * qos_max_data_field_size - The maximum size of the Fibre Channel frame payload bytes that the virtual interface supports.
  * qos_rate_limit - The value in Mbps (0-10G/40G/100G depending on Adapter Model) to use for limiting the data rate on the virtual interface. Setting this to zero will turn rate limiting off.  Range is between 0-100000.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * target_platform - The platform for which the server profile is applicable. It can either be:
    - Standalone - a server that is operating independently
    - FIAttached - A Server attached to a Intersight Managed Domain.
  * vsan_a - VSAN ID for the vHBA on Fabric A.
  * vsan_a_default_vlan_id - Only required for Standalone Servers.  Default VLAN of the virtual interface in Standalone Rack server. Setting the value to 0 is equivalent to None and will not associate any Default VLAN to the traffic on the virtual interface (0-4094).
  * vsan_b - VSAN ID for the vHBA on Fabric B.
  * vsan_b_default_vlan_id - Only required for Standalone Servers.  Default VLAN of the virtual interface in Standalone Rack server. Setting the value to 0 is equivalent to None and will not associate any Default VLAN to the traffic on the virtual interface (0-4094).
  * vhba_name_a - Name of the virtual fibre-channel interface.
  * vhba_name_b - Name of the virtual fibre-channel interface.
  * vhba_order_a - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vhba_order_b - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vhba_persistent_lun_bindings - Enables retention of LUN ID associations in memory until they are manually cleared.
  * vhba_placement_pci_link_a - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vhba_placement_pci_link_b - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vhba_placement_slot_id - PCIe Slot where the VIC adapter is installed. Supported values are:
    - 1-15
    - MLOM
  * vhba_placement_switch_a - The fabric port to which the vhbas will be associated.
    - A - Fabric A of the FI cluster.
    - None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  * vhba_placement_switch_b -The fabric port to which the vhbas will be associated.
    - B - Fabric B of the FI cluster.
    - None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  * vhba_placement_uplink - Adapter port on which the virtual interface will be created.
  * vhba_type - VHBA Type configuration for SAN Connectivity Policy. This configuration is supported only on Cisco VIC 14XX series and higher series of adapters.
    - fc-initiator - The default value set for vHBA Type Configuration. Fc-initiator specifies vHBA as a consumer of storage. Enables SCSI commands to transfer data and status information between host and target storage systems.\
    - fc-nvme-initiator - Fc-nvme-initiator specifies vHBA as a consumer of storage. Enables NVMe-based message commands to transfer data and status information between host and target storage systems.
    - fc-nvme-target - Fc-nvme-target specifies vHBA as a provider of storage volumes to initiators. Enables NVMe-based message commands to transfer data and status information between host and target storage systems. Currently tech-preview, only enabled with an asynchronous driver.
    - fc-target - Fc-target specifies vHBA as a provider of storage volumes to initiators. Enables SCSI commands to transfer data and status information between host and target storage systems. fc-target is enabled only with an asynchronous driver.
  * wwnn_address_static - The WWNN address for the server node must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx.  Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  * wwnn_address_type - Type of allocation selected to assign a WWNN address for the server node.
    - POOL - The user selects a pool from which the mac/wwn address will be leased for the Virtual Interface.
    - STATIC - The user assigns a static mac/wwn address for the Virtual Interface.
  * wwnn_pool - WWNN Pool Name to Assign to the Policy.
  * wwpn_address_a_static - The WWPN address must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx. Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  * wwpn_address_b_static - The WWPN address must be in hexadecimal format xx:xx:xx:xx:xx:xx:xx:xx. Allowed ranges are 20:00:00:00:00:00:00:00 to 20:FF:FF:FF:FF:FF:FF:FF or from 50:00:00:00:00:00:00:00 to 5F:FF:FF:FF:FF:FF:FF:FF.  To ensure uniqueness of WWN's in the SAN fabric, you are strongly encouraged to use the WWN prefix - 20:00:00:25:B5:xx:xx:xx.
  * wwpn_address_type - Type of allocation selected to assign a WWPN address to the vhba.
    - POOL - The user selects a pool from which the WWPN address will be leased for the Virtual Interface.
    - STATIC - The user assigns a static WWPN address for the Virtual Interface.
  * wwpn_pool_a_name - Name of the WWPN Pool to assign to the vhba Template.
  * wwpn_pool_b_name - Name of the WWPN Pool to assign to the vhba Template.
  EOT
  type = map(object(
    {
      adapter_template             = optional(string)
      description                  = optional(string)
      organization                 = optional(string)
      placement_mode               = optional(string)
      target_platform              = optional(string)
      qos_burst                    = optional(number)
      qos_cos                      = optional(number)
      qos_max_data_field_size      = optional(number)
      qos_rate_limit               = optional(number)
      tags                         = optional(list(map(string)))
      vsan_a                       = optional(number)
      vsan_a_default_vlan_id       = optional(number)
      vsan_b                       = optional(number)
      vsan_b_default_vlan_id       = optional(number)
      vhba_name_a                  = optional(string)
      vhba_name_b                  = optional(string)
      vhba_order_a                 = optional(number)
      vhba_order_b                 = optional(number)
      vhba_persistent_lun_bindings = optional(bool)
      vhba_placement_pci_link_a    = optional(number)
      vhba_placement_pci_link_b    = optional(number)
      vhba_placement_slot_id       = optional(string)
      vhba_placement_switch_a      = optional(string)
      vhba_placement_switch_b      = optional(string)
      vhba_placement_uplink        = optional(number)
      vhba_type                    = optional(string)
      wwnn_address_static          = optional(string)
      wwnn_address_type            = optional(string)
      wwnn_pool                    = optional(string)
      wwpn_address_a_static        = optional(string)
      wwpn_address_b_static        = optional(string)
      wwpn_address_type            = optional(string)
      wwpn_pool_a_name             = optional(string)
      wwpn_pool_b_name             = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# SAN Connectivity Policies
# GUI Location: Configure > Policies > Create Policy > SAN Connectivity
#_________________________________________________________________________

module "san_connectivity_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source              = "../../../terraform-intersight-imm/modules/san_connectivity_policies"
  for_each            = local.san_connectivity_policies
  description         = each.value.description != "" ? each.value.description : "${each.key} SAN Connectivity Policy."
  name                = each.key
  org_moid            = local.org_moids[each.value.organization].moid
  placement_mode      = each.value.placement_mode
  static_wwnn_address = each.value.wwnn_address_type == "STATIC" ? each.value.wwnn_address_static : ""
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  target_platform     = each.value.target_platform
  wwnn_pool           = each.value.wwnn_address_type == "POOL" ? [local.fc_pools[each.value.wwnn_pool]] : []
  wwnn_address_type   = each.value.wwnn_address_type
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.san_connectivity_policies == each.key
  ]
}


#______________________________________________
#
# vHBA with Default Values
#______________________________________________

module "san_connectivity_add_vhba_a" {
  depends_on = [
    local.org_moids,
    module.fibre_channel_adapter_policies,
    module.fibre_channel_network_policies_a,
    module.fibre_channel_qos_policies,
    module.san_connectivity_policies,
  ]
  source                  = "../../../terraform-intersight-imm/modules/san_connectivity_add_vhba"
  for_each                = local.san_connectivity_policies
  persistent_lun_bindings = each.value.vhba_persistent_lun_bindings
  placement_pci_link      = each.value.vhba_placement_pci_link_a
  placement_slot_id       = each.value.vhba_placement_slot_id
  placement_switch_id     = each.value.vhba_placement_switch_a
  placement_uplink        = each.value.vhba_placement_uplink
  san_connectivity_moid   = module.san_connectivity_policies[each.key].moid
  static_wwpn_address     = each.value.wwpn_address_type == "STATIC" ? each.value.wwpn_address_a_static : null
  vhba_type               = each.value.vhba_type
  vhba_adapter_moid       = module.fibre_channel_adapter_policies[each.key].moid
  vhba_name               = each.value.vhba_name_a
  vhba_network_moid       = module.fibre_channel_network_policies_a[each.key].moid
  vhba_order              = each.value.vhba_order_a
  vhba_qos_moid           = module.fibre_channel_qos_policies[each.key].moid
  wwpn_address_type       = each.value.wwpn_address_type
  wwpn_pool_moid          = each.value.wwpn_address_type == "POOL" ? [local.fc_pools[each.value.wwpn_pool_a_name]] : []
}

module "san_connectivity_add_vhba_b" {
  depends_on = [
    local.org_moids,
    module.fibre_channel_adapter_policies,
    module.fibre_channel_network_policies_b,
    module.fibre_channel_qos_policies,
    module.san_connectivity_policies,
  ]
  source                  = "../../../terraform-intersight-imm/modules/san_connectivity_add_vhba"
  for_each                = local.san_connectivity_policies
  persistent_lun_bindings = each.value.vhba_persistent_lun_bindings
  placement_pci_link      = each.value.vhba_placement_pci_link_b
  placement_slot_id       = each.value.vhba_placement_slot_id
  placement_switch_id     = each.value.vhba_placement_switch_b
  placement_uplink        = each.value.vhba_placement_uplink
  san_connectivity_moid   = module.san_connectivity_policies[each.key].moid
  static_wwpn_address     = each.value.wwpn_address_type == "STATIC" ? each.value.wwpn_address_b_static : null
  vhba_type               = each.value.vhba_type
  vhba_adapter_moid       = module.vhba_adapter[each.key].moid
  vhba_name               = each.value.vhba_name_b
  vhba_network_moid       = module.fibre_channel_network_policies_b[each.key].moid
  vhba_order              = each.value.vhba_order_b
  vhba_qos_moid           = module.fibre_channel_qos_policies[each.key].moid
  wwpn_address_type       = each.value.wwpn_address_type
  wwpn_pool_moid          = each.value.wwpn_address_type == "POOL" ? [local.fc_pools[each.value.wwpn_pool_b_name]] : []
}

#_________________________________________________________________________
#
# Intersight LAN Connectivity Policies Variables
# GUI Location: Configure > Policies > Create Policy > LAN Connectivity
#_________________________________________________________________________

variable "policies_vnic_lan_connectivity" {
  default = {
    default = {
      description         = ""
      iqn_allocation_type = "None"
      iqn_pool            = []
      iqn_static_name     = ""
      organization        = "default"
      placement_mode      = "custom"
      tags                = []
      target_platform     = "FIAttached"
    }
  }
  description = <<-EOT
  key - Name of the LAN Connectivity Policy.
  * description - Description to Assign to the Policy.
  * iqn_allocation_type - Allocation Type of iSCSI Qualified Name.  Options are:
    - None
    - Pool
    - Static
  * iqn_pool - IQN Pool to Assign to the Policy.
  * iqn_static_name - User provided static iSCSI Qualified Name (IQN) for use as initiator identifiers by iSCSI vNICs.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * placement_mode - The mode used for placement of vNICs on network adapters. Options are:
    - auto
    - custom
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * target_platform - The platform for which the server profile is applicable. It can either be:
    - Standalone - a server that is operating independently
    - FIAttached - A Server attached to a Intersight Managed Domain.
  EOT
  type = map(object(
    {
      description         = optional(string)
      iqn_allocation_type = optional(string)
      iqn_static_name     = optional(string)
      iqn_pool            = optional(set(string))
      organization        = optional(string)
      placement_mode      = optional(string)
      tags                = optional(list(map(string)))
      target_platform     = optional(string)
    }
  ))
}


#_________________________________________________________________________
#
# Intersight Ethernet Policies Variables
# GUI Location: Configure > Policies > Create Policy > Ethernet XXXX
#_________________________________________________________________________

variable "policies_vnic_templates" {
  default = {
    default = {
      adapter_template          = "VMware" # Linux, Linux-NVMe-ROCE, VMware, Windows
      description               = ""
      lan_connectivity          = "default"
      mac_address_a_static      = ""
      mac_address_b_static      = ""
      mac_address_type          = "POOL"
      mac_forge                 = "allow"
      mac_pool_a_name           = ""
      mac_pool_b_name           = ""
      mac_registration_mode     = "allVlans"
      neighbor_discovery        = "none" # both, cdp, lldp, none
      organization              = "default"
      qos_burst                 = 1024
      qos_cos                   = 0
      qos_mtu                   = 1500
      qos_priority              = ""
      qos_rate_limit            = 0
      qos_trust_host_cos        = false
      tags                      = []
      uplink_fail_action        = "linkDown"
      usnic_cos                 = 5
      usnic_count               = 0
      usnic_adapter_policy_moid = ""
      vlan_list                 = "2-10,30-40"
      vlan_native_vlan          = null
      vmq_adapter_policy_moid   = ""
      vmq_enabled               = false
      vmq_interrupts            = 16
      vmq_multi_queue_support   = false
      vmq_number_queues         = 4
      vmq_number_sub_vnics      = 64
      vnic_cdn_a_name           = ""
      vnic_cdn_source           = "vnic"
      vnic_failover_enabled     = false
      vnic_name_a               = "vnic-a"
      vnic_name_b               = "vnic-b"
      vnic_order_a              = 0
      vnic_order_b              = 1
      vnic_placement_pci_link_a = 0
      vnic_placement_pci_link_b = 0
      vnic_placement_slot_id    = "MLOM"
      vnic_placement_switch_a   = "A"
      vnic_placement_switch_b   = "B"
      vnic_placement_uplink     = 0
    }
  }
  description = <<-EOT
  key - Name of the vNIC Template Policy.
  * description - Description to Assign to the Policy.
  * adapter_template - The Type of vNIC Adapter Policy to assign to the vNIC Template.  Options are:
    - Linux
    - Linux-NVMe-RoCE
    - MQ
    - MQ-SMBd
    - SMBServer
    - SMBClient
    - Solaris
    - SRIOV
    - usNIC
    - usNICOracleRAC
    - VMware
    - VMwarePassThru
    - Win-AzureStack
    - Win-HPN
    - Win-HPN-SMBd
    - Windows
  * description - Description to Assign to the Policy.
  * lan_connectivity - Name of the LAN Connectivity Policy to assign to the vNIC Template.
  * mac_address_a_static - The MAC address must be in hexadecimal format xx:xx:xx:xx:xx:xx.To ensure uniqueness of MACs in the LAN fabric, you are strongly encouraged to use thefollowing MAC prefix 00:25:B5:xx:xx:xx.
  * mac_address_b_static - The MAC address must be in hexadecimal format xx:xx:xx:xx:xx:xx.To ensure uniqueness of MACs in the LAN fabric, you are strongly encouraged to use thefollowing MAC prefix 00:25:B5:xx:xx:xx.
  * mac_address_type - Type of allocation selected to assign a MAC address for the vnic.
    - POOL - The user selects a pool from which the mac/wwn address will be leased for the Virtual Interface.
    - STATIC - The user assigns a static mac/wwn address for the Virtual Interface.
  * mac_forge - Determines if the MAC forging is allowed or denied on an interface.  Options are:
    - allow
    - deny
  * mac_pool_a_name - Name of the Mac Pool to assign to the vNIC Template.
  * mac_pool_b_name - Name of the Mac Pool to assign to the vNIC Template.
  * mac_registration_mode - Determines the MAC addresses that have to be registered with the switch.  Options are:
    - allVlans
    - nativeVlanOnly
  * neighbor_discovery - Define if a Neighbor Discovery protocol should be assigned to the interface. Options are:
    - both
    - cdp
    - lldp
    - none
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * qos_burst - The burst traffic, in bytes, allowed on the vNIC.  Value can be between 1024-1000000.
  * qos_cos - Class of Service to be associated to the traffic on the virtual interface.  Value can be between 0-6. For FIAttached this should always be 0.
  * qos_mtu - The Maximum Transmission Unit (MTU) or packet size that the virtual interface accepts.  Value can be between 1500-9000.
  * qos_priority - The priortity matching the System QoS specified in the fabric profile.  Options are:
    - Platinum
    - Gold
    - Silver
    - Bronze
    - Best Effort
    - FC
    - For Standalone Servers leave this blank
  * qos_rate_limit - The value in Mbps (0-10G/40G/100G depending on Adapter Model) to use for limiting the data rate on the virtual interface. Setting this to zero will turn rate limiting off.  Range is between 0-100000.
  * qos_trust_host_cos - Enables usage of the Class of Service provided by the operating system.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * uplink_fail_action - Determines the state of the virtual interface (vethernet / vfc) on the switch when a suitable uplink is not pinned.  Important! If the Action on Uplink is set to Warning, the switch will not fail over if uplink connectivity is lost.  Options are:
    - linkDown
    - warning
  * usnic_cos - Class of Service to be used for traffic on the usNIC.  Valid Range is 0-6.
  * usnic_count - Number of usNIC interfaces to be created.  Range is 0-255.
  * usnic_adapter_policy_moid - The Type of vNIC Adapter Policy to assign to the vNIC Template.  Options are:
    - Linux
    - Linux-NVMe-RoCE
    - MQ
    - MQ-SMBd
    - SMBServer
    - SMBClient
    - Solaris
    - SRIOV
    - usNIC
    - usNICOracleRAC
    - VMware
    - VMwarePassThru
    - Win-AzureStack
    - Win-HPN
    - Win-HPN-SMBd
    - Windows
  * vlan_list - List of VLAN's to Add to the VLAN Group Policy.
  * vlan_native_vlan - VLAN to Assign as the Native VLAN.
  * vmq_enabled - Enables VMQ feature on the virtual interface.
  * vmq_multi_queue_support - Enables Virtual Machine Multi-Queue feature on the virtual interface. VMMQ allows configuration of multiple I/O queues for a single VM and thus distributes traffic across multiple CPU cores in a VM.
  * vmq_interrupts - The number of interrupt resources to be allocated. Recommended value is the number of CPU threads or logical processors available in the server.  Range is 1-514.
  * vmq_number_queues - The number of hardware Virtual Machine Queues to be allocated. The number of VMQs per adapter must be one more than the maximum number of VM NICs.  Range is 1-128.
  * vmq_number_sub_vnics - The number of sub vNICs to be created.  Range is 0-64.
  * vmq_adapter_policy_moid - The Type of vNIC Adapter Policy to assign to the vNIC Template.  Options are:
    - Linux
    - Linux-NVMe-RoCE
    - MQ
    - MQ-SMBd
    - SMBServer
    - SMBClient
    - Solaris
    - SRIOV
    - usNIC
    - usNICOracleRAC
    - VMware
    - VMwarePassThru
    - Win-AzureStack
    - Win-HPN
    - Win-HPN-SMBd
    - Windows
  * vnic_cdn_a_name - The CDN value entered in case of user defined mode.
  * vnic_cdn_b_name - The CDN value entered in case of user defined mode.
  * vnic_cdn_source - Source of the CDN. It can either be user specified or be the same as the vNIC name.
    - user - Source of the CDN is specified by the user.
    - vnic - Source of the CDN is the same as the vNIC name.
  * vnic_failover_enabled - Setting this to true ensures that the traffic failover from one uplink to another auotmatically in case of an uplink failure. It is applicable for Cisco VIC adapters only which are connected to Fabric Interconnect cluster. The uplink if specified determines the primary uplink in case of a failover.
  * vnic_name_a - Name of the virtual ethernet interface.
  * vnic_name_b - Name of the virtual ethernet interface.
  * vnic_order_a - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vnic_order_b - The order in which the virtual interface is brought up. The order assigned to an interface should be unique for all the Ethernet and Fibre-Channel interfaces on each PCI link on a VIC adapter. The maximum value of PCI order is limited by the number of virtual interfaces (Ethernet and Fibre-Channel) on each PCI link on a VIC adapter. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vnic_placement_pci_link_a - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vnic_placement_pci_link_b - The PCI Link used as transport for the virtual interface. All VIC adapters have a single PCI link except VIC 1385 which has two.
  * vnic_placement_slot_id - PCIe Slot where the VIC adapter is installed. Supported values are:
    - 1-15
    - MLOM
  * vnic_placement_switch_a -The fabric port to which the vNICs will be associated.
    - A - Fabric A of the FI cluster.
    - None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  * vnic_placement_switch_b -The fabric port to which the vNICs will be associated.
    - B - Fabric B of the FI cluster.
    - None - Fabric Id is not set to either A or B for the standalone case where the server is not connected to Fabric Interconnects.
  * vnic_placement_uplink - Adapter port on which the virtual interface will be created.
  EOT
  type = map(object(
    {
      adapter_template          = optional(string)
      description               = optional(string)
      lan_connectivity          = string
      mac_address_a_static      = optional(string)
      mac_address_b_static      = optional(string)
      mac_address_type          = optional(string)
      mac_forge                 = optional(string)
      mac_pool_a_name           = optional(string)
      mac_pool_b_name           = optional(string)
      mac_registration_mode     = optional(string)
      neighbor_discovery        = optional(string)
      organization              = optional(string)
      qos_burst                 = optional(number)
      qos_cos                   = optional(number)
      qos_mtu                   = optional(number)
      qos_priority              = optional(string)
      qos_rate_limit            = optional(number)
      qos_trust_host_cos        = optional(bool)
      tags                      = optional(list(map(string)))
      uplink_fail_action        = optional(string)
      usnic_cos                 = optional(number)
      usnic_count               = optional(number)
      usnic_adapter_policy_moid = optional(string)
      vlan_list                 = optional(string)
      vlan_native_vlan          = optional(number)
      vmq_adapter_policy_moid   = optional(string)
      vmq_enabled               = optional(bool)
      vmq_interrupts            = optional(number)
      vmq_multi_queue_support   = optional(bool)
      vmq_number_queues         = optional(number)
      vmq_number_sub_vnics      = optional(number)
      vnic_cdn_a_name           = optional(string)
      vnic_cdn_b_name           = optional(string)
      vnic_cdn_source           = optional(string)
      vnic_failover_enabled     = optional(bool)
      vnic_name_a               = optional(string)
      vnic_name_b               = optional(string)
      vnic_order_a              = optional(number)
      vnic_order_b              = optional(number)
      vnic_placement_pci_link_a = optional(number)
      vnic_placement_pci_link_b = optional(number)
      vnic_placement_slot_id    = optional(string)
      vnic_placement_switch_a   = optional(string)
      vnic_placement_switch_b   = optional(string)
      vnic_placement_uplink     = optional(number)
    }
  ))
}


#_________________________________________________________________________
#
# LAN Connectivity Policies
# GUI Location: Configure > Policies > Create Policy > LAN Connectivity
#_________________________________________________________________________

module "vnic_lan_connectivity" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_lan_connectivity"
  for_each            = local.policies_vnic_lan_connectivity
  description         = each.value.description != "" ? each.value.description : "${each.key} vNIC LAN Connectivity Policy."
  iqn_allocation_type = each.value.iqn_allocation_type
  iqn_static_name     = each.value.iqn_allocation_type == "Static" ? each.value.iqn_static_name : ""
  iqn_pool            = each.value.iqn_allocation_type == "Pool" ? local.iqn_pools[each.value.iqn_pool] : []
  name                = each.key
  org_moid            = local.org_moids[each.value.organization].moid
  placement_mode      = each.value.placement_mode
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  target_platform     = each.value.target_platform
  profiles = [
    for s in sort(keys(local.ucs_server_profiles)) :
    module.ucs_server_profiles[s].moid
    if local.ucs_server_profiles[s].profile.policies_lan_connectivity == each.key
  ]
}


#_________________________________________________________________________
#
# Ethernet (vNIC) Adapter Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet Adapter
#_________________________________________________________________________

module "vnic_adapter" {
  depends_on = [
    local.org_moids
  ]
  source   = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  for_each = local.policies_vnic_templates
  description = length(
    regexall("(Linux-NVMe-RoCE)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for NVMe using RDMA." : length(
    regexall("(Linux)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for linux." : length(
    regexall("(MQ-SMBd)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for MultiQueue with RDMA." : length(
    regexall("(MQ)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for VM Multi Queue Connection with no RDMA." : length(
    regexall("(SMBClient)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for SMB Client." : length(
    regexall("(SMBServer)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for SMB server." : length(
    regexall("(Solaris)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for Solaris." : length(
    regexall("(SRIOV)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for Win8 SRIOV-VMFEX PF." : length(
    regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for usNIC Oracle RAC Connection." : length(
    regexall("(usNIC)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for usNIC Connection." : length(
    regexall("(VMwarePassThru)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for VMWare pass-thru." : length(
    regexall("(VMware)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for VMWare." : length(
    regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for Azure Stack." : length(
    regexall("(Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? "Recommended adapter settings for Windows high performance and networking with RoCE V2." : length(
    regexall("(Win-HPN)", each.value.adapter_template
  )) > 0 ? "Recommended adapter settings for Windows high performance and networking." : "Recommended adapter settings for Windows."
  name            = "${each.key}_${each.value.adapter_template}"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  advanced_filter = false # Enable Advanced Filter
  arfs_enable     = false # Enable Accelerated Receive Flow Steering
  # Completion Settings
  completion_queue_count = length(
    regexall("(Linux-NVMe-RoCE|Linux|Solaris|VMware)", each.value.adapter_template)) > 0 ? 2 : length(
    regexall("(usNIC)", each.value.adapter_template)) > 0 ? 6 : length(
    regexall("(VMwarePassThru)", each.value.adapter_template)) > 0 ? 8 : length(
    regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? 11 : length(
    regexall("(usNIC)", each.value.adapter_template)) > 0 ? 12 : length(
    regexall("(MQ-SMBd|MQ)", each.value.adapter_template)) > 0 ? 576 : length(
  regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? 2000 : 5
  completion_ring_size      = length(regexall("(MQ|usNIC|usNICOracleRAC)", each.value.adapter_template)) > 0 ? 4 : 1
  geneve_enabled            = false                                                                                # Enable GENEVE
  interrupt_scaling         = length(regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? true : false # Enable Interrupt Scaling
  interrupt_coalescing_type = "MIN"                                                                                # Interrupt Settings
  interrupt_interrupts = length(
    regexall("(Linux|Solaris|VMware)", each.value.adapter_template)) > 0 ? 4 : length(
    regexall("(VMwarePassThru)", each.value.adapter_template)) > 0 ? 12 : length(
    regexall("(SRIOV)", each.value.adapter_template)) > 0 ? 32 : length(
    regexall("(MQ-SMBd|Win-HPN|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? 512 : length(
    regexall("(Linux-NVMe-RoCE|MQ|Win-AzureStack)", each.value.adapter_template)) > 0 ? 256 : length(
  regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? 1024 : 8
  interrupt_mode  = length(regexall("(VMwarePassThru)", each.value.adapter_template)) > 0 ? "MSI" : "MSIx"
  interrupt_timer = 125
  nvgre_enable    = false # Enable Network Virtualization using Generic Routing Encaplulation
  # Receive Side Scaling Settings
  receive_side_scaling       = length(regexall("(Linux|Solaris|VMware)", each.value.adapter_template)) > 0 ? false : true
  rss_hash_ipv4_hash         = true
  rss_hash_ipv6_ext_hash     = false
  rss_hash_ipv6_hash         = true
  rss_hash_tcp_ipv4_hash     = true
  rss_hash_tcp_ipv6_ext_hash = false
  rss_hash_tcp_ipv6_hash     = true
  rss_hash_udp_ipv4_hash     = false
  rss_hash_udp_ipv6_hash     = false
  roce_cos                   = 5 # RoCE Settings - RDMA over Converged Ethernet
  roce_enable = length(
  regexall("(Linux-NVMe-RoCE|MQ-SMBd|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? true : false
  roce_memory_regions = length(
    regexall("(MQ-SMBd)", each.value.adapter_template)) > 0 ? 65536 : length(
  regexall("(Linux-NVMe-RoCE|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? 131072 : 0
  roce_queue_pairs = length(
    regexall("(MQ-SMBd|SMBClient|Win-AzureStack|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? 256 : length(
    regexall("(Linux-NVMe-RoCE)", each.value.adapter_template)) > 0 ? 1024 : length(
  regexall("(SMBServer)", each.value.adapter_template)) > 0 ? 2048 : 0
  roce_resource_groups = length(
    regexall("(MQ-SMBd|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? 2 : length(
    regexall("(Linux-NVMe-RoCE)", each.value.adapter_template)) > 0 ? 8 : length(
  regexall("(SMBClient|SMBServer)", each.value.adapter_template)) > 0 ? 32 : 0
  roce_version = length(
  regexall("(Linux-NVMe-RoCE|MQ-SMBd|Win-AzureStack|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? 2 : 1
  # Recieve Settings
  rx_queue_count = length(
    regexall("(Linux|Linux-NVMe-RoCE|Solaris|VMware)", each.value.adapter_template)) > 0 ? 1 : length(
    regexall("(usNIC)", each.value.adapter_template)) > 0 ? 6 : length(
    regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? 8 : length(
    regexall("(MQ-SMBd|MQ)", each.value.adapter_template)) > 0 ? 512 : length(
  regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? 1000 : 4
  rx_ring_size              = length(regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? 4096 : 512
  tcp_offload_large_recieve = true # TCP Offload Settings
  tcp_offload_large_send    = true
  tcp_offload_rx_checksum   = true
  tcp_offload_tx_checksum   = true
  # Transmit Settings
  tx_queue_count = length(
    regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? 3 : length(
    regexall("(VMwarePassThru)", each.value.adapter_template)) > 0 ? 4 : length(
    regexall("(usNIC)", each.value.adapter_template)) > 0 ? 6 : length(
    regexall("(MQ-SMBd|MQ)", each.value.adapter_template)) > 0 ? 64 : length(
  regexall("(usNICOracleRAC)", each.value.adapter_template)) > 0 ? 1000 : 1
  tx_ring_size = length(regexall("(Win-AzureStack)", each.value.adapter_template)) > 0 ? 1024 : 256
  # Uplink Fallback
  uplink_failback_timeout = length(regexall("(usNIC|usNICOracleRAC)", each.value.adapter_template)) > 0 ? 0 : 5
  vxlan_enable = length(
  regexall("(Win-AzureStack|Win-HPN|Win-HPN-SMBd)", each.value.adapter_template)) > 0 ? true : false # Enable VxLAN
}


#_________________________________________________________________________
#
# Ethernet (vNIC) Network Control Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet Network Control
#_________________________________________________________________________

module "vnic_network_control_policy" {
  depends_on = [
    local.org_moids
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  for_each              = local.policies_vnic_templates
  cdp_enabled           = each.value.neighbor_discovery == "cdp" || each.value.neighbor_discovery == "both" ? true : false
  description           = each.value.description != "" ? each.value.description : "${each.key} vNIC Network Control Policy - ${each.value.neighbor_discovery}."
  forge_mac             = each.value.mac_forge
  mac_registration_mode = each.value.mac_registration_mode
  lldp_receive          = each.value.neighbor_discovery == "lldp" || each.value.neighbor_discovery == "both" ? true : false
  lldp_transmit         = each.value.neighbor_discovery == "lldp" || each.value.neighbor_discovery == "both" ? true : false
  name                  = "${each.key}_netwkctrl"
  org_moid              = local.org_moids[each.value.organization].moid
  tags                  = length(each.value.tags) > 0 ? each.value.tags : local.tags
  uplink_fail_action    = each.value.uplink_fail_action
}


#_________________________________________________________________________
#
# Ethernet Network Group (vNIC VLAN Groups) Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet Network Group
#_________________________________________________________________________

module "vnic_vlan_group" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  for_each    = local.policies_vnic_templates
  description = each.value.description != "" ? each.value.description : "${each.key} vNIC Network Group (VLAN Group) Policy."
  name        = "${each.key}_vlan_group"
  native_vlan = each.value.vlan_native_vlan
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vlan_list   = each.value.vlan_list
}

#_________________________________________________________________________
#
# Ethernet (vNIC) QoS Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet QoS
#_________________________________________________________________________

module "vnic_qos" {
  depends_on = [
    local.org_moids
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  for_each       = local.policies_vnic_templates
  description    = each.value.description != "" ? each.value.description : "${each.key} vNIC QoS Policy."
  name           = "${each.key}_qos"
  mtu            = each.value.qos_mtu
  burst          = each.value.qos_burst
  priority       = each.value.qos_priority
  rate_limit     = each.value.qos_rate_limit
  trust_host_cos = each.value.qos_trust_host_cos
  org_moid       = local.org_moids[each.value.organization].moid
  tags           = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


#_________________________________________________________________________
#
# LAN Connectivity Policy - Create vNICs
# GUI Location: Configure > Policies > Create Policy > LAN Connectivity
#_________________________________________________________________________

module "vnic_templates_a" {
  depends_on = [
    local.org_moids,
    module.vnic_adapter,
    module.vnic_network_control_policy,
    module.vnic_vlan_group,
    module.vnic_qos,
    module.vnic_lan_connectivity,
  ]
  source                    = "terraform-cisco-modules/imm/intersight//modules/policies_vnic"
  for_each                  = local.policies_vnic_templates
  cdn_name                  = each.value.vnic_cdn_source == "user" ? each.value.vnic_cdn_a_name : each.value.vnic_name_a
  cdn_source                = each.value.vnic_cdn_source
  failover_enabled          = each.value.vnic_failover_enabled
  lan_connectivity_moid     = module.vnic_lan_connectivity[each.value.lan_connectivity].moid
  mac_address_type          = each.value.mac_address_type
  mac_pool_moid             = each.value.mac_address_type == "POOL" ? [local.mac_pools[each.value.mac_pool_a_name]] : []
  placement_pci_link        = each.value.vnic_placement_pci_link_a
  placement_slot_id         = each.value.vnic_placement_slot_id
  placement_switch_id       = each.value.vnic_placement_switch_a
  placement_uplink          = each.value.vnic_placement_uplink
  static_mac_address        = each.value.mac_address_type == "STATIC" ? each.value.mac_address_a_static : null
  usnic_cos                 = each.value.usnic_cos
  usnic_count               = each.value.usnic_count
  usnic_adapter_policy_moid = each.value.usnic_adapter_policy_moid
  vmq_enabled               = each.value.vmq_enabled
  vmq_multi_queue_support   = each.value.vmq_multi_queue_support
  vmq_interrupts            = each.value.vmq_interrupts
  vmq_number_queues         = each.value.vmq_number_queues
  vmq_number_sub_vnics      = each.value.vmq_number_sub_vnics
  vmq_adapter_policy_moid   = each.value.vmq_adapter_policy_moid
  vnic_adapter_moid         = module.vnic_adapter[each.key].moid
  vnic_control_moid         = module.vnic_network_control_policy[each.key].moid
  vnic_name                 = each.value.vnic_name_a
  vnic_order                = each.value.vnic_order_a
  vnic_qos_moid             = module.vnic_qos[each.key].moid
  vnic_network_group_moid   = module.vnic_vlan_group[each.key].moid
  # iscsi_boot_policy         = module.policy_iscsi_boot[each.key].moid
  # vnic_network_moid         = module.vnic_network[each.key].moid
}

module "vnic_templates_b" {
  depends_on = [
    local.org_moids,
    module.vnic_adapter,
    module.vnic_network_control_policy,
    module.vnic_vlan_group,
    module.vnic_qos,
    module.vnic_lan_connectivity,
  ]
  source                    = "terraform-cisco-modules/imm/intersight//modules/policies_vnic"
  for_each                  = local.policies_vnic_templates
  cdn_name                  = each.value.vnic_cdn_source == "user" ? each.value.vnic_cdn_b_name : each.value.vnic_name_b
  cdn_source                = each.value.vnic_cdn_source
  failover_enabled          = each.value.vnic_failover_enabled
  lan_connectivity_moid     = module.vnic_lan_connectivity[each.value.lan_connectivity].moid
  mac_address_type          = each.value.mac_address_type
  mac_pool_moid             = each.value.mac_address_type == "POOL" ? [local.mac_pools[each.value.mac_pool_b_name]] : []
  placement_pci_link        = each.value.vnic_placement_pci_link_b
  placement_slot_id         = each.value.vnic_placement_slot_id
  placement_switch_id       = each.value.vnic_placement_switch_b
  placement_uplink          = each.value.vnic_placement_uplink
  static_mac_address        = each.value.mac_address_type == "STATIC" ? each.value.mac_address_b_static : null
  usnic_cos                 = each.value.usnic_cos
  usnic_count               = each.value.usnic_count
  usnic_adapter_policy_moid = each.value.usnic_adapter_policy_moid
  vmq_enabled               = each.value.vmq_enabled
  vmq_multi_queue_support   = each.value.vmq_multi_queue_support
  vmq_interrupts            = each.value.vmq_interrupts
  vmq_number_queues         = each.value.vmq_number_queues
  vmq_number_sub_vnics      = each.value.vmq_number_sub_vnics
  vmq_adapter_policy_moid   = each.value.vmq_adapter_policy_moid
  vnic_adapter_moid         = module.vnic_adapter[each.key].moid
  vnic_control_moid         = module.vnic_network_control_policy[each.key].moid
  vnic_name                 = each.value.vnic_name_b
  vnic_order                = each.value.vnic_order_b
  vnic_qos_moid             = module.vnic_qos[each.key].moid
  vnic_network_group_moid   = module.vnic_vlan_group[each.key].moid
  # iscsi_boot_policy         = module.policy_iscsi_boot[each.key].moid
  # vnic_network_moid         = module.vnic_network[each.key].moid
}

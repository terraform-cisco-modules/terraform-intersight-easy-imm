#_________________________________________________________________________
#
# Ethernet Adapter Policies
# GUI Location: Configure > Policies > Create Policy > Ethernet Adapter
#_________________________________________________________________________

variable "ethernet_adapter_policies" {
  default = {
    default = {
      completion_queue_count                   = 2
      completion_ring_size                     = 1
      enable_advanced_filter                   = false
      enable_accelerated_receive_flow_steering = false
      enable_interrupt_scaling                 = false
      enable_geneve_offload                    = false
      enable_nvgre_offload                     = false
      enable_vxlan_offload                     = false
      description                              = "default-adapter-policy"
      interrupt_coalescing_type                = "Min"
      interrupt_mode                           = "MSIx"
      interrupt_timer                          = 125
      interrupts                               = 4
      organization                             = "default"
      roce_cos                                 = 6
      roce_version                             = 1
      roce_enable                              = false
      roce_version                             = 1
      roce_memory_regions                      = 131072
      roce_version                             = 1
      roce_queue_pairs                         = 256
      roce_version                             = 1
      roce_version                             = 1
      receive_side_scaling_enable              = false
      rss_enable_ipv4_hash                     = true
      rss_enable_ipv6_extensions_hash          = false
      rss_enable_ipv6_hash                     = true
      rss_enable_tcp_and_ipv4_hash             = true
      rss_enable_tcp_and_ipv6_extensions_hash  = false
      rss_enable_tcp_and_ipv6_hash             = true
      rss_enable_udp_and_ipv4_hash             = false
      rss_enable_udp_and_ipv6_hash             = false
      receive_queue_count                      = 1
      receive_ring_size                        = 512
      tcp_offload_large_recieve                = true
      tcp_offload_large_send                   = true
      tcp_offload_rx_checksum                  = true
      tcp_offload_tx_checksum                  = true
      transmit_queue_count                     = 1
      transmit_ring_size                       = 256
      uplink_failback_timeout                  = 5
      tags                                     = []
    }
  }
}

variable "ethernet_adapter_policies" {
  default = {
    default = {
      advanced_filter            = false
      arfs_enable                = false
      completion_queue_count     = 5
      completion_ring_size       = 1
      geneve_enabled             = false
      interrupt_coalescing_type  = "MIN"
      interrupt_interrupts       = 8
      interrupt_mode             = "MSIx"
      interrupt_scaling          = false
      interrupt_timer            = 125
      nvgre_enable               = false
      receive_side_scaling       = false
      roce_cos                   = 5
      roce_enable                = false
      roce_memory_regions        = 0
      roce_queue_pairs           = 0
      roce_resource_groups       = 0
      roce_version               = 2
      rss_hash_ipv4_hash         = true
      rss_hash_ipv6_ext_hash     = false
      rss_hash_ipv6_hash         = true
      rss_hash_tcp_ipv4_hash     = true
      rss_hash_tcp_ipv6_ext_hash = false
      rss_hash_tcp_ipv6_hash     = true
      rss_hash_udp_ipv4_hash     = false
      rss_hash_udp_ipv6_hash     = false
      rx_queue_count             = 4
      rx_ring_size               = 512
      tcp_offload_large_recieve  = true
      tcp_offload_large_send     = true
      tcp_offload_rx_checksum    = true
      tcp_offload_tx_checksum    = true
      tx_queue_count             = 1
      tx_ring_size               = 256
      vxlan_enable               = false
      uplink_failback_timeout    = 5
    }
  }
}

module "ethernet_adapter_templates" {
  depends_on = [
    local.org_moids
  ]
  source   = "terraform-cisco-modules/imm/intersight//modules/ethernet_adapter_policies"
  for_each    = local.lan_connectivity_policies
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

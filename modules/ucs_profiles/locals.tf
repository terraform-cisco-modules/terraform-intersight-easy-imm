#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Tags for Deployment
  tags = var.tags

  # Terraform Cloud Remote Resources
  ip_pools   = data.terraform_remote_state.pools.outputs.ip_pools
  iqn_pools  = data.terraform_remote_state.pools.outputs.iqn_pools
  mac_pools  = data.terraform_remote_state.pools.outputs.mac_pools
  uuid_pools = data.terraform_remote_state.pools.outputs.uuid_pools
  wwnn_pools   = data.terraform_remote_state.pools.outputs.wwnn_pools
  wwpn_pools   = data.terraform_remote_state.pools.outputs.wwpn_pools


  #__________________________________________________________
  #
  # Device Connector Policy Section - Locals
  #__________________________________________________________

  device_connector_policies = {
    for k, v in var.device_connector_policies : k => {
      description  = (v.description != null ? v.description : "")
      lockout      = (v.lockout != null ? v.lockout : false)
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Ethernet Adapter Policy Section - Locals
  #__________________________________________________________

  ethernet_adapter_policies = {
    for k, v in var.ethernet_adapter_policies : k => {
      adapter_template       = v.adapter_template != null ? v.adapter_template : ""
      completion_queue_count = length(
        regexall("(Linux-NVMe-RoCE|Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 2 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 11 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 12 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 576 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2000 : v.completion_queue_count != null ? v.completion_queue_count : 5
      completion_ring_size = length(
        regexall("(MQ|usNIC|usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 4 : v.completion_ring_size != null ? v.completion_ring_size : 1
      description = length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for NVMe using RDMA." : length(
        regexall("(Linux)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for linux." : length(
        regexall("(MQ-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for MultiQueue with RDMA." : length(
        regexall("(MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VM Multi Queue Connection with no RDMA." : length(
        regexall("(SMBClient)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for SMB Client." : length(
        regexall("(SMBServer)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for SMB server." : length(
        regexall("(Solaris)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Solaris." : length(
        regexall("(SRIOV)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Win8 SRIOV-VMFEX PF." : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for usNIC Oracle RAC Connection." : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for usNIC Connection." : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare pass-thru." : length(
        regexall("(VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare." : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Azure Stack." : length(
        regexall("(Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Windows high performance and networking with RoCE V2." : length(
        regexall("(Win-HPN)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Windows high performance and networking." : length(
        regexall("(Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "Recommended adapter settings for Windows." : v.description != null ? v.description : ""
      enable_accelerated_receive_flow_steering = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_accelerated_receive_flow_steering != null ? v.enable_accelerated_receive_flow_steering : false
      enable_advanced_filter = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_advanced_filter != null ? v.enable_advanced_filter : false
      enable_geneve_offload = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_geneve_offload != null ? v.enable_geneve_offload : false
      enable_interrupt_scaling = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_interrupt_scaling != null ? v.enable_interrupt_scaling : false
      enable_nvgre_offload = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.enable_nvgre_offload != null ? v.enable_nvgre_offload : false
      enable_vxlan_offload = length(
        regexall("(Win-AzureStack|Win-HPN|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
        ) > 0 ? true : v.adapter_template != null ? false : v.enable_vxlan_offload != null ? v.enable_vxlan_offload : false
      interrupt_coalescing_type = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? "Min" : v.interrupt_coalescing_type != null ? v.interrupt_coalescing_type : false
      interrupt_mode = length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "MSI" : v.adapter_template != null ? "MSIx" : v.interrupt_mode != null ? v.interrupt_mode : "MSIx"
      interrupt_timer = v.adapter_template != null ? 125 : v.interrupt_timer != null ? v.interrupt_timer : 125
      interrupts      = length(
        regexall("(Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 4 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 12 : length(
        regexall("(SRIOV)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 32 : length(
        regexall("(MQ-SMBd|Win-HPN|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 512 : length(
        regexall("(Linux-NVMe-RoCE|MQ|Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 256 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1024 : v.adapter_template != null ? 8 : v.interrupts != null ? v.interrupts : 8
      organization        = v.organization != null ? v.organization : "default"
      receive_queue_count = length(
        regexall("(Linux|Linux-NVMe-RoCE|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 1 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 512 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1000 : v.receive_queue_count != null ? v.receive_queue_count : 4
      receive_ring_size = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 4096 : v.receive_queue_count != null ? v.receive_queue_count : 512
      receive_side_scaling_enable = length(
        regexall("(Linux|Solaris|VMware)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? true : v.receive_side_scaling_enable != null ? v.receive_side_scaling_enable : true
      roce_cos    = v.adapter_template != null ? 5 : v.roce_cos != null ? v.roce_cos : 5
      roce_enable = length(
        regexall("(Linux-NVMe-RoCE|MQ-SMBd|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.roce_enable != null ? v.roce_enable : false
      roce_memory_regions = length(
        regexall("(MQ-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 65536 : length(
        regexall("(Linux-NVMe-RoCE|SMBClient|SMBServer|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 131072 : v.roce_memory_regions != null ? v.roce_memory_regions : 131072
      roce_queue_pairs = length(
        regexall("(MQ-SMBd|SMBClient|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 256 : length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 1024 : length(
        regexall("(SMBServer)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2048 : v.roce_queue_pairs != null ? v.roce_queue_pairs : 256
      roce_resource_groups = length(
        regexall("(MQ-SMBd|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 2 : length(
        regexall("(Linux-NVMe-RoCE)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 8 : length(
        regexall("(SMBClient|SMBServer)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 32 : v.roce_resource_groups != null ? v.roce_resource_groups : 4
      roce_version = length(
        regexall("(Linux-NVMe-RoCE|MQ-SMBd|Win-AzureStack|Win-HPN-SMBd)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2 : v.roce_version != null ? v.roce_version : 1
      rss_enable_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_ipv4_hash != null ? v.rss_enable_ipv4_hash : true
      rss_enable_ipv6_extensions_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_ipv6_extensions_hash != null ? v.rss_enable_ipv6_extensions_hash : false
      rss_enable_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_ipv6_hash != null ? v.rss_enable_ipv6_hash : true
      rss_enable_tcp_and_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_tcp_and_ipv4_hash != null ? v.rss_enable_tcp_and_ipv4_hash : true
      rss_enable_tcp_and_ipv6_extensions_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_tcp_and_ipv6_extensions_hash != null ? v.rss_enable_tcp_and_ipv6_extensions_hash : false
      rss_enable_tcp_and_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.rss_enable_tcp_and_ipv6_hash != null ? v.rss_enable_tcp_and_ipv6_hash : true
      rss_enable_udp_and_ipv4_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_udp_and_ipv4_hash != null ? v.rss_enable_udp_and_ipv4_hash : false
      rss_enable_udp_and_ipv6_hash = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? false : v.adapter_template != null ? false : v.rss_enable_udp_and_ipv6_hash != null ? v.rss_enable_udp_and_ipv6_hash : false
      tags                      = v.tags != null ? v.tags : []
      tcp_offload_large_recieve = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_large_recieve != null ? v.tcp_offload_large_recieve : true
      tcp_offload_large_send = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_large_send != null ? v.tcp_offload_large_send : true
      tcp_offload_rx_checksum = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_rx_checksum != null ? v.tcp_offload_rx_checksum : true
      tcp_offload_tx_checksum = length(
        regexall("(DUMMY)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? true : v.adapter_template != null ? true : v.tcp_offload_tx_checksum != null ? v.tcp_offload_tx_checksum : true
      transmit_queue_count = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 3 : length(
        regexall("(VMwarePassThru)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 4 : length(
        regexall("(usNIC)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 6 : length(
        regexall("(MQ-SMBd|MQ)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? 64 : length(
        regexall("(usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1000 : v.transmit_queue_count != null ? v.transmit_queue_count : 1
      transmit_ring_size = length(
        regexall("(Win-AzureStack)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 1024 : v.transmit_ring_size != null ? v.transmit_ring_size : 256
      uplink_failback_timeout = length(
        regexall("(usNIC|usNICOracleRAC)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 0 : v.uplink_failback_timeout != null ? v.uplink_failback_timeout : 5
    }
  }


  #__________________________________________________________
  #
  # Ethernet Network Control Policy Section - Locals
  #__________________________________________________________

  ethernet_network_control_policies = {
    for k, v in var.ethernet_network_control_policies : k => {
      action_on_uplink_fail = v.action_on_uplink_fail != null ? v.action_on_uplink_fail : "linkDown"
      cdp_enable = length(
        regexall("(both_enabled|cdp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.cdp_enable != null ? v.cdp_enable : false
      description = v.description != null ? v.description : ""
      lldp_enable_receive = length(
        regexall("(both_enabled|lldp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.lldp_enable_receive != null ? v.lldp_enable_receive : false
      lldp_enable_transmit = length(
        regexall("(both_enabled|lldp_enabled)", coalesce(v.base_template, "EMPTY"))
      ) > 0 ? true : v.lldp_enable_transmit != null ? v.lldp_enable_transmit : false
      mac_register_mode  = v.mac_register_mode != null ? v.mac_register_mode : "nativeVlanOnly"
      mac_security_forge = v.mac_security_forge != null ? v.mac_security_forge : "allow"
      organization       = v.organization != null ? v.organization : "default"
      tags               = v.tags != null ? v.tags : []
    }
  }


  #__________________________________________________________
  #
  # Ethernet Network Group Policy Section - Locals
  #__________________________________________________________

  ethernet_network_group_policies = {
    for k, v in var.ethernet_network_group_policies : k => {
      allowed_vlans = (v.allowed_vlans != null ? v.allowed_vlans : "auto")
      description   = (v.description != null ? v.description : "")
      native_vlan   = (v.native_vlan != null ? v.native_vlan : null)
      organization  = (v.organization != null ? v.organization : "default")
      tags          = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Ethernet QoS Policy Section - Locals
  #__________________________________________________________

  ethernet_qos_policies = {
    for k, v in var.ethernet_qos_policies : k => {
      burst                 = (v.burst != null ? v.burst : 1024)
      cos                   = (v.cos != null ? v.cos : 0)
      description           = (v.description != null ? v.description : "")
      enable_trust_host_cos = (v.enable_trust_host_cos != null ? v.enable_trust_host_cos : false)
      mtu                   = (v.mtu != null ? v.mtu : 1500)
      organization          = (v.organization != null ? v.organization : "default")
      priority              = (v.priority != null ? v.priority : "Best Effort")
      rate_limit            = (v.rate_limit != null ? v.rate_limit : 0)
      tags                  = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel Adapter Policy Section - Locals
  #__________________________________________________________

  fibre_channel_adapter_policies = {
    for k, v in var.fibre_channel_adapter_policies : k => {
      adapter_template                         = v.adapter_template != null ? v.adapter_template : ""
      description                              = length(
        regexall("(FCNVMeInitiator)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for FCNVMeInitiator." : length(
        regexall("(FCNVMeTarget)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for FCNVMeTarget." : length(
        regexall("(Initiator)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Initiator." : length(
        regexall("(Linux)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for linux." : length(
        regexall("(Solaris)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for Solaris." : length(
        regexall("(VMware)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for VMWare." : length(
        regexall("(WindowsBoot)", coalesce(v.adapter_template, "EMPTY"))) > 0 ? "Recommended adapter settings for WindowsBoot." : length(
        regexall("(Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? "Recommended adapter settings for Windows." : v.description != null ? v.description : ""
      error_detection_timeout           = v.error_detection_timeout != null ? v.error_detection_timeout : 2000
      enable_fcp_error_recovery         = v.enable_fcp_error_recovery != null ? v.enable_fcp_error_recovery : false
      error_recovery_io_retry_timeout   = v.error_recovery_io_retry_timeout != null ? v.error_recovery_io_retry_timeout : 5
      error_recovery_link_down_timeout  = v.error_recovery_link_down_timeout != null ? v.error_recovery_link_down_timeout : 30000
      error_recovery_port_down_io_retry = v.adapter_template != null ? 30 : v.error_recovery_port_down_io_retry != null ? v.error_recovery_port_down_io_retry : 8
      error_recovery_port_down_timeout= v.adapter_template == "WindowsBoot" ? 5000 : length(
        regexall("(FCNVMeInitiator|Initiator|Solaris|VMware|Windows)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 30000 : v.error_recovery_port_down_timeout != null ? v.error_recovery_port_down_timeout : 10000
      flogi_retries       = v.flogi_retries != null ? v.flogi_retries : 8
      flogi_timeout       = v.flogi_timeout != null ? v.flogi_timeout : 4000
      interrupt_mode      = v.interrupt_mode != null ? v.interrupt_mode : "MSIx"
      io_throttle_count   = v.io_throttle_count != null ? v.io_throttle_count : 256
      lun_queue_depth     = v.lun_queue_depth != null ? v.lun_queue_depth : 20
      max_luns_per_target = v.max_luns_per_target != null ? v.max_luns_per_target : 1024
      organization        = v.organization != null ? v.organization : "default"
      plogi_retries       = v.plogi_retries != null ? v.plogi_retries : 8
      plogi_timeout       = v.adapter_template == "WindowsBoot" ? 4000 : v.plogi_timeout != null ? v.plogi_timeout : 20000
      receive_ring_size = length(
        regexall("(FCNVMeTarget|Target)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 2048 : v.receive_ring_size != null ? v.receive_ring_size : 64
      resource_allocation_timeout = v.resource_allocation_timeout != null ? v.resource_allocation_timeout : 10000
      tags                        = v.tags != null ? v.tags : []
      scsi_io_queue_count = length(
        regexall("(FCNVMeTarget|FCNVMeInitiator)", coalesce(v.adapter_template, "EMPTY"))
      ) > 0 ? 16 : v.scsi_io_queue_count != null ? v.scsi_io_queue_count : 1
      scsi_io_ring_size  = v.scsi_io_ring_size != null ? v.scsi_io_ring_size : 512
      transmit_ring_size = v.transmit_ring_size != null ? v.transmit_ring_size : 64
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel Network Policy Section - Locals
  #__________________________________________________________

  fibre_channel_network_policies = {
    for k, v in var.fibre_channel_network_policies : k => {
      default_vlan_id = v.default_vlan_id != null ? v.default_vlan_id : 0
      description     = v.description     != null ? v.description     : ""
      organization    = v.organization    != null ? v.organization    : "default"
      tags            = v.tags            != null ? v.tags            : []
      vsan_id         = v.vsan_id         != null ? v.vsan_id         : 4
    }
  }


  #__________________________________________________________
  #
  # Fibre Channel QoS Policy Section - Locals
  #__________________________________________________________

  fibre_channel_qos_policies = {
    for k, v in var.fibre_channel_qos_policies : k => {
      burst               = v.burst               != null ? v.burst               : 1024
      cos                 = v.cos                 != null ? v.cos                 : 3
      description         = v.description         != null ? v.description         : ""
      max_data_field_size = v.max_data_field_size != null ? v.max_data_field_size : 2112
      organization        = v.organization        != null ? v.organization        : "default"
      rate_limit          = v.rate_limit          != null ? v.rate_limit          : 0
      tags                = v.tags                != null ? v.tags                : []
    }
  }


  #__________________________________________________________
  #
  # Flow Control Policy Section - Locals
  #__________________________________________________________

  flow_control_policies = {
    for k, v in var.flow_control_policies : k => {
      description  = (v.description != null ? v.description : "")
      priority     = (v.priority != null ? v.priority : "auto")
      organization = (v.organization != null ? v.organization : "default")
      receive      = (v.receive != null ? v.receive : "Disabled")
      send         = (v.send != null ? v.send : "Disabled")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # IMC Access Policy Section Locals
  #__________________________________________________________

  imc_access_policies = {
    for k, v in var.imc_access_policies : k => {
      description                = (v.description != null ? v.description : "")
      inband_ip_pool             = (v.inband_ip_pool != null ? v.inband_ip_pool : "")
      inband_vlan_id             = (v.inband_vlan_id != null ? v.inband_vlan_id : 1)
      ipv4_address_configuration = (v.ipv4_address_configuration != null ? v.ipv4_address_configuration : true)
      ipv6_address_configuration = (v.ipv6_address_configuration != null ? v.ipv6_address_configuration : false)
      organization                = (v.organization != null ? v.organization : "default")
      tags                        = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # IPMI over LAN Policy Section Locals
  #__________________________________________________________

  ipmi_over_lan_policies = {
    for k, v in var.ipmi_over_lan_policies : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      ipmi_key     = (v.ipmi_key != null ? v.ipmi_key : null)
      organization = (v.organization != null ? v.organization : "default")
      privilege    = (v.privilege != null ? v.privilege : "admin")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Link Aggregation Policy Section - Locals
  #__________________________________________________________

  link_aggregation_policies = {
    for k, v in var.link_aggregation_policies : k => {
      description        = (v.description != null ? v.description : "")
      lacp_rate          = (v.lacp_rate != null ? v.lacp_rate : "normal")
      organization       = (v.organization != null ? v.organization : "default")
      suspend_individual = (v.suspend_individual != null ? v.suspend_individual : false)
      tags               = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Link Control Policy Section - Locals
  #__________________________________________________________

  link_control_policies = {
    for k, v in var.link_control_policies : k => {
      admin_state  = (v.admin_state != null ? v.admin_state : "Enabled")
      description  = (v.description != null ? v.description : "")
      mode         = (v.mode != null ? v.mode : "normal")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Network Connectivity (DNS) Policy Section - Locals
  #__________________________________________________________

  network_connectivity_policies = {
    for k, v in var.network_connectivity_policies : k => {
      description        = (v.description != null ? v.description : "")
      dns_servers_v4     = (v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"])
      dns_servers_v6     = (v.dns_servers_v6 != null ? v.dns_servers_v6 : [])
      enable_dynamic_dns = (v.enable_dynamic_dns != null ? v.enable_dynamic_dns : false)
      enable_ipv6        = (v.enable_ipv6 != null ? v.enable_ipv6 : false)
      organization       = (v.organization != null ? v.organization : "default")
      tags               = (v.tags != null ? v.tags : [])
      update_domain      = (v.update_domain != null ? v.update_domain : "")
    }
  }

  # dns_ucs_domain_profiles = [
  #   for s in sort(keys(local.ucs_domain_profiles)) :
  #   {
  #     moid                        = module.ucs_domain_profiles[s].moid,
  #     type                        = "domain",
  #     network_connectivity_policy = local.ucs_domain_profiles[s].network_connectivity_policy
  #   }
  # ]
  #
  # dns_ucs_server_profiles = [
  #   for s in sort(keys(local.ucs_server_profiles)) :
  #   {
  #     moid                        = module.ucs_server_profiles[s].moid,
  #     type                        = "server",
  #     network_connectivity_policy = local.ucs_server_profiles[s].profile.network_connectivity_policy
  #   }
  # ]
  #
  # dns_ucs_profiles = merge(local.dns_ucs_domain_profiles,local.dns_ucs_server_profiles)


  #__________________________________________________________
  #
  # NTP Policy Section - Locals
  #__________________________________________________________

  ntp_policies = {
    for k, v in var.ntp_policies : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      ntp_servers  = (v.ntp_servers != null ? v.ntp_servers : ["time-a-g.nist.gov", "time-b-g.nist.gov"])
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
      timezone     = (v.timezone != null ? v.timezone : "Etc/GMT")
    }
  }


  #__________________________________________________________
  #
  # Power Policy Section - Locals
  #__________________________________________________________

  power_policies = {
    for k, v in var.power_policies : k => {
      allocated_budget    = (v.allocated_budget != null ? v.allocated_budget : 0)
      description         = (v.description != null ? v.description : "")
      organization        = (v.organization != null ? v.organization : "default")
      power_profiling     = (v.power_profiling != null ? v.power_profiling : "Enabled")
      power_restore_state = (v.power_restore_state != null ? v.power_restore_state : "LastState")
      tags                = (v.tags != null ? v.tags : [])
      redundancy_mode     = (v.redundancy_mode != null ? v.redundancy_mode : "Grid")
    }
  }


  #__________________________________________________________
  #
  # SMTP Policy Section - Locals
  #__________________________________________________________

  smtp_policies = {
    for k, v in var.smtp_policies : k => {
      description     = (v.description != null ? v.description : "")
      enabled         = (v.enabled != null ? v.enabled : true)
      min_severity    = (v.min_severity != null ? v.min_severity : "critical")
      organization    = (v.organization != null ? v.organization : "default")
      sender_email    = (v.sender_email != null ? v.sender_email : "")
      smtp_port       = (v.smtp_port != null ? v.smtp_port : 25)
      smtp_recipients = (v.smtp_recipients != null ? v.smtp_recipients : [])
      smtp_server     = (v.smtp_server != null ? v.smtp_server : "")
      tags            = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # SSH Policy Section - Locals
  #__________________________________________________________

  ssh_policies = {
    for k, v in var.ssh_policies : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      organization = (v.organization != null ? v.organization : "default")
      ssh_port     = (v.ssh_port != null ? v.ssh_port : 22)
      tags         = (v.tags != null ? v.tags : [])
      timeout      = (v.timeout != null ? v.timeout : 1800)
    }
  }


  #__________________________________________________________
  #
  # Switch Control Policy Section - Locals
  #__________________________________________________________

  switch_control_policies = {
    for k, v in var.switch_control_policies : k => {
      description                  = (v.description != null ? v.description : "")
      mac_address_table_aging      = (v.mac_address_table_aging != null ? v.mac_address_table_aging : "Default")
      mac_aging_time               = (v.mac_aging_time != null ? v.mac_aging_time : 14500)
      organization                 = (v.organization != null ? v.organization : "default")
      tags                         = (v.tags != null ? v.tags : [])
      udld_message_interval        = (v.udld_message_interval != null ? v.udld_message_interval : 15)
      udld_recovery_action         = (v.udld_recovery_action != null ? v.udld_recovery_action : "none")
      vlan_port_count_optimization = (v.vlan_port_count_optimization != null ? v.vlan_port_count_optimization : false)
    }
  }


  #__________________________________________________________
  #
  # Thermal Policy Section - Locals
  #__________________________________________________________

  thermal_policies = {
    for k, v in var.thermal_policies : k => {
      description      = (v.description != null ? v.description : "")
      fan_control_mode = (v.fan_control_mode != null ? v.fan_control_mode : "Balanced")
      organization     = (v.organization != null ? v.organization : "default")
      tags             = (v.tags != null ? v.tags : [])
    }
  }


  #______________________________________________
  #
  # UCS Chassis Profiles Variables
  #______________________________________________
  ucs_chassis_profiles = {
    for k, v in var.ucs_chassis_profiles : k => {
      action              = (v.action != null ? v.action : "No-op")
      assign_chassis      = (v.assign_chassis != null ? v.assign_chassis : false)
      description         = (v.description != null ? v.description : "")
      organization        = (v.organization != null ? v.organization : "default")
      imc_access_policy   = (v.imc_access_policy != null ? v.imc_access_policy : "")
      power_policy        = (v.power_policy != null ? v.power_policy : "")
      serial_number       = (v.serial_number != null ? v.serial_number : "")
      snmp_policy         = (v.snmp_policy != null ? v.snmp_policy : "")
      thermal_policy      = (v.thermal_policy != null ? v.thermal_policy : "")
      tags                = (v.tags != null ? v.tags : [])
      target_platform     = (v.target_platform != null ? v.target_platform : "FIAttached")
      wait_for_completion = (v.wait_for_completion != null ? v.wait_for_completion : false)
    }
  }


  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_domain_profiles = {
    for k, v in var.ucs_domain_profiles : k => {
      action                      = (v.action != null ? v.action : "No-op")
      assign_switches             = (v.assign_switches != null ? v.assign_switches : false)
      device_model                = (v.device_model != null ? v.device_model : "UCS-FI-6454")
      description                 = (v.description != null ? v.description : "")
      network_connectivity_policy = (v.network_connectivity_policy != null ? v.network_connectivity_policy : "")
      ntp_policy                  = (v.ntp_policy != null ? v.ntp_policy : "")
      organization                = (v.organization != null ? v.organization : "default")
      serial_number_fabric_a      = (v.serial_number_fabric_a != null ? v.serial_number_fabric_a : "")
      serial_number_fabric_b      = (v.serial_number_fabric_b != null ? v.serial_number_fabric_b : "")
      snmp_policy                 = (v.snmp_policy != null ? v.snmp_policy : "")
      switch_control_policy       = (v.switch_control_policy != null ? v.switch_control_policy : "")
      syslog_policy               = (v.syslog_policy != null ? v.syslog_policy : "")
      system_qos_policy           = (v.system_qos_policy != null ? v.system_qos_policy : "")
      tags                        = (v.tags != null ? v.tags : [])
      vlan_policy_fabric_a        = (v.vlan_policy_fabric_a != null ? v.vlan_policy_fabric_a : "")
      vlan_policy_fabric_b        = (v.vlan_policy_fabric_b != null ? v.vlan_policy_fabric_b : "")
      vsan_policy_fabric_a        = (v.vsan_policy_fabric_a != null ? v.vsan_policy_fabric_a : "")
      vsan_policy_fabric_b        = (v.vsan_policy_fabric_b != null ? v.vsan_policy_fabric_b : "")
    }
  }


  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_server_profiles = {
    for k, v in var.ucs_server_profiles : k =>
    {
      for key, value in var.ucs_server_profile_templates : "profile" =>
      {
        action                      = v.action != null ? v.action : "No-op"
        assign_server               = v.assign_server != null ? v.assign_server : false
        description                 = (v.description != null ? v.description : "")
        name                        = (v.name != null ? v.name : "")
        operating_system            = (value.operating_system != null ? value.operating_system : "vmware")
        organization                = (value.organization != null ? value.organization : "default")
        bios_policy                 = (value.bios_policy != null ? value.bios_policy : "")
        boot_order_policy           = (value.boot_order_policy != null ? value.boot_order_policy : "")
        device_connector_policy     = (value.device_connector_policy != null ? value.device_connector_policy : "")
        imc_access_policy           = (value.imc_access_policy != null ? value.imc_access_policy : "")
        ipmi_over_lan_policy        = (value.ipmi_over_lan_policy != null ? value.ipmi_over_lan_policy : "")
        lan_connectivity_policy     = (value.lan_connectivity_policy != null ? value.lan_connectivity_policy : "")
        ldap_policy                 = (value.ldap_policy != null ? value.ldap_policy : "")
        local_users_policy          = (value.local_users_policy != null ? value.local_users_policy : "")
        network_connectivity_policy = (value.network_connectivity_policy != null ? value.network_connectivity_policy : "")
        ntp_policy                  = (value.ntp_policy != null ? value.ntp_policy : "")
        persistent_memory_policy    = (value.persistent_memory_policy != null ? value.persistent_memory_policy : "")
        power_policy                = (value.power_policy != null ? value.power_policy : "")
        san_connectivity_policy     = (value.san_connectivity_policy != null ? value.san_connectivity_policy : "")
        sd_card_policy              = (value.sd_card_policy != null ? value.sd_card_policy : "")
        serial_over_lan_policy      = (value.serial_over_lan_policy != null ? value.serial_over_lan_policy : "")
        smtp_policy                 = (value.smtp_policy != null ? value.smtp_policy : "")
        snmp_policy                 = (value.snmp_policy != null ? value.snmp_policy : "")
        ssh_policy                  = (value.ssh_policy != null ? value.ssh_policy : "")
        storage_policy              = (value.storage_policy != null ? value.storage_policy : "")
        syslog_policy               = (value.syslog_policy != null ? value.syslog_policy : "")
        virtual_kvm_policy          = (value.virtual_kvm_policy != null ? value.virtual_kvm_policy : "")
        virtual_media_policy        = (value.virtual_media_policy != null ? value.virtual_media_policy : "")
        tags                        = (v.tags != null ? v.tags : [])
        target_platform             = (value.target_platform != null ? value.target_platform : "FIAttached")
        type                        = "instance"
        wait_for_completion         = (v.wait_for_completion != null ? v.wait_for_completion : false)
      } if v.ucs_server_profile_template == key
    }
  }


}

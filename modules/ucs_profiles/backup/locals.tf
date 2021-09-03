#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  #__________________________________________________________
  #
  # BOOT Policy Section Locals
  #__________________________________________________________

  boot_order_policies_templates = {
    for k, v in var.boot_order_policies_templates : k => {
      boot_policy  = (v.boot_policy != null ? v.boot_policy : "uefi_m2_raid")
      boot_secure  = (v.boot_secure != null ? v.boot_secure : true)
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }

  #__________________________________________________________
  #
  # LAN Connectivity Section Locals
  #__________________________________________________________

  lan_connectivity_policies = {
    for k, v in var.lan_connectivity_policies : k => {
      description         = (v.description != null ? v.description : "")
      iqn_allocation_type = (v.iqn_allocation_type != null ? v.iqn_allocation_type : "None")
      iqn_static_name     = (v.iqn_static_name != null ? v.iqn_static_name : "")
      iqn_pool            = (v.iqn_pool != null ? v.iqn_pool : [])
      organization        = (v.organization != null ? v.organization : "default")
      placement_mode      = (v.placement_mode != null ? v.placement_mode : "custom")
      tags                = (v.tags != null ? v.tags : [])
      target_platform     = (v.target_platform != null ? v.target_platform : "FIAttached")
    }
  }


  #__________________________________________________________
  #
  # LAN Connectivity - vNICs Section Locals
  #__________________________________________________________

  lan_connectivity_policies_vnics = {
    for k, v in var.lan_connectivity_policies_vnics : k => {
      adapter_template          = (v.adapter_template != null ? v.adapter_template : "VMware")
      description               = (v.description != null ? v.description : "")
      lan_connectivity          = (v.lan_connectivity != null ? v.lan_connectivity : "default")
      mac_address_a_static      = (v.mac_address_a_static != null ? v.mac_address_a_static : "")
      mac_address_b_static      = (v.mac_address_b_static != null ? v.mac_address_b_static : "")
      mac_address_type          = (v.mac_address_type != null ? v.mac_address_type : "POOL")
      mac_forge                 = (v.mac_forge != null ? v.mac_forge : "allow")
      mac_pool_a_name           = (v.mac_pool_a_name != null ? v.mac_pool_a_name : "")
      mac_pool_b_name           = (v.mac_pool_b_name != null ? v.mac_pool_b_name : "")
      mac_registration_mode     = (v.mac_registration_mode != null ? v.mac_registration_mode : "nativeVlanOnly")
      neighbor_discovery        = (v.neighbor_discovery != null ? v.neighbor_discovery : "none")
      organization              = (v.organization != null ? v.organization : "default")
      qos_burst                 = (v.qos_burst != null ? v.qos_burst : 1024)
      qos_cos                   = (v.qos_cos != null ? v.qos_cos : 0)
      qos_mtu                   = (v.qos_mtu != null ? v.qos_mtu : 1500)
      qos_priority              = (v.qos_priority != null ? v.qos_priority : "")
      qos_rate_limit            = (v.qos_rate_limit != null ? v.qos_rate_limit : 0)
      qos_trust_host_cos        = (v.qos_trust_host_cos != null ? v.qos_trust_host_cos : false)
      tags                      = (v.tags != null ? v.tags : [])
      uplink_fail_action        = (v.uplink_fail_action != null ? v.uplink_fail_action : "linkDown")
      usnic_cos                 = (v.usnic_cos != null ? v.usnic_cos : 5)
      usnic_count               = (v.usnic_count != null ? v.usnic_count : 0)
      usnic_adapter_policy_moid = (v.usnic_adapter_policy_moid != null ? v.usnic_adapter_policy_moid : "")
      vlan_native_vlan          = (v.vlan_native_vlan != null ? v.vlan_native_vlan : null)
      vlan_list                 = (v.vlan_list != null ? v.vlan_list : "2-10,30-40")
      vmq_enabled               = (v.vmq_enabled != null ? v.vmq_enabled : false)
      vmq_multi_queue_support   = (v.vmq_multi_queue_support != null ? v.vmq_multi_queue_support : false)
      vmq_interrupts            = (v.vmq_interrupts != null ? v.vmq_interrupts : 16)
      vmq_number_queues         = (v.vmq_number_queues != null ? v.vmq_number_queues : 4)
      vmq_number_sub_vnics      = (v.vmq_number_sub_vnics != null ? v.vmq_number_sub_vnics : 64)
      vmq_adapter_policy_moid   = (v.vmq_adapter_policy_moid != null ? v.vmq_adapter_policy_moid : "")
      vnic_cdn_a_name           = (v.vnic_cdn_a_name != null ? v.vnic_cdn_a_name : null)
      vnic_cdn_b_name           = (v.vnic_cdn_b_name != null ? v.vnic_cdn_b_name : null)
      vnic_cdn_source           = (v.vnic_cdn_source != null ? v.vnic_cdn_source : "vnic")
      vnic_failover_enabled     = (v.vnic_failover_enabled != null ? v.vnic_failover_enabled : false)
      vnic_name_a               = (v.vnic_name_a != null ? v.vnic_name_a : "vnic-a")
      vnic_name_b               = (v.vnic_name_b != null ? v.vnic_name_b : "vnic-b")
      vnic_order_a              = (v.vnic_order_a != null ? v.vnic_order_a : 0)
      vnic_order_b              = (v.vnic_order_b != null ? v.vnic_order_b : 0)
      vnic_placement_pci_link_a = (v.vnic_placement_pci_link_a != null ? v.vnic_placement_pci_link_a : 0)
      vnic_placement_pci_link_b = (v.vnic_placement_pci_link_b != null ? v.vnic_placement_pci_link_b : 0)
      vnic_placement_slot_id    = (v.vnic_placement_slot_id != null ? v.vnic_placement_slot_id : "MLOM")
      vnic_placement_switch_a   = (v.vnic_placement_switch_a != null ? v.vnic_placement_switch_a : "A")
      vnic_placement_switch_b   = (v.vnic_placement_switch_b != null ? v.vnic_placement_switch_b : "B")
      vnic_placement_uplink     = (v.vnic_placement_uplink != null ? v.vnic_placement_uplink : 0)
    }
  }


  #______________________________________________
  #
  # Ethernet Port-Channel Policy Variables
  #______________________________________________
  policies_port_channel_lan = {
    for k, v in var.policies_port_channel_lan : k => {
      lan_pc_breakoutswport     = (v.lan_pc_breakoutswport != null ? v.lan_pc_breakoutswport : 0)
      lan_pc_ports              = (v.lan_pc_ports != null ? v.lan_pc_ports : [49, 50])
      lan_pc_speed              = (v.lan_pc_speed != null ? v.lan_pc_speed : "Auto")
      lan_pc_slot_id            = (v.lan_pc_slot_id != null ? v.lan_pc_slot_id : 1)
      policies_flow_control     = (v.policies_flow_control != null ? v.policies_flow_control : "")
      policies_link_aggregation = (v.policies_link_aggregation != null ? v.policies_link_aggregation : "")
      policies_link_control     = (v.policies_link_control != null ? v.policies_link_control : "")
      tags                      = (v.tags != null ? v.tags : [])
      ucs_domain_profile        = (v.ucs_domain_profile != null ? v.ucs_domain_profile : "")
    }
  }


  #__________________________________________________________
  #
  # SNMP Policy Section Locals
  #__________________________________________________________

  snmp_policies = {
    for k, v in var.snmp_policies : k => {
      description                = (v.description != null ? v.description : "")
      enabled                    = (v.enabled != null ? v.enabled : true)
      organization               = (v.organization != null ? v.organization : "default")
      snmp_access                = (v.snmp_access != null ? v.snmp_access : "Full")
      snmp_engine_id             = (v.snmp_engine_id != null ? v.snmp_engine_id : "")
      snmp_port                  = (v.snmp_port != null ? v.snmp_port : 161)
      snmp_trap_destinations     = (v.snmp_trap_destinations != null ? v.snmp_trap_destinations : [])
      snmp_user_1_auth_type      = (v.snmp_user_1_auth_type != null ? v.snmp_user_1_auth_type : "SHA")
      snmp_user_1_name           = (v.snmp_user_1_name != null ? v.snmp_user_1_name : "")
      snmp_user_1_security_level = (v.snmp_user_1_security_level != null ? v.snmp_user_1_security_level : "AuthPriv")
      snmp_user_2_auth_type      = (v.snmp_user_2_auth_type != null ? v.snmp_user_2_auth_type : "SHA")
      snmp_user_2_name           = (v.snmp_user_2_name != null ? v.snmp_user_2_name : "")
      snmp_user_2_security_level = (v.snmp_user_2_security_level != null ? v.snmp_user_2_security_level : "AuthPriv")
      system_contact             = (v.system_contact != null ? v.system_contact : "")
      system_location            = (v.system_location != null ? v.system_location : "")
      tags                       = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Storage Policy Section Locals
  #__________________________________________________________

  storage_policies = {
    for k, v in var.storage_policies : k => {
      access_policy = (v.access_policy != null ? v.access_policy : "Default")
      boot_drive    = (v.boot_drive != null ? v.boot_drive : true)
      description   = (v.description != null ? v.description : "")
      disks_group_0 = (v.disks_group_0 != null ? v.disks_group_0 : [1, 2])
      disks_group_1 = (v.disks_group_1 != null ? v.disks_group_1 : [])
      drive_cache   = (v.drive_cache != null ? v.drive_cache : "Default")
      drive_name    = (v.drive_name != null ? v.drive_name : "vd0")
      io_policy     = (v.io_policy != null ? v.io_policy : "Default")
      organization  = (v.organization != null ? v.organization : "default")
      raid_level    = (v.raid_level != null ? v.raid_level : "Raid1")
      read_policy   = (v.read_policy != null ? v.read_policy : "Default")
      retain_policy = (v.retain_policy != null ? v.retain_policy : true)
      stripe_size   = (v.stripe_size != null ? v.stripe_size : "Default")
      tags          = (v.tags != null ? v.tags : [])
      unused_disks  = (v.unused_disks != null ? v.unused_disks : "UnconfiguredGood")
      use_jbods     = (v.use_jbods != null ? v.use_jbods : true)
      write_policy  = (v.write_policy != null ? v.write_policy : "Default")
    }
  }


  #__________________________________________________________
  #
  # System QoS Policy Section Locals
  #__________________________________________________________

  system_qos_policies = {
    for k, v in var.system_qos_policies : k => {
      best_effort_admin_state        = (v.best_effort_admin_state != null ? v.best_effort_admin_state : "Enabled")
      best_effort_bandwidth          = (v.best_effort_bandwidth != null ? v.best_effort_bandwidth : 5)
      best_effort_mtu                = (v.best_effort_mtu != null ? v.best_effort_mtu : 9216)
      best_effort_multicast_optimize = (v.best_effort_multicast_optimize != null ? v.best_effort_multicast_optimize : false)
      best_effort_weight             = (v.best_effort_weight != null ? v.best_effort_weight : 1)
      bronze_admin_state             = (v.bronze_admin_state != null ? v.bronze_admin_state : "Enabled")
      bronze_bandwidth               = (v.bronze_bandwidth != null ? v.bronze_bandwidth : 5)
      bronze_cos                     = (v.bronze_cos != null ? v.bronze_cos : 1)
      bronze_mtu                     = (v.bronze_mtu != null ? v.bronze_mtu : 9216)
      bronze_multicast_optimize      = (v.bronze_multicast_optimize != null ? v.bronze_multicast_optimize : false)
      bronze_packet_drop             = (v.bronze_packet_drop != null ? v.bronze_packet_drop : true)
      bronze_weight                  = (v.bronze_weight != null ? v.bronze_weight : 1)
      description                    = (v.description != null ? v.description : "")
      fc_bandwidth                   = (v.fc_bandwidth != null ? v.fc_bandwidth : 39)
      fc_weight                      = (v.fc_weight != null ? v.fc_weight : 6)
      gold_admin_state               = (v.gold_admin_state != null ? v.gold_admin_state : "Enabled")
      gold_bandwidth                 = (v.gold_bandwidth != null ? v.gold_bandwidth : 23)
      gold_cos                       = (v.gold_cos != null ? v.gold_cos : 4)
      gold_mtu                       = (v.gold_mtu != null ? v.gold_mtu : 9216)
      gold_multicast_optimize        = (v.gold_multicast_optimize != null ? v.gold_multicast_optimize : false)
      gold_packet_drop               = (v.gold_packet_drop != null ? v.gold_packet_drop : true)
      gold_weight                    = (v.gold_weight != null ? v.gold_weight : 4)
      organization                   = (v.organization != null ? v.organization : "default")
      platinum_admin_state           = (v.platinum_admin_state != null ? v.platinum_admin_state : "Enabled")
      platinum_bandwidth             = (v.platinum_bandwidth != null ? v.platinum_bandwidth : 23)
      platinum_cos                   = (v.platinum_cos != null ? v.platinum_cos : 5)
      platinum_mtu                   = (v.platinum_mtu != null ? v.platinum_mtu : 9216)
      platinum_multicast_optimize    = (v.platinum_multicast_optimize != null ? v.platinum_multicast_optimize : false)
      platinum_packet_drop           = (v.platinum_packet_drop != null ? v.platinum_packet_drop : false)
      platinum_weight                = (v.platinum_weight != null ? v.platinum_weight : 4)
      silver_admin_state             = (v.silver_admin_state != null ? v.silver_admin_state : "Enabled")
      silver_bandwidth               = (v.silver_bandwidth != null ? v.silver_bandwidth : 5)
      silver_cos                     = (v.silver_cos != null ? v.silver_cos : 2)
      silver_mtu                     = (v.silver_mtu != null ? v.silver_mtu : 9216)
      silver_multicast_optimize      = (v.silver_multicast_optimize != null ? v.silver_multicast_optimize : false)
      silver_packet_drop             = (v.silver_packet_drop != null ? v.silver_packet_drop : true)
      silver_weight                  = (v.silver_weight != null ? v.silver_weight : 1)
      tags                           = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # vHBA SAN Connectivity Section Locals
  #__________________________________________________________

  policies_vhba_san_connectivity = {
    for k, v in var.policies_vhba_san_connectivity : k => {
      adapter_template             = (v.adapter_template != null ? v.adapter_template : "VMware")
      description                  = (v.description != null ? v.description : "")
      organization                 = (v.organization != null ? v.organization : "default")
      placement_mode               = (v.placement_mode != null ? v.placement_mode : "custom")
      target_platform              = (v.target_platform != null ? v.target_platform : "FIAttached")
      qos_burst                    = (v.qos_burst != null ? v.qos_burst : 1024)
      qos_cos                      = (v.qos_cos != null ? v.qos_cos : 3)
      qos_max_data_field_size      = (v.qos_max_data_field_size != null ? v.qos_max_data_field_size : 2112)
      qos_rate_limit               = (v.qos_rate_limit != null ? v.qos_rate_limit : 0)
      tags                         = (v.tags != null ? v.tags : [])
      vsan_a                       = (v.vsan_a != null ? v.vsan_a : 100)
      vsan_a_default_vlan_id       = (v.vsan_a_default_vlan_id != null ? v.vsan_a_default_vlan_id : 0)
      vsan_b                       = (v.vsan_b != null ? v.vsan_b : 200)
      vsan_b_default_vlan_id       = (v.vsan_b_default_vlan_id != null ? v.vsan_b_default_vlan_id : 0)
      vhba_name_a                  = (v.vhba_name_a != null ? v.vhba_name_a : "vhba-a")
      vhba_name_b                  = (v.vhba_name_b != null ? v.vhba_name_b : "vhba-b")
      vhba_order_a                 = (v.vhba_order_a != null ? v.vhba_order_a : 2)
      vhba_order_b                 = (v.vhba_order_b != null ? v.vhba_order_b : 3)
      vhba_persistent_lun_bindings = (v.vhba_persistent_lun_bindings != null ? v.vhba_persistent_lun_bindings : false)
      vhba_placement_pci_link_a    = (v.vhba_placement_pci_link_a != null ? v.vhba_placement_pci_link_a : 0)
      vhba_placement_pci_link_b    = (v.vhba_placement_pci_link_b != null ? v.vhba_placement_pci_link_b : 0)
      vhba_placement_slot_id       = (v.vhba_placement_slot_id != null ? v.vhba_placement_slot_id : "MLOM")
      vhba_placement_switch_a      = (v.vhba_placement_switch_a != null ? v.vhba_placement_switch_a : "A")
      vhba_placement_switch_b      = (v.vhba_placement_switch_b != null ? v.vhba_placement_switch_b : "B")
      vhba_placement_uplink        = (v.vhba_placement_uplink != null ? v.vhba_placement_uplink : 0)
      vhba_type                    = (v.vhba_type != null ? v.vhba_type : "fc-initiator")
      wwnn_address_static          = (v.wwnn_address_static != null ? v.wwnn_address_static : "")
      wwnn_address_type            = (v.wwnn_address_type != null ? v.wwnn_address_type : "POOL")
      wwnn_pool                    = (v.wwnn_pool != null ? v.wwnn_pool : "")
      wwpn_address_a_static        = (v.wwpn_address_a_static != null ? v.wwpn_address_a_static : "")
      wwpn_address_b_static        = (v.wwpn_address_b_static != null ? v.wwpn_address_b_static : "")
      wwpn_address_type            = (v.wwpn_address_type != null ? v.wwpn_address_type : "POOL")
      wwpn_pool_a_name             = (v.wwpn_pool_a_name != null ? v.wwpn_pool_a_name : "")
      wwpn_pool_b_name             = (v.wwpn_pool_b_name != null ? v.wwpn_pool_b_name : "")
    }
  }
}


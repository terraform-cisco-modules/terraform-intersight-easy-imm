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

  # Intersight Provider Variables
  endpoint = var.endpoint
  # Tags for Deployment
  tags = var.tags

  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_domain_profiles = {
    for k, v in var.ucs_domain_profiles : k => {
      action                        = (v.action != null ? v.action : "No-op")
      assign_switches               = (v.assign_switches != null ? v.assign_switches : false)
      device_model                  = (v.device_model != null ? v.device_model : "UCS-FI-6454")
      domain_description            = (v.domain_description != null ? v.domain_description : "")
      domain_descr_fi_a             = (v.domain_descr_fi_a != null ? v.domain_descr_fi_a : "")
      domain_descr_fi_b             = (v.domain_descr_fi_b != null ? v.domain_descr_fi_b : "")
      domain_serial_a               = (v.domain_serial_a != null ? v.domain_serial_a : "")
      domain_serial_b               = (v.domain_serial_b != null ? v.domain_serial_b : "")
      fc_ports                      = (v.fc_ports != null ? v.fc_ports : [1, 4])
      fc_slot_id                    = (v.fc_slot_id != null ? v.fc_slot_id : 1)
      organization                  = (v.organization != null ? v.organization : "default")
      policies_network_connectivity = (v.policies_network_connectivity != null ? v.policies_network_connectivity : "")
      policies_ntp                  = (v.policies_ntp != null ? v.policies_ntp : "")
      policies_snmp                 = (v.policies_snmp != null ? v.policies_snmp : "")
      policies_switch_control       = (v.policies_switch_control != null ? v.policies_switch_control : "")
      policies_syslog               = (v.policies_syslog != null ? v.policies_syslog : "")
      policies_system_qos           = (v.policies_system_qos != null ? v.policies_system_qos : "")
      port_policy_descr_a           = (v.port_policy_descr_a != null ? v.port_policy_descr_a : "")
      port_policy_descr_b           = (v.port_policy_descr_b != null ? v.port_policy_descr_b : "")
      san_fill_pattern              = (v.san_fill_pattern != null ? v.san_fill_pattern : "Arbff")
      san_pc_breakoutswport         = (v.san_pc_breakoutswport != null ? v.san_pc_breakoutswport : 0)
      san_pc_ports                  = (v.san_pc_ports != null ? v.san_pc_ports : [1, 2])
      san_pc_speed                  = (v.san_pc_speed != null ? v.san_pc_speed : "16Gbps")
      san_pc_slot_id                = (v.san_pc_slot_id != null ? v.san_pc_slot_id : 1)
      server_ports                  = (v.server_ports != null ? v.server_ports : "5-18")
      tags                          = (v.tags != null ? v.tags : [])
      vsan_a                        = (v.vsan_a != null ? v.vsan_a : 100)
      vsan_a_description            = (v.vsan_a_description != null ? v.vsan_a_description : "")
      vsan_a_fcoe                   = (v.vsan_a_fcoe != null ? v.vsan_a_fcoe : null)
      vsan_b                        = (v.vsan_b != null ? v.vsan_b : 200)
      vsan_b_description            = (v.vsan_b_description != null ? v.vsan_b_description : "")
      vsan_b_fcoe                   = (v.vsan_b_fcoe != null ? v.vsan_b_fcoe : null)
      vsan_enable_trunking          = (v.vsan_enable_trunking != null ? v.vsan_enable_trunking : false)
      vsan_prefix                   = (v.vsan_prefix != null ? v.vsan_prefix : "")
    }
  }


  #__________________________________________________________
  #
  # Flow Control Policy Section Locals
  #__________________________________________________________

  policies_flow_control = {
    for k, v in var.policies_flow_control : k => {
      description          = (v.description != null ? v.description : "")
      flow_control_mode    = (v.flow_control_mode != null ? v.flow_control_mode : "auto")
      flow_control_receive = (v.flow_control_receive != null ? v.flow_control_receive : "Disabled")
      flow_control_send    = (v.flow_control_send != null ? v.flow_control_send : "Disabled")
      organization         = (v.organization != null ? v.organization : "default")
      tags                 = (v.tags != null ? v.tags : [])
    }
  }


  #______________________________________________
  #
  # LAN Port-Channel Policy Variables
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
  # Link Aggregation Policy Section Locals
  #__________________________________________________________

  policies_link_aggregation = {
    for k, v in var.policies_link_aggregation : k => {
      description        = (v.description != null ? v.description : "")
      lacp_rate          = (v.lacp_rate != null ? v.lacp_rate : "normal")
      organization       = (v.organization != null ? v.organization : "default")
      suspend_individual = (v.suspend_individual != null ? v.suspend_individual : false)
      tags               = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Link Control Policy Section Locals
  #__________________________________________________________

  policies_link_control = {
    for k, v in var.policies_link_control : k => {
      description      = (v.description != null ? v.description : "")
      organization     = (v.organization != null ? v.organization : "default")
      tags             = (v.tags != null ? v.tags : [])
      udld_admin_state = (v.udld_admin_state != null ? v.udld_admin_state : "Enabled")
      udld_mode        = (v.udld_mode != null ? v.udld_mode : "normal")
    }
  }


  #__________________________________________________________
  #
  # Network Connectivity (DNS) Policy Section Locals
  #__________________________________________________________

  policies_network_connectivity = {
    for k, v in var.policies_network_connectivity : k => {
      description    = (v.description != null ? v.description : "")
      dns_servers_v4 = (v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"])
      dns_servers_v6 = (v.dns_servers_v6 != null ? v.dns_servers_v6 : [])
      dynamic_dns    = (v.dynamic_dns != null ? v.dynamic_dns : false)
      ipv6_enable    = (v.ipv6_enable != null ? v.ipv6_enable : false)
      organization   = (v.organization != null ? v.organization : "default")
      tags           = (v.tags != null ? v.tags : [])
      update_domain  = (v.update_domain != null ? v.update_domain : "")
    }
  }


  #__________________________________________________________
  #
  # NTP Policy Section Locals
  #__________________________________________________________

  policies_ntp = {
    for k, v in var.policies_ntp : k => {
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
  # SNMP Policy Section Locals
  #__________________________________________________________

  policies_snmp = {
    for k, v in var.policies_snmp : k => {
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
  # Switch Control Policy Section Locals
  #__________________________________________________________

  policies_switch_control = {
    for k, v in var.policies_switch_control : k => {
      description           = (v.description != null ? v.description : "")
      mac_aging_option      = (v.mac_aging_option != null ? v.mac_aging_option : "Default")
      mac_aging_time        = (v.mac_aging_time != null ? v.mac_aging_time : 14500)
      organization          = (v.organization != null ? v.organization : "default")
      tags                  = (v.tags != null ? v.tags : [])
      udld_message_interval = (v.udld_message_interval != null ? v.udld_message_interval : 15)
      udld_recovery_action  = (v.udld_recovery_action != null ? v.udld_recovery_action : "none")
      vlan_optimization     = (v.vlan_optimization != null ? v.vlan_optimization : false)
    }
  }


  #__________________________________________________________
  #
  # Syslog Policy Section Locals
  #__________________________________________________________

  policies_syslog = {
    for k, v in var.policies_syslog : k => {
      description         = (v.description != null ? v.description : "")
      local_min_severity  = (v.local_min_severity != null ? v.local_min_severity : "warning")
      organization        = (v.organization != null ? v.organization : "default")
      syslog_destinations = (v.syslog_destinations != null ? v.syslog_destinations : [])
      tags                = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # System QoS Policy Section Locals
  #__________________________________________________________

  policies_system_qos = {
    for k, v in var.policies_system_qos : k => {
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
}

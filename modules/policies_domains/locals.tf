#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

#__________________________________________________________
#
# Assign Global Attributes from global_vars Workspace
#__________________________________________________________

locals {
  # Intersight Organization Variables
  org_name = var.organization
  org_moid = data.intersight_organization_organization.org_moid.results.0.moid

  # Intersight UCS Domain Variables
  domain_profile_a = data.terraform_remote_state.domain.outputs.domain_profile_a
  domain_profile_b = data.terraform_remote_state.domain.outputs.domain_profile_b

  # DNS Policy
  dns_policy     = var.tfc_variables.dns_policy     == null ? ""                                   : var.tfc_variables.dns_policy
  dns_servers_v4 = var.tfc_variables.dns_servers_v4 == null ? ["208.67.222.222", "208.67.220.220"] : var.tfc_variables.dns_servers_v4
  dns_servers_v6 = var.tfc_variables.dns_servers_v6 == null ? []                                   : var.tfc_variables.dns_servers_v6
  dynamic_dns    = var.tfc_variables.dynamic_dns    == null ? false                                : var.tfc_variables.dynamic_dns
  ipv6_enable    = var.tfc_variables.ipv6_enable    == null ? false                                : var.tfc_variables.ipv6_enable
  update_domain  = var.tfc_variables.update_domain  == null ? ""                                   : var.tfc_variables.update_domain

  # Flow Control, Link Aggregation, Link Control, and Multicast Policy
  flow_control_policy     = var.tfc_variables.flow_control_policy     == null ? "" : var.tfc_variables.flow_control_policy
  link_aggregation_policy = var.tfc_variables.link_aggregation_policy == null ? "" : var.tfc_variables.link_aggregation_policy
  link_control_policy     = var.tfc_variables.link_control_policy     == null ? "" : var.tfc_variables.link_control_policy
  multicast_policy        = var.tfc_variables.multicast_policy        == null ? "" : var.tfc_variables.multicast_policy

  # NTP Policy
  ntp_policy = var.tfc_variables.ntp_policy   == null ? ""                                         : var.tfc_variables.ntp_policy
  ntp_servers = var.tfc_variables.ntp_servers == null ? ["time-a-g.nist.gov", "time-b-g.nist.gov"] : var.tfc_variables.ntp_servers
  timezone = var.tfc_variables.timezone       == null ? "Etc/GMT"                                  : var.tfc_variables.timezone

  # Port Policy, LAN Port-Channel, SAN Port-Channel, and Server Ports
  port_policy            = var.tfc_variables.port_policy            == null ? ""       : var.tfc_variables.port_policy
  lan_pc_breakout_swport = var.tfc_variables.lan_pc_breakout_swport == null ? 0        : var.tfc_variables.lan_pc_breakout_swport
  lan_port_channel       = var.tfc_variables.lan_port_channel       == null ? [53, 54] : var.tfc_variables.lan_port_channel
  lan_uplink_speed       = var.tfc_variables.lan_uplink_speed       == null ? "Auto"   : var.tfc_variables.lan_uplink_speed
  lan_pc_slot_id         = var.tfc_variables.lan_pc_slot_id         == null ? 1        : var.tfc_variables.lan_pc_slot_id
  fill_pattern           = var.tfc_variables.fill_pattern           == null ? "Idle"   : var.tfc_variables.fill_pattern
  san_pc_breakout_swport = var.tfc_variables.san_pc_breakout_swport == null ? 0        : var.tfc_variables.san_pc_breakout_swport
  san_port_channel       = var.tfc_variables.san_port_channel       == null ? [1, 2]   : var.tfc_variables.san_port_channel
  san_uplink_speed       = var.tfc_variables.san_uplink_speed       == null ? "16Gbps" : var.tfc_variables.san_uplink_speed
  san_pc_slot_id         = var.tfc_variables.san_pc_slot_id         == null ? 1        : var.tfc_variables.san_pc_slot_id
  server_ports           = var.tfc_variables.server_ports           == null ? 1        : var.tfc_variables.server_ports

  # SNMP Policy
  snmp_policy            = var.tfc_variables.snmp_policy            == null ? "" : var.tfc_variables.snmp_policy
  snmp_trap_destinations = var.tfc_variables.snmp_trap_destinations == null ? [] : var.tfc_variables.snmp_trap_destinations
  snmp_users             = var.tfc_variables.snmp_users             == null ? [] : var.tfc_variables.snmp_users
  system_contact         = var.tfc_variables.system_contact         == null ? "" : var.tfc_variables.system_contact
  system_location        = var.tfc_variables.system_location        == null ? "" : var.tfc_variables.system_location

  # Switch Control Policy
  switch_control_policy = var.tfc_variables.switch_control_policy == null ? ""        : var.tfc_variables.switch_control_policy
  mac_aging_option      = var.tfc_variables.mac_aging_option      == null ? "Default" : var.tfc_variables.mac_aging_option
  mac_aging_time        = var.tfc_variables.mac_aging_time        == null ? 14500     : var.tfc_variables.mac_aging_time
  udld_message_interval = var.tfc_variables.udld_message_interval == null ? 15        : var.tfc_variables.udld_message_interval
  udld_recovery_action  = var.tfc_variables.udld_recovery_action  == null ? "reset"   : var.tfc_variables.udld_recovery_action
  vlan_optimization     = var.tfc_variables.vlan_optimization     == null ? true      : var.tfc_variables.vlan_optimization

  # Syslog Policy
  syslog_policy       = var.tfc_variables.syslog_policy       == null ? ""        : var.tfc_variables.syslog_policy
  syslog_destinations = var.tfc_variables.syslog_destinations == null ? []        : var.tfc_variables.syslog_destinations
  syslog_severity     = var.tfc_variables.syslog_severity     == null ? "warning" : var.tfc_variables.syslog_severity

  # System QoS Policy
  system_qos_policy              = var.tfc_variables.system_qos_policy              == null ? ""         : var.tfc_variables.system_qos_policy
  best_effort_admin_state        = var.tfc_variables.best_effort_admin_state        == null ? "Enabled"  : var.tfc_variables.best_effort_admin_state
  best_effort_bandwidth          = var.tfc_variables.best_effort_bandwidth          == null ? 50         : var.tfc_variables.best_effort_bandwidth
  best_effort_mtu                = var.tfc_variables.best_effort_mtu                == null ? 9216       : var.tfc_variables.best_effort_mtu
  best_effort_multicast_optimize = var.tfc_variables.best_effort_multicast_optimize == null ? false      : var.tfc_variables.best_effort_multicast_optimize
  best_effort_weight             = var.tfc_variables.best_effort_weight             == null ? 5          : var.tfc_variables.best_effort_weight
  bronze_admin_state             = var.tfc_variables.bronze_admin_state             == null ? "Disabled" : var.tfc_variables.bronze_admin_state
  bronze_bandwidth               = var.tfc_variables.bronze_bandwidth               == null ? 0          : var.tfc_variables.bronze_bandwidth
  bronze_cos                     = var.tfc_variables.bronze_cos                     == null ? 1          : var.tfc_variables.bronze_cos
  bronze_mtu                     = var.tfc_variables.bronze_mtu                     == null ? 9216       : var.tfc_variables.bronze_mtu
  bronze_multicast_optimize      = var.tfc_variables.bronze_multicast_optimize      == null ? false      : var.tfc_variables.bronze_multicast_optimize
  bronze_packet_drop             = var.tfc_variables.bronze_packet_drop             == null ? true       : var.tfc_variables.bronze_packet_drop
  bronze_weight                  = var.tfc_variables.bronze_weight                  == null ? 7          : var.tfc_variables.bronze_weight
  fc_bandwidth                   = var.tfc_variables.fc_bandwidth                   == null ? 50         : var.tfc_variables.fc_bandwidth
  fc_weight                      = var.tfc_variables.fc_weight                      == null ? 5          : var.tfc_variables.fc_weight
  gold_admin_state               = var.tfc_variables.gold_admin_state               == null ? "Disabled" : var.tfc_variables.gold_admin_state
  gold_bandwidth                 = var.tfc_variables.gold_bandwidth                 == null ? 0          : var.tfc_variables.gold_bandwidth
  gold_cos                       = var.tfc_variables.gold_cos                       == null ? 4          : var.tfc_variables.gold_cos
  gold_mtu                       = var.tfc_variables.gold_mtu                       == null ? 9216       : var.tfc_variables.gold_mtu
  gold_multicast_optimize        = var.tfc_variables.gold_multicast_optimize        == null ? false      : var.tfc_variables.gold_multicast_optimize
  gold_packet_drop               = var.tfc_variables.gold_packet_drop               == null ? true       : var.tfc_variables.gold_packet_drop
  gold_weight                    = var.tfc_variables.gold_weight                    == null ? 9          : var.tfc_variables.gold_weight
  platinum_admin_state           = var.tfc_variables.platinum_admin_state           == null ? "Disabled" : var.tfc_variables.platinum_admin_state
  platinum_bandwidth             = var.tfc_variables.platinum_bandwidth             == null ? 0          : var.tfc_variables.platinum_bandwidth
  platinum_cos                   = var.tfc_variables.platinum_cos                   == null ? 5          : var.tfc_variables.platinum_cos
  platinum_mtu                   = var.tfc_variables.platinum_mtu                   == null ? 9216       : var.tfc_variables.platinum_mtu
  platinum_multicast_optimize    = var.tfc_variables.platinum_multicast_optimize    == null ? false      : var.tfc_variables.platinum_multicast_optimize
  platinum_packet_drop           = var.tfc_variables.platinum_packet_drop           == null ? true       : var.tfc_variables.platinum_packet_drop
  platinum_weight                = var.tfc_variables.platinum_weight                == null ? 10         : var.tfc_variables.platinum_weight
  silver_admin_state             = var.tfc_variables.silver_admin_state             == null ? "Disabled" : var.tfc_variables.silver_admin_state
  silver_bandwidth               = var.tfc_variables.silver_bandwidth               == null ? 0          : var.tfc_variables.silver_bandwidth
  silver_cos                     = var.tfc_variables.silver_cos                     == null ? 2          : var.tfc_variables.silver_cos
  silver_mtu                     = var.tfc_variables.silver_mtu                     == null ? 9216       : var.tfc_variables.silver_mtu
  silver_multicast_optimize      = var.tfc_variables.silver_multicast_optimize      == null ? false      : var.tfc_variables.silver_multicast_optimize
  silver_packet_drop             = var.tfc_variables.silver_packet_drop             == null ? true       : var.tfc_variables.silver_packet_drop
  silver_weight                  = var.tfc_variables.silver_weight                  == null ? 8          : var.tfc_variables.silver_weight

  # VLAN Policy
  vlan_policy = var.tfc_variables.vlan_policy == null ? ""         : var.tfc_variables.vlan_policy
  native_vlan = var.tfc_variables.native_vlan == null ? 1          : var.tfc_variables.native_vlan
  vlan_list   = var.tfc_variables.vlan_list   == null ? "2-5,7-10" : var.tfc_variables.vlan_list

  # VSAN Policy
  vsan_policy   = var.tfc_variables.vsan_policy   == null ? ""  : var.tfc_variables.vsan_policy
  vsan_fabric_a = var.tfc_variables.vsan_fabric_a == null ? 100 : var.tfc_variables.vsan_fabric_a
  vsan_fabric_b = var.tfc_variables.vsan_fabric_b == null ? 200 : var.tfc_variables.vsan_fabric_b

  # Tags for Deployment
  tags = var.tags
}

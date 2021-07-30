#____________________________________________________________
#
# Intersight Multicast Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "multicast" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_multicast"
  description = local.multicast_policy != "" ? "${local.multicast_policy} Multicast Policy." : "${local.org_name} Multicast Policy."
  name        = local.multicast_policy != "" ? local.multicast_policy : local.org_name
  org_moid    = local.org_moid
  tags        = local.tags
}

#____________________________________________________________
#
# Intersight UCS Domain VLAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vlan_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy"
  description = local.vlan_policy != "" ? "${local.vlan_policy} VLAN Policy." : "${local.org_name} VLAN Policy."
  name        = local.vlan_policy != "" ? local.vlan_policy : local.org_name
  org_moid    = local.org_moid
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  tags = local.tags
}

#______________________________________________
#
# Assign Native VLAN to VLAN Policy
#______________________________________________

module "native_vlan" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.multicast,
    module.vlan_policy
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vlan"
  is_native        = true
  multicast_moid   = module.multicast.moid
  vlan             = local.native_vlan
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = local.org_name
}

#______________________________________________
#
# Assign VLAN List to VLAN Policy
#______________________________________________

module "vlan_list" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.multicast,
    module.vlan_policy
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_list"
  is_native        = false
  multicast_moid   = module.multicast.moid
  vlan_list        = local.vlan_list
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = local.org_name
}


#____________________________________________________________
#
# Intersight VSAN Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vsan_policy_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = local.vsan_policy != "" ? "${local.vsan_policy} VSAN Policy Fabric A." : "${local.org_name} VSAN Policy Fabric A."
  name        = local.vsan_policy != "" ? "${local.vsan_policy}_a" : "${local.org_name}_a"
  org_moid    = local.org_moid
  profiles    = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags        = local.tags
}

module "vsan_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = local.vsan_policy != "" ? "${local.vsan_policy} VSAN Policy Fabric B." : "${local.org_name} VSAN Policy Fabric B."
  name        = local.vsan_policy != "" ? "${local.vsan_policy}_b" : "${local.org_name}_b"
  org_moid    = local.org_moid
  profiles    = var.assign_domain == false ? [] : [local.domain_profile_b.moid]
  tags        = local.tags
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vsan_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  vsan_policy_moid = module.vsan_policy_a.moid
  vsan_prefix      = local.org_name
  vsan_list = {
    vsan_a = {
      fcoe_vlan = local.vsan_fabric_a,
      vsan_id   = local.vsan_fabric_a
    }
  }
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric B Policy
#______________________________________________

module "vsan_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vsan_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  vsan_policy_moid = module.vsan_policy_b.moid
  vsan_prefix      = local.org_name
  vsan_list = {
    vsan_a = {
      fcoe_vlan = local.vsan_fabric_b,
      vsan_id   = local.vsan_fabric_b
    }
  }
}


#____________________________________________________________
#
# Intersight Port Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "port_policy_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = local.port_policy != "" ? "${local.port_policy} Port Policy Fabric A." : "${local.org_name} Port Policy Fabric A."
  device_model = local.domain_profile_a.model
  name         = local.port_policy != "" ? "${local.port_policy}_a" : "${local.org_name}_a"
  org_moid     = local.org_moid
  profiles     = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags         = local.tags
}

module "port_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = local.port_policy != "" ? "${local.port_policy} Port Policy Fabric B." : "${local.org_name} Port Policy Fabric B."
  device_model = local.domain_profile_b.model
  name         = local.port_policy != "" ? "${local.port_policy}_b" : "${local.org_name}_b"
  org_moid     = local.org_moid
  profiles     = var.assign_domain == false ? [] : [local.domain_profile_b.moid]
  tags         = local.tags
}


#____________________________________________________________
#
# Intersight Port Mode Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "port_mode_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "port_mode_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  custom_mode      = "FibreChannel"
  port_policy_moid = module.port_policy_b.moid
  tags             = local.tags
}


#____________________________________________________________
#
# Intersight Server Port Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "server_ports_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = local.server_ports
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "server_ports_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = local.server_ports
  port_policy_moid = module.port_policy_b.moid
  tags             = local.tags
}


#____________________________________________________________
#
# Intersight LAN Port-Channel Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________


#______________________________________________
#
# Create Flow Control Policy
#______________________________________________

module "flow_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_flow_control"
  description = local.flow_control_policy != "" ? "${local.flow_control_policy} Flow Control Policy." : "${local.org_name} Flow Control Policy"
  name        = local.flow_control_policy != "" ? "${local.flow_control_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Link Aggregation Policy
#______________________________________________

module "link_aggregation" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation"
  description = local.link_aggregation_policy != "" ? "${local.link_aggregation_policy} Link Aggregation Policy." : "${local.org_name} Link Aggregation Policy."
  lacp_rate   = "normal"
  name        = local.link_aggregation_policy != "" ? "${local.link_aggregation_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Link Control Policy
#______________________________________________

module "link_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_link_control"
  description = local.link_control_policy != "" ? "${local.link_control_policy} Link Control Policy." : "${local.org_name} Link Control Policy."
  name        = local.link_control_policy != "" ? "${local.link_control_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
}

#______________________________________________
#
# Create Fabric A LAN Port-Channel
#______________________________________________

module "lan_uplink_port_channel_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_a
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  breakout_sw_port      = local.lan_pc_breakout_swport
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = element(local.lan_port_channel, 0)
  lan_uplink_pc_ports   = local.lan_port_channel
  lan_uplink_speed      = local.lan_uplink_speed
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_a.moid
  slot_id               = local.lan_pc_slot_id
  tags                  = local.tags
}

#______________________________________________
#
# Create Fabric B LAN Port-Channel
#______________________________________________

module "lan_uplink_port_channel_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  breakout_sw_port      = local.lan_pc_breakout_swport
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = element(local.lan_port_channel, 0)
  lan_uplink_pc_ports   = local.lan_port_channel
  lan_uplink_speed      = local.lan_uplink_speed
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_b.moid
  slot_id               = local.lan_pc_slot_id
  tags                  = local.tags
}


#____________________________________________________________
#
# Intersight SAN Port-Channel Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# Create Fabric A SAN Port-Channel
#______________________________________________

module "san_uplink_port_channel_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_mode_a,
    module.port_policy_a
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  breakout_sw_port    = local.san_pc_breakout_swport
  fill_pattern        = local.fill_pattern
  san_uplink_pc_id    = element(local.san_port_channel, 0)
  san_uplink_pc_ports = local.san_port_channel
  san_uplink_speed    = local.san_uplink_speed
  port_policy_moid    = module.port_policy_a.moid
  slot_id             = local.san_pc_slot_id
  tags                = local.tags
  vsan_id             = local.vsan_fabric_a
}

#______________________________________________
#
# Create Fabric B SAN Port-Channel
#______________________________________________

module "san_uplink_port_channel_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_mode_b,
    module.port_policy_b
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  breakout_sw_port    = local.san_pc_breakout_swport
  fill_pattern        = local.fill_pattern
  san_uplink_pc_id    = element(local.san_port_channel, 0)
  san_uplink_pc_ports = local.san_port_channel
  san_uplink_speed    = local.san_uplink_speed
  port_policy_moid    = module.port_policy_b.moid
  slot_id             = local.san_pc_slot_id
  tags                = local.tags
  vsan_id             = local.vsan_fabric_b
}

#____________________________________________________________
#
# Intersight System QoS Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "system_qos_1" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  description = local.system_qos_policy != "" ? "${local.system_qos_policy} System QoS Policy." : "${local.org_name} System QoS Policy."
  name        = local.system_qos_policy != "" ? "${local.system_qos_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  classes = []
}

module "system_qos_2" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  description = local.system_qos_policy != "" ? "${local.system_qos_policy} System QoS Policy." : "${local.org_name} System QoS Policy."
  name        = local.system_qos_policy != "" ? "${local.system_qos_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  classes = [
    {
      admin_state         = local.bronze_admin_state
      bandwidth_percent   = local.bronze_bandwidth
      cos                 = local.bronze_cos
      mtu                 = local.bronze_mtu
      multicast_optimize  = local.bronze_multicast_optimize
      name                = "Bronze"
      packet_drop         = local.bronze_packet_drop
      weight              = local.bronze_weight
    },
    {
      admin_state         = local.silver_admin_state
      bandwidth_percent   = local.silver_bandwidth
      cos                 = local.silver_cos
      mtu                 = local.silver_mtu
      multicast_optimize  = local.silver_multicast_optimize
      name                = "Silver"
      packet_drop         = local.silver_packet_drop
      weight              = local.silver_weight
    },
    {
      admin_state         = local.gold_admin_state
      bandwidth_percent   = local.gold_bandwidth
      cos                 = local.gold_cos
      mtu                 = local.gold_mtu
      multicast_optimize  = local.gold_multicast_optimize
      name                = "Gold"
      packet_drop         = local.gold_packet_drop
      weight              = local.gold_weight
    },
    {
      admin_state         = local.platinum_admin_state
      bandwidth_percent   = local.platinum_bandwidth
      cos                 = local.platinum_cos
      mtu                 = local.platinum_mtu
      multicast_optimize  = local.platinum_multicast_optimize
      name                = "Platinum"
      packet_drop         = local.platinum_packet_drop
      weight              = local.platinum_weight
    },
    {
      admin_state         = local.best_effort_admin_state
      bandwidth_percent   = local.best_effort_bandwidth
      cos                 = 255
      mtu                 = local.best_effort_mtu
      multicast_optimize  = local.best_effort_multicast_optimize
      name                = "Best Effort"
      packet_drop         = null
      weight              = local.best_effort_weight
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = local.fc_bandwidth
      cos                 = 3
      mtu                 = 2240
      multicast_optimize  = null
      name                = "FC"
      packet_drop         = false
      weight              = local.fc_weight
    },
  ]
}

#____________________________________________________________
#
# Intersight Switch Control Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "switch_control" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_switch_control"
  description           = local.switch_control_policy != "" ? "${local.switch_control_policy} Switch Control Policy." : "${local.org_name} Switch Control Policy."
  name                  = local.switch_control_policy != "" ? "${local.switch_control_policy}" : "${local.org_name}"
  mac_aging_option      = local.mac_aging_option
  mac_aging_time        = local.mac_aging_time
  udld_message_interval = local.udld_message_interval
  udld_recovery_action  = local.udld_recovery_action
  vlan_optimization     = local.vlan_optimization
  org_moid              = local.org_moid
  tags                  = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}


#_______________________________________________________________
#
# Intersight Network Connectivity (DNS) Policy
# GUI Location: Policies > Create Policy
#_______________________________________________________________

module "dns" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  description    = local.dns_policy != "" ? "${local.dns_policy} DNS Policy." : "${local.org_name} DNS Policy."
  dns_servers_v4 = local.dns_servers_v4
  dns_servers_v6 = local.dns_servers_v6
  dynamic_dns    = local.dynamic_dns
  ipv6_enable    = local.ipv6_enable
  name           = local.dns_policy != "" ? "${local.dns_policy}" : "${local.org_name}_domain"
  org_moid       = local.org_moid
  tags           = local.tags
  profile_type   = "domain"
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  update_domain  = var.update_domain
}


#____________________________________________________________
#
# Intersight NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description  = local.ntp_policy != "" ? "${local.ntp_policy} NTP Policy." : "${local.org_name} NTP Policy."
  name         = local.ntp_policy != "" ? "${local.ntp_policy}" : "${local.org_name}_domain"
  ntp_servers  = local.ntp_servers
  org_moid     = local.org_moid
  profile_type = "domain"
  tags         = local.tags
  timezone     = local.timezone
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}


#____________________________________________________________
#
# Intersight SNMP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "snmp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description     = local.snmp_policy != "" ? "${local.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name            = local.snmp_policy != "" ? "${local.snmp_policy}" : "${local.org_name}_domain"
  org_moid        = local.org_moid
  profile_type    = "domain"
  snmp_community  = var.snmp_community
  snmp_traps      = local.snmp_trap_destinations
  snmp_users      = local.snmp_users
  system_contact  = local.system_contact
  system_location = local.system_location
  tags            = local.tags
  trap_community  = var.trap_community
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}


#____________________________________________________________
#
# Intersight Syslog Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "syslog" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  description     = local.syslog_policy != "" ? "${local.syslog_policy} Syslog Policy." : "${local.org_name} Syslog Policy."
  name            = local.syslog_policy != "" ? "${local.syslog_policy}" : "${local.org_name}_domain"
  org_moid        = local.org_moid
  profile_type    = "domain"
  remote_clients  = local.syslog_destinations
  syslog_severity = local.syslog_severity
  tags            = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}

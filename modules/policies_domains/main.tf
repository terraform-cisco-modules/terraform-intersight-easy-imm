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
  description = var.multicast_policy != "" ? "${var.multicast_policy} Multicast Policy." : "${local.org_name} Multicast Policy."
  name        = var.multicast_policy != "" ? var.multicast_policy : local.org_name
  org_moid    = local.org_moid
  tags        = local.tags
}

#____________________________________________________________
#
# Intersight VLAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vlan_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy"
  description = var.vlan_policy != "" ? "${var.vlan_policy} VLAN Policy." : "${local.org_name} VLAN Policy."
  name        = var.vlan_policy != "" ? var.vlan_policy : local.org_name
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
  vlan             = var.native_vlan
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
  vlan_list        = var.vlan_list
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
  description = var.vsan_policy != "" ? "${var.vsan_policy} VSAN Policy Fabric A." : "${local.org_name} VSAN Policy Fabric A."
  name        = var.vsan_policy != "" ? "${var.vsan_policy}_a" : "${local.org_name}_a"
  org_moid    = local.org_moid
  profiles    = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags        = local.tags
}

module "vsan_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = var.vsan_policy != "" ? "${var.vsan_policy} VSAN Policy Fabric B." : "${local.org_name} VSAN Policy Fabric B."
  name        = var.vsan_policy != "" ? "${var.vsan_policy}_b" : "${local.org_name}_b"
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
      fcoe_vlan = var.vsan_fabric_a,
      vsan_id   = var.vsan_fabric_a
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
      fcoe_vlan = var.vsan_fabric_b,
      vsan_id   = var.vsan_fabric_b
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
  description  = var.port_policy != "" ? "${var.port_policy} Port Policy Fabric A." : "${local.org_name} Port Policy Fabric A."
  device_model = local.domain_profile_a.model
  name         = var.port_policy != "" ? "${var.port_policy}_a" : "${local.org_name}_a"
  org_moid     = local.org_moid
  profiles     = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags         = local.tags
}

module "port_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = var.port_policy != "" ? "${var.port_policy} Port Policy Fabric B." : "${local.org_name} Port Policy Fabric B."
  device_model = local.domain_profile_b.model
  name         = var.port_policy != "" ? "${var.port_policy}_b" : "${local.org_name}_b"
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
  port_list        = var.server_ports
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "server_ports_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = var.server_ports
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
  description = var.flow_control_policy != "" ? "${var.flow_control_policy} Flow Control Policy." : "${local.org_name} Flow Control Policy"
  name        = var.flow_control_policy != "" ? "${var.flow_control_policy}" : "${local.org_name}"
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
  description = var.link_aggregation_policy != "" ? "${var.link_aggregation_policy} Link Aggregation Policy." : "${local.org_name} Link Aggregation Policy."
  lacp_rate   = "normal"
  name        = var.link_aggregation_policy != "" ? "${var.link_aggregation_policy}" : "${local.org_name}"
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
  description = var.link_control_policy != "" ? "${var.link_control_policy} Link Control Policy." : "${local.org_name} Link Control Policy."
  name        = var.link_control_policy != "" ? "${var.link_control_policy}" : "${local.org_name}"
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
  breakout_sw_port      = var.lan_pc_breakout_swport
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = element(var.lan_port_channel, 0)
  lan_uplink_pc_ports   = var.lan_port_channel
  lan_uplink_speed      = var.lan_uplink_speed
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_a.moid
  slot_id               = var.lan_pc_slot_id
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
  breakout_sw_port      = var.lan_pc_breakout_swport
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = element(var.lan_port_channel, 0)
  lan_uplink_pc_ports   = var.lan_port_channel
  lan_uplink_speed      = var.lan_uplink_speed
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_b.moid
  slot_id               = var.lan_pc_slot_id
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
  breakout_sw_port    = var.san_pc_breakout_swport
  fill_pattern        = var.fill_pattern
  san_uplink_pc_id    = element(var.san_port_channel, 0)
  san_uplink_pc_ports = var.san_port_channel
  san_uplink_speed    = var.san_uplink_speed
  port_policy_moid    = module.port_policy_a.moid
  slot_id             = var.san_pc_slot_id
  tags                = local.tags
  vsan_id             = var.vsan_fabric_a
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
  breakout_sw_port    = var.san_pc_breakout_swport
  fill_pattern        = var.fill_pattern
  san_uplink_pc_id    = element(var.san_port_channel, 0)
  san_uplink_pc_ports = var.san_port_channel
  san_uplink_speed    = var.san_uplink_speed
  port_policy_moid    = module.port_policy_b.moid
  slot_id             = var.san_pc_slot_id
  tags                = local.tags
  vsan_id             = var.vsan_fabric_b
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
  description = var.system_qos_policy != "" ? "${var.system_qos_policy} System QoS Policy." : "${local.org_name} System QoS Policy."
  name        = var.system_qos_policy != "" ? "${var.system_qos_policy}" : "${local.org_name}"
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
  description = var.system_qos_policy != "" ? "${var.system_qos_policy} System QoS Policy." : "${local.org_name} System QoS Policy."
  name        = var.system_qos_policy != "" ? "${var.system_qos_policy}" : "${local.org_name}"
  org_moid    = local.org_moid
  tags        = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  classes = [
    {
      admin_state         = var.bronze_admin_state
      bandwidth_percent   = var.bronze_bandwidth
      cos                 = var.bronze_cos
      mtu                 = var.bronze_mtu
      multicast_optimize  = var.bronze_multicast_optimize
      name                = "Bronze"
      packet_drop         = var.bronze_packet_drop
      weight              = var.bronze_weight
    },
    {
      admin_state         = var.silver_admin_state
      bandwidth_percent   = var.silver_bandwidth
      cos                 = var.silver_cos
      mtu                 = var.silver_mtu
      multicast_optimize  = var.silver_multicast_optimize
      name                = "Silver"
      packet_drop         = var.silver_packet_drop
      weight              = var.silver_weight
    },
    {
      admin_state         = var.gold_admin_state
      bandwidth_percent   = var.gold_bandwidth
      cos                 = var.gold_cos
      mtu                 = var.gold_mtu
      multicast_optimize  = var.gold_multicast_optimize
      name                = "Gold"
      packet_drop         = var.gold_packet_drop
      weight              = var.gold_weight
    },
    {
      admin_state         = var.platinum_admin_state
      bandwidth_percent   = var.platinum_bandwidth
      cos                 = var.platinum_cos
      mtu                 = var.platinum_mtu
      multicast_optimize  = var.platinum_multicast_optimize
      name                = "Platinum"
      packet_drop         = var.platinum_packet_drop
      weight              = var.platinum_weight
    },
    {
      admin_state         = var.best_effort_admin_state
      bandwidth_percent   = var.best_effort_bandwidth
      cos                 = 255
      mtu                 = var.best_effort_mtu
      multicast_optimize  = var.best_effort_multicast_optimize
      name                = "Best Effort"
      packet_drop         = null
      weight              = var.best_effort_weight
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = var.fc_bandwidth
      cos                 = 3
      mtu                 = 2240
      multicast_optimize  = null
      name                = "FC"
      packet_drop         = false
      weight              = var.fc_weight
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
  description           = var.switch_control_policy != "" ? "${var.switch_control_policy} Switch Control Policy." : "${local.org_name} Switch Control Policy."
  name                  = var.switch_control_policy != "" ? "${var.switch_control_policy}" : "${local.org_name}"
  mac_aging_option      = var.mac_aging_option
  mac_aging_time        = var.mac_aging_time
  udld_message_interval = var.udld_message_interval
  udld_recovery_action  = var.udld_recovery_action
  vlan_optimization     = var.vlan_optimization
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
  description    = var.dns_policy != "" ? "${var.dns_policy} DNS Policy." : "${local.org_name} DNS Policy."
  dns_servers_v4 = var.dns_servers_v4
  dns_servers_v6 = var.dns_servers_v6
  dynamic_dns    = var.dynamic_dns
  ipv6_enable    = var.ipv6_enable
  name           = var.dns_policy != "" ? "${var.dns_policy}" : "${local.org_name}_domain"
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
  description    = var.ntp_policy != "" ? "${var.ntp_policy} NTP Policy." : "${local.org_name} NTP Policy."
  name           = var.ntp_policy != "" ? "${var.ntp_policy}" : "${local.org_name}_domain"
  ntp_servers  = var.ntp_servers
  org_moid     = local.org_moid
  profile_type = "domain"
  tags         = local.tags
  timezone     = var.timezone
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
  description    = var.snmp_policy != "" ? "${var.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name           = var.snmp_policy != "" ? "${var.snmp_policy}" : "${local.org_name}_domain"
  org_moid        = local.org_moid
  profile_type    = "domain"
  snmp_community  = var.snmp_community
  snmp_traps      = var.snmp_trap_destinations
  snmp_users      = var.snmp_users
  system_contact  = var.system_contact
  system_location = var.system_location
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
  description    = var.syslog_policy != "" ? "${var.syslog_policy} Syslog Policy." : "${local.org_name} Syslog Policy."
  name           = var.syslog_policy != "" ? "${var.syslog_policy}" : "${local.org_name}_domain"
  org_moid        = local.org_moid
  profile_type    = "domain"
  remote_clients  = var.syslog_destinations
  syslog_severity = var.syslog_severity
  tags            = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}

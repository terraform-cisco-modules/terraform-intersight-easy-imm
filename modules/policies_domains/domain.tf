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
  source           = "../../../terraform-intersight-imm/modules/domain_vlan"
  is_native        = true
  multicast_moid   = module.multicast.moid
  vlan             = var.domain_native_vlan
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = var.cluster_name
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
  source           = "../../../terraform-intersight-imm/modules/domain_vlan_list"
  is_native        = false
  multicast_moid   = module.multicast.moid
  vlan_list        = var.domain_vlan_list
  vlan_policy_moid = module.vlan_policy.moid
  vlan_prefix      = var.cluster_name
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
  description = var.vsan_policy != "" ? "${var.vsan_policy} VSAN Policy Fabric A." : "${var.org_name} VSAN Policy Fabric A."
  name        = var.vsan_policy != "" ? "${var.vsan_policy}_a" : "${var.org_name}_a"
  org_moid    = local.org_moid
  profiles    = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags        = local.tags
}

module "vsan_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  description = var.vsan_policy != "" ? "${var.vsan_policy} VSAN Policy Fabric B." : "${var.org_name} VSAN Policy Fabric B."
  name        = var.vsan_policy != "" ? "${var.vsan_policy}_b" : "${var.org_name}_b"
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
  vsan_prefix      = local.cluster_name
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
  vsan_prefix      = local.cluster_name
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
  description  = "${local.org_name} Port Policy A."
  device_model = local.domain_profile_a.model
  name         = "${local.port_policy}_a"
  org_moid     = local.org_moid
  profiles     = var.assign_domain == false ? [] : [local.domain_profile_a.moid]
  tags = local.tags
}

module "port_policy_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  description  = "${local.org_name} Port Policy B."
  device_model = local.domain_profile_b.model
  name         = "${local.port_policy}_b"
  org_moid     = local.org_moid
  profiles     = var.assign_domain == false ? [] : [local.domain_profile_b.moid]
  tags = local.tags
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
  port_list        = "5-12"
  port_policy_moid = module.port_policy_a.moid
  tags             = local.tags
}

module "server_ports_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  port_list        = "5-12"
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
  description = "${local.org_name} Flow Control Policy."
  name        = local.flow_control_policy
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
  description = "${local.org_name} Link Aggregation Policy."
  lacp_rate   = "normal"
  name        = local.link_aggregation_plcy
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
  description = "${local.org_name} Link Control Policy."
  name        = local.link_control_policy
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
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = local.lan_port_channel.id
  lan_uplink_pc_ports   = local.lan_port_channel.list
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_a.moid
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
  flow_control_moid     = [module.flow_control.moid]
  lan_uplink_pc_id      = local.lan_port_channel.id
  lan_uplink_pc_ports   = local.lan_port_channel.list
  link_aggregation_moid = [module.link_aggregation.moid]
  link_control_moid     = [module.link_control.moid]
  port_policy_moid      = module.port_policy_b.moid
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
  san_uplink_pc_id    = local.san_port_channel.id
  san_uplink_pc_ports = local.san_port_channel.list
  san_uplink_speed    = "32Gbps"
  port_policy_moid    = module.port_policy_a.moid
  vsan_id             = local.vsan_fabric_a
  tags                = local.tags
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
  san_uplink_pc_id    = local.san_port_channel.id
  san_uplink_pc_ports = local.san_port_channel.list
  san_uplink_speed    = "32Gbps"
  port_policy_moid    = module.port_policy_b.moid
  vsan_id             = local.vsan_fabric_b
  tags                = local.tags
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
  source      = "../../../terraform-intersight-imm/modules/domain_system_qos"
  description = "${local.org_name} System QoS Policy."
  name        = local.system_qos_policy
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
  source      = "../../../terraform-intersight-imm/modules/domain_system_qos"
  description = "${local.org_name} System QoS Policy."
  name        = local.system_qos_policy
  org_moid    = local.org_moid
  tags        = local.tags
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
  classes = [
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 1
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Bronze"
      packet_drop         = true
      weight              = 7
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 2
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Silver"
      packet_drop         = true
      weight              = 8
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 4
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Gold"
      packet_drop         = true
      weight              = 9
    },
    {
      admin_state         = "Disabled"
      bandwidth_percent   = 0
      cos                 = 5
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Platinum"
      packet_drop         = true
      weight              = 10
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = 50
      cos                 = 255
      mtu                 = 9216
      multicast_optimize  = false
      name                = "Best Effort"
      packet_drop         = null
      weight              = 5
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = 50
      cos                 = 3
      mtu                 = 2240
      multicast_optimize  = null
      name                = "FC"
      packet_drop         = false
      weight              = 5
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
  description           = "${local.org_name} Switch Control Policy."
  name                  = local.switch_control_policy
  mac_aging_option      = "Custom"
  mac_aging_time        = 1200
  udld_message_interval = 15
  udld_recovery_action  = "reset"
  vlan_optimization     = true
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

module "dns_domain" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  description    = "${local.org_name} DNS Policy."
  dns_servers_v4 = regex("empty", local.dns_servers_v4) ? [] : local.dns_servers_v4
  dns_servers_v6 = regex("empty", local.dns_servers_v6) ? [] : local.dns_servers_v6
  name           = "${local.netwrk_connect_policy}_domain"
  org_moid       = local.org_moid
  tags           = local.tags
  profile_type   = "domain"
  profiles = var.assign_domain == false ? [] : [
    local.domain_profile_a.moid,
    local.domain_profile_b.moid
  ]
}


#____________________________________________________________
#
# Intersight NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp_domain" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description  = "${local.org_name} NTP Policy."
  name         = "${local.ntp_policy}_domain"
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

module "snmp_domain" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description     = "${local.org_name} SNMP Policy."
  name            = "${local.snmp_policy}_domain"
  org_moid        = local.org_moid
  profile_type    = "domain"
  snmp_community  = var.snmp_community
  snmp_traps      = local.snmp_trap_destinations
  snmp_users      = var.snmp_users
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

module "syslog_domain" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  description     = "${local.org_name} Syslog Policy."
  name            = "${local.syslog_policy}_domain"
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

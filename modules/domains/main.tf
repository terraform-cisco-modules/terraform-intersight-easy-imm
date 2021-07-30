#_________________________________________________________________________
#
# Intersight UCS Domain Switch Cluster
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

#______________________________________________
#
# Create UCS Domain Profile
#______________________________________________

module "ucs_domain_profile" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster"
  for_each    = local.ucs_domain_profile
  description = each.value.domain_description != "" ? each.value.domain_description : "${each.value.organization} ${each.key} UCS Domain."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Fabric Interconnect A Switch Profile
#______________________________________________

module "ucs_domain_profile_a" {
  depends_on = [
    data.intersight_network_element_summary.fi_a,
    local.org_moids,
    module.ucs_domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profile
  action          = each.value.domain_action
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fi_a[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profile[each.key].moid
  description     = each.value.domain_descr_fi_a != "" ? each.value.domain_descr_fi_a : "${each.value.organization} ${each.key} Fabric Interconnect A Profile."
  name            = "${each.key}-a"
  policy_bucket   = each.value.domain_policy_bucket
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}


#______________________________________________
#
# Create Fabric Interconnect B Switch Profile
#______________________________________________

module "ucs_domain_profile_b" {
  depends_on = [
    data.intersight_network_element_summary.fi_b,
    local.org_moids,
    module.ucs_domain_profile
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profile
  action          = each.value.domain_action
  assigned_switch = var.assign_switches == true ? [data.intersight_network_element_summary.fi_b[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profile[each.key].moid
  description     = each.value.domain_descr_fi_b != "" ? each.value.domain_descr_fi_b : "${each.value.organization} ${each.key} Fabric Interconnect B Profile."
  name            = "${each.key}-b"
  policy_bucket   = each.value.domain_policy_bucket
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight UCS Domain VLAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vlan_policy" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy"
  for_each    = local.ucs_domain_profile
  description = each.value.vlan_description != "" ? each.value.vlan_description : "${each.value.organization} ${each.key} VLAN Policy."
  name        = "${each.key}_vlan"
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
  profiles    = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}

#____________________________________________________________
#
# Intersight VSAN Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vsan_policy_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each        = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  description     = each.value.vsan_a_description != "" ? each.value.vsan_a_description : "${each.value.organization} ${each.key} VSAN Policy Fabric A."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.organization].moid
  profiles        = var.assign_domain == true ? [module.ucs_domain_profile_a[each.key].moid] : []
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}

module "vsan_policy_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each        = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  description     = each.value.vsan_b_description != "" ? each.value.vsan_b_description : "${each.value.organization} ${each.key} VSAN Policy Fabric B."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.organization].moid
  profiles        = var.assign_domain == true ? [module.ucs_domain_profile_b[each.key].moid] : []
  tags            = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_a" {
  depends_on = [
    local.org_moids,
    module.vsan_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each         = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  vsan_policy_moid = module.vsan_policy_a[each.key].moid
  vsan_prefix      = each.value.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.vsan_fabric_a_fcoe != "" ? each.value.vsan_fabric_a_fcoe : each.value.vsan_fabric_a
      vsan_id   = each.value.vsan_fabric_a
    }
  }
}


#______________________________________________
#
# Assign VSAN to VSAN Fabric B Policy
#______________________________________________

module "vsan_b" {
  depends_on = [
    local.org_moids,
    module.vsan_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each         = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  vsan_policy_moid = module.vsan_policy_b[each.key].moid
  vsan_prefix      = each.value.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.vsan_fabric_b_fcoe != "" ? each.value.vsan_fabric_b_fcoe : each.value.vsan_fabric_b
      vsan_id   = each.value.vsan_fabric_b
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
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each     = local.ucs_domain_profile
  description  = each.value.port_policy_a_description != "" ? each.value.port_policy_a_description : "${each.value.organization} ${each.key} Port Policy Fabric A."
  device_model = var.assign_switches == true ? data.intersight_network_element_summary.fi_a[each.key].results.0.model : each.value.ports_device_model
  name         = "${each.key}_ports_a"
  org_moid     = local.org_moids[each.value.organization].moid
  profiles     = var.assign_domain == true ? [module.ucs_domain_profile_a[each.key].moid] : []
  tags         = each.value.tags != [] ? each.value.tags : local.tags
}

module "port_policy_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each     = local.ucs_domain_profile
  description  = each.value.port_policy_b_description != "" ? each.value.port_policy_b_description : "${each.value.organization} ${each.key} Port Policy Fabric B."
  device_model = var.assign_switches == true ? data.intersight_network_element_summary.fi_b[each.key].results.0.model : each.value.ports_device_model
  name         = "${each.key}_ports_b"
  org_moid     = local.org_moids[each.value.organization].moid
  profiles     = var.assign_domain == true ? [module.ucs_domain_profile_b[each.key].moid] : []
  tags         = each.value.tags != [] ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight Port Mode Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "port_mode_a" {
  depends_on = [
    local.org_moids,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each         = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.ports_fc_ports, 1)
  port_id_start    = element(each.value.ports_fc_ports, 0)
  port_policy_moid = module.port_policy_a[each.key].moid
  slot_id          = each.value.ports_fc_slot_id
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

module "port_mode_b" {
  depends_on = [
    local.org_moids,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each         = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.ports_fc_ports, 1)
  port_id_start    = element(each.value.ports_fc_ports, 0)
  port_policy_moid = module.port_policy_b[each.key].moid
  slot_id          = each.value.ports_fc_slot_id
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight Server Port Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "server_ports_a" {
  depends_on = [
    local.org_moids,
    module.port_policy_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.ucs_domain_profile
  port_list        = each.value.ports_servers
  port_policy_moid = module.port_policy_a[each.key].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

module "server_ports_b" {
  depends_on = [
    local.org_moids,
    module.port_policy_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.ucs_domain_profile
  port_list        = each.value.ports_servers
  port_policy_moid = module.port_policy_b[each.key].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
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
    local.org_moids
  ]
  source                     = "terraform-cisco-modules/imm/intersight//modules/domain_flow_control"
  for_each                   = local.ucs_domain_profile
  description                = each.value.flow_control_description != "" ? each.value.flow_control_description : "${each.value.organization} ${each.key} Flow Control Policy."
  name                       = "${each.key}_flow"
  org_moid                   = local.org_moids[each.value.organization].moid
  priority_flow_control_mode = each.value.flow_control_mode
  receive_direction          = each.value.flow_control_receive
  send_direction             = each.value.flow_control_send
  tags                       = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Link Aggregation Policy
#______________________________________________

module "link_aggregation" {
  depends_on = [
    local.org_moids
  ]
  source             = "terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation"
  for_each           = local.ucs_domain_profile
  description        = each.value.link_agg_description != "" ? each.value.link_agg_description : "${each.value.organization} ${each.key} Link Aggregation Policy."
  lacp_rate          = each.value.link_agg_lacp_rate
  name               = "${each.key}_link_agg"
  org_moid           = local.org_moids[each.value.organization].moid
  suspend_individual = each.value.link_agg_suspend_individual
  tags               = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Link Control Policy
#______________________________________________

module "link_control" {
  depends_on = [
    local.org_moids
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_link_control"
  for_each         = local.ucs_domain_profile
  description      = each.value.link_ctrl_description != "" ? each.value.link_ctrl_description : "${each.value.organization} ${each.key} Link Control Policy."
  name             = "${each.key}_link_ctrl"
  org_moid         = local.org_moids[each.value.organization].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
  udld_admin_state = each.value.link_ctrl_udld_admin_state
  udld_mode        = each.value.link_ctrl_udld_mode
}

#______________________________________________
#
# Create Fabric A LAN Port-Channel
#______________________________________________

module "lan_uplink_port_channel_a" {
  depends_on = [
    local.org_moids,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_a
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  for_each              = local.ucs_domain_profile
  breakout_sw_port      = each.value.ports_lan_pc_breakoutswport
  flow_control_moid     = [module.flow_control[each.key].moid]
  lan_uplink_pc_id      = element(each.value.ports_lan_pc_ports, 0)
  lan_uplink_pc_ports   = each.value.ports_lan_pc_ports
  lan_uplink_speed      = each.value.ports_lan_pc_speed
  link_aggregation_moid = [module.link_aggregation[each.key].moid]
  link_control_moid     = [module.link_control[each.key].moid]
  port_policy_moid      = module.port_policy_a[each.key].moid
  slot_id               = each.value.ports_lan_pc_slot_id
  tags                  = each.value.tags != [] ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Fabric B LAN Port-Channel
#______________________________________________

module "lan_uplink_port_channel_b" {
  depends_on = [
    local.org_moids,
    module.flow_control,
    module.link_aggregation,
    module.link_control,
    module.port_policy_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel"
  for_each              = local.ucs_domain_profile
  breakout_sw_port      = each.value.ports_lan_pc_breakoutswport
  flow_control_moid     = [module.flow_control[each.key].moid]
  lan_uplink_pc_id      = element(each.value.ports_lan_pc_ports, 0)
  lan_uplink_pc_ports   = each.value.ports_lan_pc_ports
  lan_uplink_speed      = each.value.ports_lan_pc_speed
  link_aggregation_moid = [module.link_aggregation[each.key].moid]
  link_control_moid     = [module.link_control[each.key].moid]
  port_policy_moid      = module.port_policy_b[each.key].moid
  slot_id               = each.value.ports_lan_pc_slot_id
  tags                  = each.value.tags != [] ? each.value.tags : local.tags
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
    local.org_moids,
    module.port_mode_a,
    module.port_policy_a
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each            = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  breakout_sw_port    = each.value.ports_san_pc_breakoutswport
  fill_pattern        = each.value.ports_san_fill_pattern
  san_uplink_pc_id    = element(each.value.ports_san_pc_ports, 0)
  san_uplink_pc_ports = each.value.ports_san_pc_ports
  san_uplink_speed    = each.value.ports_san_pc_speed
  port_policy_moid    = module.port_policy_a[each.key].moid
  slot_id             = each.value.ports_san_pc_slot_id
  tags                = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_fabric_a
}

#______________________________________________
#
# Create Fabric B SAN Port-Channel
#______________________________________________

module "san_uplink_port_channel_b" {
  depends_on = [
    local.org_moids,
    module.port_mode_b,
    module.port_policy_b
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each            = var.configure_fibre_channel == true ? local.ucs_domain_profile : {}
  breakout_sw_port    = each.value.ports_san_pc_breakoutswport
  fill_pattern        = each.value.ports_san_fill_pattern
  san_uplink_pc_id    = element(each.value.ports_san_pc_ports, 0)
  san_uplink_pc_ports = each.value.ports_san_pc_ports
  san_uplink_speed    = each.value.ports_san_pc_speed
  port_policy_moid    = module.port_policy_b[each.key].moid
  slot_id             = each.value.ports_san_pc_slot_id
  tags                = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_fabric_b
}

#____________________________________________________________
#
# Intersight System QoS Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "system_qos_1" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  for_each    = local.ucs_domain_profile
  description = each.value.qos_description != "" ? each.value.qos_description : "${each.value.organization} ${each.key} System QoS Policy."
  name        = "${each.key}_qos"
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
  profiles    = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
  classes = []
}

module "system_qos_2" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  for_each    = local.ucs_domain_profile
  description = each.value.qos_description != "" ? each.value.qos_description : "${each.value.organization} ${each.key} System QoS Policy."
  name        = "${each.key}_qos"
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
  profiles    = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
  classes = [
    {
      admin_state         = each.value.qos_bronze_admin_state
      bandwidth_percent   = each.value.qos_bronze_bandwidth
      cos                 = each.value.qos_bronze_cos
      mtu                 = each.value.qos_bronze_mtu
      multicast_optimize  = each.value.qos_bronze_multicast_optimize
      name                = "Bronze"
      packet_drop         = each.value.qos_bronze_packet_drop
      weight              = each.value.qos_bronze_weight
    },
    {
      admin_state         = each.value.qos_silver_admin_state
      bandwidth_percent   = each.value.qos_silver_bandwidth
      cos                 = each.value.qos_silver_cos
      mtu                 = each.value.qos_silver_mtu
      multicast_optimize  = each.value.qos_silver_multicast_optimize
      name                = "Silver"
      packet_drop         = each.value.qos_silver_packet_drop
      weight              = each.value.qos_silver_weight
    },
    {
      admin_state         = each.value.qos_gold_admin_state
      bandwidth_percent   = each.value.qos_gold_bandwidth
      cos                 = each.value.qos_gold_cos
      mtu                 = each.value.qos_gold_mtu
      multicast_optimize  = each.value.qos_gold_multicast_optimize
      name                = "Gold"
      packet_drop         = each.value.qos_gold_packet_drop
      weight              = each.value.qos_gold_weight
    },
    {
      admin_state         = each.value.qos_platinum_admin_state
      bandwidth_percent   = each.value.qos_platinum_bandwidth
      cos                 = each.value.qos_platinum_cos
      mtu                 = each.value.qos_platinum_mtu
      multicast_optimize  = each.value.qos_platinum_multicast_optimize
      name                = "Platinum"
      packet_drop         = each.value.qos_platinum_packet_drop
      weight              = each.value.qos_platinum_weight
    },
    {
      admin_state         = each.value.qos_best_effort_admin_state
      bandwidth_percent   = each.value.qos_best_effort_bandwidth
      cos                 = 255
      mtu                 = each.value.qos_best_effort_mtu
      multicast_optimize  = each.value.qos_best_effort_multicast_optimize
      name                = "Best Effort"
      packet_drop         = null
      weight              = each.value.qos_best_effort_weight
    },
    {
      admin_state         = "Enabled"
      bandwidth_percent   = each.value.qos_fc_bandwidth
      cos                 = 3
      mtu                 = 2240
      multicast_optimize  = null
      name                = "FC"
      packet_drop         = false
      weight              = each.value.qos_fc_weight
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
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/domain_switch_control"
  for_each              = local.ucs_domain_profile
  description           = each.value.sw_ctrl_description != "" ? each.value.sw_ctrl_description : "${each.value.organization} ${each.key} Switch Control Policy."
  name                  = "${each.key}_sw_ctrl"
  mac_aging_option      = each.value.sw_ctrl_mac_aging_option
  mac_aging_time        = each.value.sw_ctrl_mac_aging_time
  udld_message_interval = each.value.sw_ctrl_udld_message_interval
  udld_recovery_action  = each.value.sw_ctrl_udld_recovery_action
  vlan_optimization     = each.value.sw_ctrl_vlan_optimization
  org_moid              = local.org_moids[each.value.organization].moid
  tags                  = each.value.tags != [] ? each.value.tags : local.tags
  profiles              = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}


#_______________________________________________________________
#
# Intersight Network Connectivity, (DNS), Policy
# GUI Location: Policies > Create Policy
#_______________________________________________________________

module "dns" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  for_each       = local.ucs_domain_profile
  description    = each.value.dns_description != "" ? each.value.dns_description : "${each.value.organization} ${each.key} DNS Policy."
  dns_servers_v4 = each.value.dns_servers_v4
  dns_servers_v6 = each.value.dns_servers_v6
  dynamic_dns    = each.value.dns_dynamic
  ipv6_enable    = each.value.dns_ipv6_enable
  name           = "${each.key}_dns"
  org_moid       = local.org_moids[each.value.organization].moid
  tags           = each.value.tags != [] ? each.value.tags : local.tags
  profile_type   = "domain"
  update_domain  = each.value.dns_update_domain
  profiles       = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}


#____________________________________________________________
#
# Intersight NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  for_each     = local.ucs_domain_profile
  description  = each.value.ntp_description != "" ? each.value.ntp_description : "${each.value.organization} ${each.key} NTP Policy."
  name         = "${each.key}_ntp"
  ntp_servers  = each.value.ntp_servers
  org_moid     = local.org_moids[each.value.organization].moid
  profile_type = "domain"
  tags         = each.value.tags != [] ? each.value.tags : local.tags
  timezone     = each.value.ntp_timezone
  profiles     = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}


#____________________________________________________________
#
# Intersight SNMP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "snmp_community" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source                  = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  for_each                = var.configure_snmp == true && var.configure_snmp_type == "snmp_community" ? local.ucs_domain_profile : {}
  description             = each.value.snmp_description != "" ? each.value.snmp_description : "${each.value.organization} ${each.key} SNMP Policy."
  name                    = "${each.key}_snmp"
  org_moid                = local.org_moids[each.value.organization].moid
  profile_type            = "domain"
  snmp_community          = var.snmp_community
  snmp_traps              = each.value.snmp_trap_destinations
  system_contact          = each.value.snmp_system_contact
  system_location         = each.value.snmp_system_location
  tags                    = each.value.tags != [] ? each.value.tags : local.tags
  trap_community          = var.snmp_trap_community
  profiles                = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}

module "snmp_1_user" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source                  = "terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_user"
  for_each                = var.configure_snmp == true && var.configure_snmp_type == "snmp_1_user" ? local.ucs_domain_profile : {}
  description             = each.value.snmp_description != "" ? each.value.snmp_description : "${each.value.organization} ${each.key} SNMP Policy."
  name                    = "${each.key}_snmp"
  org_moid                = local.org_moids[each.value.organization].moid
  profile_type            = "domain"
  snmp_traps              = each.value.snmp_trap_destinations
  system_contact          = each.value.snmp_system_contact
  system_location         = each.value.snmp_system_location
  tags                    = each.value.tags != [] ? each.value.tags : local.tags
  user_1_auth_password    = var.snmp_user_1_auth_password
  user_1_auth_type        = each.value.snmp_user_1_auth_type
  user_1_name             = each.value.snmp_user_1_name
  user_1_privacy_password = var.snmp_user_1_privacy_password
  user_1_security_level   = each.value.snmp_user_1_security_level
  profiles                = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}

module "snmp_2_users" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source                  = "terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users"
  for_each                = var.configure_snmp == true && var.configure_snmp_type == "snmp_2_users" ? local.ucs_domain_profile : {}
  description             = each.value.snmp_description != "" ? each.value.snmp_description : "${each.value.organization} ${each.key} SNMP Policy."
  name                    = "${each.key}_snmp"
  org_moid                = local.org_moids[each.value.organization].moid
  profile_type            = "domain"
  snmp_traps              = each.value.snmp_trap_destinations
  system_contact          = each.value.snmp_system_contact
  system_location         = each.value.snmp_system_location
  tags                    = each.value.tags != [] ? each.value.tags : local.tags
  user_1_auth_password    = var.snmp_user_1_auth_password
  user_1_auth_type        = each.value.snmp_user_1_auth_type
  user_1_name             = each.value.snmp_user_1_name
  user_1_privacy_password = var.snmp_user_1_privacy_password
  user_1_security_level   = each.value.snmp_user_1_security_level
  user_2_auth_password    = var.snmp_user_2_auth_password
  user_2_auth_type        = each.value.snmp_user_2_auth_type
  user_2_name             = each.value.snmp_user_2_name
  user_2_privacy_password = var.snmp_user_2_privacy_password
  user_2_security_level   = each.value.snmp_user_2_security_level
  profiles                = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}


#____________________________________________________________
#
# Intersight Syslog Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "syslog" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profile_a,
    module.ucs_domain_profile_b
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  for_each        = var.configure_syslog == true ? local.ucs_domain_profile : {}
  description     = each.value.syslog_description != "" ? each.value.syslog_description : "${each.value.organization} ${each.key} Syslog Policy."
  name            = "${each.key}_syslog"
  org_moid        = local.org_moids[each.value.organization].moid
  profile_type    = "domain"
  remote_clients  = each.value.syslog_destinations
  syslog_severity = each.value.syslog_severity
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  profiles    = var.assign_domain == true ? [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ] : []
}

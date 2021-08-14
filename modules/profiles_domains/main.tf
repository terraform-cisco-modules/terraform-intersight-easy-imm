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
  assigned_switch = each.value.assign_switches == true ? [data.intersight_network_element_summary.fi_a[each.key].results.0.moid] : []
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
  assigned_switch = each.value.assign_switches == true ? [data.intersight_network_element_summary.fi_b[each.key].results.0.moid] : []
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
  profiles = [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ]
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for configure, fibre_channel in local.ucs_domain_profile : configure => fibre_channel
    if fibre_channel.config_fibre_channel == true
  }
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
  profiles = [
    module.ucs_domain_profile_a[each.key].moid,
    module.ucs_domain_profile_b[each.key].moid
  ]
}

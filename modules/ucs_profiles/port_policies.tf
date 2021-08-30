#_________________________________________________________________________
#
# Port Policies
# GUI Location: Configure > Policy > Create Policy > Port > Start
#_________________________________________________________________________

module "port_policies_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_switches_a,
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/port_policies"
  for_each     = local.ucs_domain_profiles
  description  = each.value.profile.port_policy_descr_a != "" ? each.value.profile.port_policy_descr_a : "${each.key} Port Policy Fabric A."
  device_model = each.value.profile.assign_switches == true ? data.intersight_network_element_summary.fi_a[each.key].results.0.model : each.value.profile.device_model
  name         = "${each.key}_ppa"
  org_moid     = local.org_moids[each.value.profile.organization].moid
  tags         = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  profiles = [
    module.ucs_domain_switches_a[each.key].moid,
  ]
}

module "port_policies_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_switches_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/port_policies"
  for_each     = local.ucs_domain_profiles
  description  = each.value.profile.port_policy_descr_b != "" ? each.value.profile.port_policy_descr_b : "${each.key} Port Policy Fabric A."
  device_model = each.value.profile.assign_switches == true ? data.intersight_network_element_summary.fi_b[each.key].results.0.model : each.value.profile.device_model
  name         = "${each.key}_ppb"
  org_moid     = local.org_moids[each.value.profile.organization].moid
  tags         = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  profiles = [
    module.ucs_domain_switches_b[each.key].moid
  ]
}


#____________________________________________________________
#
# Intersight Port Mode Policy
# GUI Location: Policy > Create Policy
#____________________________________________________________

module "port_mode_a" {
  depends_on = [
    local.org_moids,
    module.policies_ports_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/port_mode"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.profile.fc_ports, 1)
  port_id_start    = element(each.value.profile.fc_ports, 0)
  port_policy_moid = module.port_policies_a[each.key].moid
  slot_id          = each.value.profile.fc_slot_id
  tags             = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}

module "port_mode_b" {
  depends_on = [
    local.org_moids,
    module.port_policies_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/port_mode"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.profile.fc_ports, 1)
  port_id_start    = element(each.value.profile.fc_ports, 0)
  port_policy_moid = module.port_policies_b[each.key].moid
  slot_id          = each.value.profile.fc_slot_id
  tags             = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}


#____________________________________________________________
#
# Intersight Server Port Policy
# GUI Location: Policy > Create Policy
#____________________________________________________________

module "port_server_ports_a" {
  depends_on = [
    local.org_moids,
    module.port_policies_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/port_server_ports"
  for_each         = local.ucs_domain_profiles
  port_list        = each.value.profile.server_ports
  port_policy_moid = module.port_policies_a[each.key].moid
  tags             = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}

module "port_server_ports_b" {
  depends_on = [
    local.org_moids,
    module.port_policies_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/port_server_ports"
  for_each         = local.ucs_domain_profiles
  port_list        = each.value.profile.server_ports
  port_policy_moid = module.port_policies_b[each.key].moid
  tags             = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}


#____________________________________________________________
#
# Intersight SAN Port-Channel Policy
# GUI Location: Policy > Create Policy
#____________________________________________________________

#______________________________________________
#
# Create Fabric A SAN Port-Channel
#______________________________________________

module "port_fc_uplink_port_channel_a" {
  depends_on = [
    local.org_moids,
    module.port_policies_a,
    module.port_mode_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/port_fc_uplink_port_channel"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  breakout_sw_port    = each.value.profile.san_pc_breakoutswport
  fill_pattern        = each.value.profile.san_fill_pattern
  san_uplink_pc_id    = element(each.value.profile.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.profile.san_pc_ports
  san_uplink_speed    = each.value.profile.san_pc_speed
  port_policy_moid    = module.port_policies_a[each.key].moid
  slot_id             = each.value.profile.san_pc_slot_id
  tags                = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  vsan_id             = each.value.profile.vsan_a
}

#______________________________________________
#
# Create Fabric B SAN Port-Channel
#______________________________________________

module "port_fc_uplink_port_channel_b" {
  depends_on = [
    local.org_moids,
    module.port_policies_b,
    module.port_mode_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/port_fc_uplink_port_channel"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.profile.san_pc_ports != []
  }
  breakout_sw_port    = each.value.profile.san_pc_breakoutswport
  fill_pattern        = each.value.profile.san_fill_pattern
  san_uplink_pc_id    = element(each.value.profile.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.profile.san_pc_ports
  san_uplink_speed    = each.value.profile.san_pc_speed
  port_policy_moid    = module.policies_ports_b[each.key].moid
  slot_id             = each.value.profile.san_pc_slot_id
  tags                = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  vsan_id             = each.value.profile.vsan_b
}

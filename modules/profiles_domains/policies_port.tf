#_________________________________________________________________________
#
# Intersight Port Policies Variables
# GUI Location: Configure > Policies > Create Policy > Port > Start
#_________________________________________________________________________

variable "policy_ports" {
  default = {
    default = {
      description_a         = ""
      description_b         = ""
      device_model          = "UCS-FI-6454"
      fc_ports              = [1, 4]
      fc_slot_id            = 1
      organization          = "default"
      san_fill_pattern      = "Arbff"
      san_pc_breakoutswport = 0
      san_pc_ports          = [1, 2]
      san_pc_slot_id        = 1
      san_pc_speed          = "16Gbps"
      server_ports          = "5-18"
      tags                  = []
      vsan_a                = 100
      vsan_a_description    = ""
      vsan_a_fcoe           = null
      vsan_b                = 200
      vsan_b_description    = ""
      vsan_b_fcoe           = null
      vsan_enable_trunking  = false
      vsan_prefix           = ""
    }
  }
  description = <<-EOT
  key - Name of the Port Policy.
  * description_a - Description to Assign to Port Policy A.
  * description_b - Description to Assign to Port Policy B.
  * device_model - This field specifies the device model that this Port Policy is being configured for.
    - UCS-FI-6454 - (Default) - The standard 4th generation UCS Fabric Interconnect with 54 ports.
    - UCS-FI-64108 - The expanded 4th generation UCS Fabric Interconnect with 108 ports.
    - unknown - Unknown device type, usage is TBD.
  * fc_ports - This is a the Starting and Ending Ports to assign as Fibre-Channel Uplink Ports.  Default is [1, 4].  To not configure Fibre-Channel set the list to [].
  * fc_slot_id - Slot Identifier of the switch.  Default is 1.
  * organization - Name of the Intersight Organization to assign this Policy to.  Default is default.
    - https://intersight.com/an/settings/organizations/
  * san_fill_pattern - Fill pattern to differentiate the configs in NPIV.
    - Arbff - (Default) Fc Fill Pattern type Arbff.
    - Idle - Fc Fill Pattern type Idle.
  * san_pc_breakoutswport - Breakout port Identifier of the Switch Interface.  When a port is not configured as a breakout port, the aggregatePortId is set to 0, and unused.  When a port is configured as a breakout port, the 'aggregatePortId' port number as labeled on the equipment, e.g. the id of the port on the switch.  Default is 0.
  * san_pc_ports - List of Ports to Assign to the SAN Port-Channel Policy.  Default is [1, 2].
  * san_pc_slot_id - Slot Identifier of the Switch/FEX/Chassis Interface.  Default is 1.
  * san_pc_speed - Admin configured speed for the port.
    - Auto - Admin configurable speed Auto.
    - 8Gbps - Admin configurable speed 8Gbps.
    - 16Gbps - (Defualt) Admin configurable speed 16Gbps.
    - 32Gbps - Admin configurable speed 32Gbps.
  * server_ports - List of Ports to assign to the Server Port Policy.  Default is "5-18".
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * vsan_a - VSAN ID for Fabric A.  Default is 100.
  * vsan_a_description - Description to Assign to VSAN Policy A.
  * vsan_a_fcoe - VLAN ID for the FCOE VLAN.  If using the same ID as the VSAN ID set this to null.
  * vsan_b - VSAN ID for Fabric B.  Default is 200.
  * vsan_b_description - Description to Assign to VSAN Policy B.
  * vsan_b_fcoe - VLAN ID for the FCOE VLAN.  If using the same ID as the VSAN ID set this to null.
  * vsan_enable_trunking - Enable or Disable Trunking on all of configured FC uplink ports.  Default is false.
  * vsan_prefix - Prefix Name for VSANs.  Default is none.
  EOT
  type = map(object(
    {
      description_a         = optional(string)
      description_b         = optional(string)
      device_model          = optional(string)
      fc_ports              = optional(list(string))
      fc_slot_id            = optional(number)
      organization          = optional(string)
      san_fill_pattern      = optional(string)
      san_pc_breakoutswport = optional(number)
      san_pc_ports          = optional(list(string))
      san_pc_slot_id        = optional(number)
      san_pc_speed          = optional(string)
      server_ports          = optional(string)
      tags                  = optional(list(map(string)))
      vsan_a                = optional(number)
      vsan_a_description    = optional(string)
      vsan_a_fcoe           = optional(number)
      vsan_b                = optional(number)
      vsan_b_description    = optional(string)
      vsan_b_fcoe           = optional(number)
      vsan_enable_trunking  = optional(bool)
      vsan_prefix           = optional(string)
    }
  ))
}


#____________________________________________________________
#
# Intersight VSAN Policies
# GUI Location: Policies > Create Policy > VSAN
#____________________________________________________________

module "policy_vsan_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  description     = each.value.vsan_a_description != "" ? each.value.vsan_a_description : "${each.key} VSAN Policy Fabric A."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    distinct([module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid])
    if local.ucs_domain_profiles[s].policy_ports == each.key
  ])
}

module "policy_vsan_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  description     = each.value.vsan_b_description != "" ? each.value.vsan_b_description : "${each.value.organization} ${each.key} VSAN Policy Fabric B."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = each.value.tags != [] ? each.value.tags : local.tags
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    distinct([module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid])
    if local.ucs_domain_profiles[s].policy_ports == each.key
  ])
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_a" {
  depends_on = [
    local.org_moids,
    module.policy_vsan_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  vsan_policy_moid = module.policy_vsan_a[each.key].moid
  vsan_prefix      = each.value.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.vsan_a_fcoe != null ? each.value.vsan_a_fcoe : each.value.vsan_a
      vsan_id   = each.value.vsan_a
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
    module.policy_vsan_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  vsan_policy_moid = module.policy_vsan_b[each.key].moid
  vsan_prefix      = each.value.organization
  vsan_list = {
    vsan = {
      fcoe_vlan = each.value.vsan_b_fcoe != null ? each.value.vsan_b_fcoe : each.value.vsan_b
      vsan_id   = each.value.vsan_b
    }
  }
}
#_________________________________________________________________________
#
# Port Policies
# GUI Location: Configure > Policies > Create Policy > Port > Start
#_________________________________________________________________________

module "policy_ports_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each    = local.policy_ports
  description = each.value.description_a != "" ? each.value.description_a : "${each.key} Port Policy Fabric A."
  # device_model = each.value.assign_switches == true ? data.intersight_network_element_summary.fi_a[each.key].results.0.model : each.value.device_model
  name     = "${each.key}_A"
  org_moid = local.org_moids[each.value.organization].moid
  tags     = each.value.tags != [] ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_domain_profiles)) :
    module.ucs_domain_profiles_a[s].moid &&
    module.ucs_domain_profiles_b[s].moid
    if local.ucs_domain_profiles[s].policy_ports == each.key
  ]
}

module "policy_ports_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each    = local.policy_ports
  description = each.value.description_b != "" ? each.value.description_b : "${each.key} Port Policy Fabric A."
  # device_model = each.value.assign_switches == true ? data.intersight_network_element_summary.fi_b[each.key].results.0.model : each.value.device_model
  name     = "${each.key}_B"
  org_moid = local.org_moids[each.value.organization].moid
  tags     = each.value.tags != [] ? each.value.tags : local.tags
  profiles = [
    for s in sort(keys(local.ucs_domain_profiles)) :
    module.ucs_domain_profiles_a[s].moid &&
    module.ucs_domain_profiles_b[s].moid
    if local.ucs_domain_profiles[s].policy_ports == each.key
  ]
}


#____________________________________________________________
#
# Intersight Port Mode Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "policy_port_mode_a" {
  depends_on = [
    local.org_moids,
    module.policy_ports_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.fc_ports, 1)
  port_id_start    = element(each.value.fc_ports, 0)
  port_policy_moid = module.policy_ports_a[each.key].moid
  slot_id          = each.value.fc_slot_id
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

module "policy_port_mode_b" {
  depends_on = [
    local.org_moids,
    module.policy_ports_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.fc_ports, 1)
  port_id_start    = element(each.value.fc_ports, 0)
  port_policy_moid = module.policy_ports_b[each.key].moid
  slot_id          = each.value.fc_slot_id
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
    module.policy_ports_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.policy_ports
  port_list        = each.value.server_ports
  port_policy_moid = module.policy_ports_a[each.key].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
}

module "server_ports_b" {
  depends_on = [
    local.org_moids,
    module.policy_ports_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.policy_ports
  port_list        = each.value.server_ports
  port_policy_moid = module.policy_ports_b[each.key].moid
  tags             = each.value.tags != [] ? each.value.tags : local.tags
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
    module.policy_ports_a,
    module.policy_port_mode_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  breakout_sw_port    = each.value.san_pc_breakoutswport
  fill_pattern        = each.value.san_fill_pattern
  san_uplink_pc_id    = element(each.value.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.san_pc_ports
  san_uplink_speed    = each.value.san_pc_speed
  port_policy_moid    = module.policy_ports_a[each.key].moid
  slot_id             = each.value.san_pc_slot_id
  tags                = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_a
}

#______________________________________________
#
# Create Fabric B SAN Port-Channel
#______________________________________________

module "san_uplink_port_channel_b" {
  depends_on = [
    local.org_moids,
    module.policy_ports_b,
    module.policy_port_mode_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for k, v in local.policy_ports : k => v
    if v.san_pc_ports != []
  }
  breakout_sw_port    = each.value.san_pc_breakoutswport
  fill_pattern        = each.value.san_fill_pattern
  san_uplink_pc_id    = element(each.value.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.san_pc_ports
  san_uplink_speed    = each.value.san_pc_speed
  port_policy_moid    = module.policy_ports_b[each.key].moid
  slot_id             = each.value.san_pc_slot_id
  tags                = each.value.tags != [] ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_b
}

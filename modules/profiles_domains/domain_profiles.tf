#_________________________________________________________________________
#
# Intersight UCS Domain Profile Variables
# GUI Location: Configure > Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

variable "ucs_domain_profiles" {
  default = {
    default = {
      action                        = "No-op"
      assign_switches               = false
      device_model                  = "UCS-FI-6454"
      domain_description            = ""
      domain_descr_fi_a             = ""
      domain_descr_fi_b             = ""
      domain_serial_a               = ""
      domain_serial_b               = ""
      fc_ports                      = [1, 4]
      fc_slot_id                    = 1
      organization                  = "default"
      policies_network_connectivity = ""
      policies_ntp                  = ""
      policies_snmp                 = ""
      policies_switch_control       = ""
      policies_syslog               = ""
      policies_system_qos           = ""
      port_policy_descr_a           = ""
      port_policy_descr_b           = ""
      san_fill_pattern              = "Arbff"
      san_pc_breakoutswport         = 0
      san_pc_ports                  = [1, 2]
      san_pc_slot_id                = 1
      san_pc_speed                  = "16Gbps"
      server_ports                  = "5-18"
      tags                          = []
      vsan_a                        = 100
      vsan_a_description            = ""
      vsan_a_fcoe                   = null
      vsan_b                        = 200
      vsan_b_description            = ""
      vsan_b_fcoe                   = null
      vsan_enable_trunking          = false
      vsan_prefix                   = ""
    }
  }
  description = <<-EOT
  Intersight UCS Domain Profile Variable Map.
  * action - Action to Perform on the Chassis Profile Assignment.  Options are:
    - Deploy
    - No-op
    - Unassign
  * assign_switches - Flag to define if the physical FI's should be assigned to the policy.  Default is false.
  * device_model - This field specifies the device model that this Port Policy is being configured for.
    - UCS-FI-6454 - (Default) - The standard 4th generation UCS Fabric Interconnect with 54 ports.
    - UCS-FI-64108 - The expanded 4th generation UCS Fabric Interconnect with 108 ports.
    - unknown - Unknown device type, usage is TBD.
  * domain_description - Description to Assign to the Profile.
  * domain_descr_fi_a - Description to Assign to the Profile Fabric Interconnect A.
  * domain_descr_fi_b - Description to Assign to the Profile Fabric Interconnect B.
  * domain_serial_a - Serial Number for Fabric Interconnect A.

  * domain_serial_b - Serial Number for Fabric Interconnect B.
  * fc_ports - This is a the Starting and Ending Ports to assign as Fibre-Channel Uplink Ports.  Default is [1, 4].  To not configure Fibre-Channel set the list to [].
  * fc_slot_id - Slot Identifier of the switch.  Default is 1.
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  * policies_network_connectivity - Name of the Network Control Policy to assign to the UCS Domain Profile.
  * policies_ntp - Name of the NTP Policy to assign to the UCS Domain Profile.
  * policies_snmp - Name of the SNMP Policy to assign to the UCS Domain Profile.
  * policies_switch_control - Name of the Switch Control Policy to assign to the UCS Domain Profile.
  * policies_syslog - Name of the Syslog Policy to assign to the UCS Domain Profile.
  * policies_system_qos - Name of the System QoS Policy to assign to the UCS Domain Profile.
  * port_policy_descr_a - Description to Assign to Port Policy A.
  * port_policy_descr_b - Description to Assign to Port Policy B.
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
      action                        = optional(string)
      assign_switches               = optional(bool)
      device_model                  = optional(string)
      domain_description            = optional(string)
      domain_descr_fi_a             = optional(string)
      domain_descr_fi_b             = optional(string)
      domain_serial_a               = optional(string)
      domain_serial_b               = optional(string)
      fc_ports                      = optional(list(string))
      fc_slot_id                    = optional(number)
      organization                  = optional(string)
      policies_network_connectivity = optional(string)
      policies_ntp                  = optional(string)
      policies_snmp                 = optional(string)
      policies_switch_control       = optional(string)
      policies_syslog               = optional(string)
      policies_system_qos           = optional(string)
      port_policy_descr_a           = optional(string)
      port_policy_descr_b           = optional(string)
      san_fill_pattern              = optional(string)
      san_pc_breakoutswport         = optional(number)
      san_pc_ports                  = optional(list(string))
      san_pc_slot_id                = optional(number)
      san_pc_speed                  = optional(string)
      server_ports                  = optional(string)
      tags                          = optional(list(map(string)))
      vsan_a                        = optional(number)
      vsan_a_description            = optional(string)
      vsan_a_fcoe                   = optional(number)
      vsan_b                        = optional(number)
      vsan_b_description            = optional(string)
      vsan_b_fcoe                   = optional(number)
      vsan_enable_trunking          = optional(bool)
      vsan_prefix                   = optional(string)
    }
  ))
}

variable "policies_ports" {
  default = {
    default = {
      organization = "default"
      tags         = []
    }
  }
  description = <<-EOT
  key - Name of the Port Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.  Default is default.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      organization = optional(string)
      tags         = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Intersight UCS Domain Profile
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

module "ucs_domain_profiles" {
  depends_on = [
    local.org_moids
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster"
  for_each    = local.ucs_domain_profiles
  description = each.value.domain_description != "" ? each.value.domain_description : "${each.key} UCS Domain."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

#______________________________________________
#
# Create Fabric Interconnect A Switch Profile
#______________________________________________

module "ucs_domain_profiles_a" {
  depends_on = [
    data.intersight_network_element_summary.fi_a,
    local.org_moids,
    module.ucs_domain_profiles
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profiles
  action          = each.value.action
  assigned_switch = each.value.assign_switches == true ? [data.intersight_network_element_summary.fi_a[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profiles[each.key].moid
  description     = each.value.domain_descr_fi_a != "" ? each.value.domain_descr_fi_a : "${each.key} Fabric Interconnect A Profile."
  name            = "${each.key}-a"
  # policies_bucket   = each.value.policies_bucket
  tags = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


#______________________________________________
#
# Create Fabric Interconnect B Switch Profile
#______________________________________________

module "ucs_domain_profiles_b" {
  depends_on = [
    data.intersight_network_element_summary.fi_b,
    local.org_moids,
    module.ucs_domain_profiles
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/domain_profile_switch"
  for_each        = local.ucs_domain_profiles
  action          = each.value.action
  assigned_switch = each.value.assign_switches == true ? [data.intersight_network_element_summary.fi_b[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profiles[each.key].moid
  description     = each.value.domain_descr_fi_b != "" ? each.value.domain_descr_fi_b : "${each.key} Fabric Interconnect B Profile."
  name            = "${each.key}-b"
  # policies_bucket   = each.value.policies_bucket
  tags = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight VSAN Policies
# GUI Location: Configure > Policy > Create Policy > VSAN
#____________________________________________________________

module "policies_vsan_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  description     = each.value.vsan_a_description != "" ? each.value.vsan_a_description : "${each.key} VSAN Policy Fabric A."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_a"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles        = [module.ucs_domain_profiles_a[each.key].moid]
}

module "policies_vsan_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  description     = each.value.vsan_b_description != "" ? each.value.vsan_b_description : "${each.value.organization} ${each.key} VSAN Policy Fabric B."
  enable_trunking = each.value.vsan_enable_trunking
  name            = "${each.key}_vsan_b"
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles        = [module.ucs_domain_profiles_b[each.key].moid]
}

#______________________________________________
#
# Assign VSAN to VSAN Fabric A Policy
#______________________________________________

module "vsan_a" {
  depends_on = [
    local.org_moids,
    module.policies_vsan_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  vsan_policy_moid = module.policies_vsan_a[each.key].moid
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
    module.policies_vsan_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_vsan"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  vsan_policy_moid = module.policies_vsan_b[each.key].moid
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
# GUI Location: Configure > Policy > Create Policy > Port > Start
#_________________________________________________________________________

module "policies_ports_a" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each     = local.ucs_domain_profiles
  description  = each.value.port_policy_descr_a != "" ? each.value.port_policy_descr_a : "${each.key} Port Policy Fabric A."
  device_model = each.value.assign_switches == true ? data.intersight_network_element_summary.fi_a[each.key].results.0.model : each.value.device_model
  name         = "${each.key}_ppa"
  org_moid     = local.org_moids[each.value.organization].moid
  tags         = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    module.ucs_domain_profiles_a[each.key].moid,
    module.ucs_domain_profiles_b[each.key].moid
  ]
}

module "policies_ports_b" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/domain_port_policy"
  for_each     = local.ucs_domain_profiles
  description  = each.value.port_policy_descr_b != "" ? each.value.port_policy_descr_b : "${each.key} Port Policy Fabric A."
  device_model = each.value.assign_switches == true ? data.intersight_network_element_summary.fi_b[each.key].results.0.model : each.value.device_model
  name         = "${each.key}_ppb"
  org_moid     = local.org_moids[each.value.organization].moid
  tags         = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = [
    module.ucs_domain_profiles_a[each.key].moid,
    module.ucs_domain_profiles_b[each.key].moid
  ]
}


#____________________________________________________________
#
# Intersight Port Mode Policy
# GUI Location: Policy > Create Policy
#____________________________________________________________

module "policies_port_mode_a" {
  depends_on = [
    local.org_moids,
    module.policies_ports_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.fc_ports, 1)
  port_id_start    = element(each.value.fc_ports, 0)
  port_policy_moid = module.policies_ports_a[each.key].moid
  slot_id          = each.value.fc_slot_id
  tags             = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

module "policies_port_mode_b" {
  depends_on = [
    local.org_moids,
    module.policies_ports_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_port_mode"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.fc_ports != []
  }
  custom_mode      = "FibreChannel"
  port_id_end      = element(each.value.fc_ports, 1)
  port_id_start    = element(each.value.fc_ports, 0)
  port_policy_moid = module.policies_ports_b[each.key].moid
  slot_id          = each.value.fc_slot_id
  tags             = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight Server Port Policy
# GUI Location: Policy > Create Policy
#____________________________________________________________

module "server_ports_a" {
  depends_on = [
    local.org_moids,
    module.policies_ports_a
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.ucs_domain_profiles
  port_list        = each.value.server_ports
  port_policy_moid = module.policies_ports_a[each.key].moid
  tags             = length(each.value.tags) > 0 ? each.value.tags : local.tags
}

module "server_ports_b" {
  depends_on = [
    local.org_moids,
    module.policies_ports_b
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/domain_port_server"
  for_each         = local.ucs_domain_profiles
  port_list        = each.value.server_ports
  port_policy_moid = module.policies_ports_b[each.key].moid
  tags             = length(each.value.tags) > 0 ? each.value.tags : local.tags
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

module "san_uplink_port_channel_a" {
  depends_on = [
    local.org_moids,
    module.policies_ports_a,
    module.policies_port_mode_a
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  breakout_sw_port    = each.value.san_pc_breakoutswport
  fill_pattern        = each.value.san_fill_pattern
  san_uplink_pc_id    = element(each.value.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.san_pc_ports
  san_uplink_speed    = each.value.san_pc_speed
  port_policy_moid    = module.policies_ports_a[each.key].moid
  slot_id             = each.value.san_pc_slot_id
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_a
}

#______________________________________________
#
# Create Fabric B SAN Port-Channel
#______________________________________________

module "san_uplink_port_channel_b" {
  depends_on = [
    local.org_moids,
    module.policies_ports_b,
    module.policies_port_mode_b
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel"
  for_each = {
    for k, v in local.ucs_domain_profiles : k => v
    if v.san_pc_ports != []
  }
  breakout_sw_port    = each.value.san_pc_breakoutswport
  fill_pattern        = each.value.san_fill_pattern
  san_uplink_pc_id    = element(each.value.san_pc_ports, 0)
  san_uplink_pc_ports = each.value.san_pc_ports
  san_uplink_speed    = each.value.san_pc_speed
  port_policy_moid    = module.policies_ports_b[each.key].moid
  slot_id             = each.value.san_pc_slot_id
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  vsan_id             = each.value.vsan_b
}

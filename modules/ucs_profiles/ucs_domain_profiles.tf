#_________________________________________________________________________
#
# Intersight UCS Domain Profile Variables
# GUI Location: Configure > Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

variable "ucs_domain_templates" {
  default = {
    default = {
      fc_ports                      = [1, 4]
      fc_slot_id                    = 1
      network_connectivity_policies = ""
      ntp_policies                  = ""
      organization                  = "default"
      san_fill_pattern              = "Arbff"
      san_pc_breakoutswport         = 0
      san_pc_ports                  = [1, 2]
      san_pc_slot_id                = 1
      san_pc_speed                  = "16Gbps"
      snmp_policies                 = ""
      switch_control_policies       = ""
      syslog_policies               = ""
      system_qos_policies           = ""
      vlan_policies                 = ""
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
  * fc_ports - This is a the Starting and Ending Ports to assign as Fibre-Channel Uplink Ports.  Default is [1, 4].  To not configure Fibre-Channel set the list to [].
  * fc_slot_id - Slot Identifier of the switch.  Default is 1.
  * network_connectivity_policies - Name of the Network Control Policy to assign to the UCS Domain Profile.
  * ntp_policies - Name of the NTP Policy to assign to the UCS Domain Profile.
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
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
  * snmp_policies - Name of the SNMP Policy to assign to the UCS Domain Profile.
  * switch_control_policies - Name of the Switch Control Policy to assign to the UCS Domain Profile.
  * syslog_policies - Name of the Syslog Policy to assign to the UCS Domain Profile.
  * system_qos_policies - Name of the System QoS Policy to assign to the UCS Domain Profile.
  * vlan_policies = Name of the VLAN Policy to assign tot he UCS Domain Profile.
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
      fc_ports                      = optional(list(string))
      fc_slot_id                    = optional(number)
      network_connectivity_policies = optional(string)
      ntp_policies                  = optional(string)
      organization                  = optional(string)
      san_fill_pattern              = optional(string)
      san_pc_breakoutswport         = optional(number)
      san_pc_ports                  = optional(list(string))
      san_pc_slot_id                = optional(number)
      san_pc_speed                  = optional(string)
      snmp_policies                 = optional(string)
      switch_control_policies       = optional(string)
      syslog_policies               = optional(string)
      system_qos_policies           = optional(string)
      vlan_policies                 = optional(string)
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

variable "ucs_domain_profiles" {
  default = {
    default = {
      action              = "No-op"
      assign_switches     = false
      device_model        = "UCS-FI-6454"
      domain_description  = ""
      domain_descr_fi_a   = ""
      domain_descr_fi_b   = ""
      domain_serial_a     = ""
      domain_serial_b     = ""
      port_policy_descr_a = ""
      port_policy_descr_b = ""
      server_ports        = "5-18"
      src_template        = "**REQUIRED**"
      tags                = []
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
  * port_policy_descr_a - Description to Assign to Port Policy A.
  * port_policy_descr_b - Description to Assign to Port Policy B.
  * server_ports - List of Ports to assign to the Server Port Policy.  Default is "5-18".
  * src_template - Name of the Domain Template (Locally Significant to Terraform), to assign values to the domain from.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      action              = optional(string)
      assign_switches     = optional(bool)
      device_model        = optional(string)
      domain_description  = optional(string)
      domain_descr_fi_a   = optional(string)
      domain_descr_fi_b   = optional(string)
      domain_serial_a     = optional(string)
      domain_serial_b     = optional(string)
      port_policy_descr_a = optional(string)
      port_policy_descr_b = optional(string)
      server_ports        = optional(string)
      src_template        = string
      tags                = optional(list(map(string)))
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
  source      = "terraform-cisco-modules/imm/intersight//modules/ucs_domain_profiles"
  for_each    = local.ucs_domain_profiles
  description = each.value.profile.domain_description != "" ? each.value.profile.domain_description : "${each.key} UCS Domain."
  name        = each.key
  org_moid    = local.org_moids[each.value.profile.organization].moid
  tags        = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}

#______________________________________________
#
# Create Fabric Interconnect A Switch Profile
#______________________________________________

module "ucs_domain_switches_a" {
  depends_on = [
    data.intersight_network_element_summary.fi_a,
    local.org_moids,
    module.ucs_domain_profiles
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/ucs_domain_switches"
  for_each        = local.ucs_domain_profiles
  action          = each.value.profile.action
  assigned_switch = each.value.profile.assign_switches == true ? [data.intersight_network_element_summary.fi_a[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profiles[each.key].moid
  description     = each.value.profile.domain_descr_fi_a != "" ? each.value.profile.domain_descr_fi_a : "${each.key} Fabric Interconnect A Profile."
  name            = "${each.key}-a"
  # policies_bucket   = each.value.policies_bucket
  tags = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}


#______________________________________________
#
# Create Fabric Interconnect B Switch Profile
#______________________________________________

module "ucs_domain_switches_b" {
  depends_on = [
    data.intersight_network_element_summary.fi_b,
    local.org_moids,
    module.ucs_domain_profiles
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/ucs_domain_switches"
  for_each        = local.ucs_domain_profiles
  action          = each.value.profile.action
  assigned_switch = each.value.profile.assign_switches == true ? [data.intersight_network_element_summary.fi_b[each.key].results.0.moid] : []
  cluster_moid    = module.ucs_domain_profiles[each.key].moid
  description     = each.value.profile.domain_descr_fi_b != "" ? each.value.profile.domain_descr_fi_b : "${each.key} Fabric Interconnect B Profile."
  name            = "${each.key}-b"
  # policies_bucket   = each.value.policies_bucket
  tags = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
}



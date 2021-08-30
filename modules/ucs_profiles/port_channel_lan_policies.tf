#_________________________________________________________________________
#
# Intersight Port Policies Variables
# GUI Location: Configure > Policy > Create Policy > Port > Start
#_________________________________________________________________________

variable "policies_port_channel_lan" {
  default = {
    default = {
      lan_pc_breakoutswport     = 0
      lan_pc_ports              = [49, 50]
      lan_pc_slot_id            = 1
      lan_pc_speed              = "Auto"
      policies_flow_control     = ""
      policies_link_aggregation = ""
      policies_link_control     = ""
      tags                      = []
      ucs_domain_profile        = ""
    }
  }
  description = <<-EOT
  key - Name of the Port Policy.
  * lan_pc_breakoutswport - Breakout port Identifier of the Switch Interface.  When a port is not configured as a breakout port, the aggregatePortId is set to 0, and unused.  When a port is configured as a breakout port, the 'aggregatePortId' port number as labeled on the equipment, e.g. the id of the port on the switch.  Default is 0.
  * lan_pc_ports - List of Ports to Assign to the LAN Port-Channel Policy.  Default is [49, 50].
  * lan_pc_slot_id - Slot Identifier of the Switch/FEX/Chassis Interface.  Default is 1.
  * lan_pc_speed - Admin configured speed for the port.
    - Auto - (Default) Admin configurable speed Auto.
    - 1Gbps - Admin configurable speed 1Gbps.
    - 10Gbps - Admin configurable speed 10Gbps.
    - 25Gbps - Admin configurable speed 25Gbps.
    - 40Gbps - Admin configurable speed 40Gbps.
    - 100Gbps - Admin configurable speed 100Gbps.
  * policies_flow_control - Name of the Flow Control policy.
  * policies_link_aggregation - Name of the Link Aggregation policy.
  * policies_link_control - Name of the Link Control policy.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * ucs_domain_profile - Name of the UCS Domain Profile to Assign.
  EOT
  type = map(object(
    {
      lan_pc_breakoutswport     = optional(number)
      lan_pc_ports              = optional(list(string))
      lan_pc_slot_id            = optional(number)
      lan_pc_speed              = optional(string)
      policies_flow_control     = optional(string)
      policies_link_aggregation = optional(string)
      policies_link_control     = optional(string)
      tags                      = optional(list(map(string)))
      ucs_domain_profile        = string
    }
  ))
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

module "policies_port_channel_lan_a" {
  depends_on = [
    local.org_moids,
    module.policies_flow_control,
    module.policies_link_aggregation,
    module.policies_link_control,
    module.policies_ports_a
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/port_ethernet_uplink_port_channel"
  for_each            = local.policies_port_channel_lan
  breakout_sw_port    = each.value.lan_pc_breakoutswport
  lan_uplink_pc_id    = element(each.value.lan_pc_ports, 0)
  lan_uplink_pc_ports = each.value.lan_pc_ports
  lan_uplink_speed    = each.value.lan_pc_speed
  port_policy_moid    = module.policies_ports_a[each.value.ucs_domain_profile].moid
  slot_id             = each.value.lan_pc_slot_id
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  flow_control_moid = each.value.policies_flow_control != "" ? [
    module.policies_flow_control[each.value.policies_flow_control].moid
  ] : []
  link_aggregation_moid = each.value.policies_link_aggregation != "" ? [
    module.policies_link_aggregation[each.value.policies_link_aggregation].moid
  ] : []
  link_control_moid = each.value.policies_link_control != "" ? [
    module.policies_link_control[each.value.policies_link_control].moid
  ] : []
}

#______________________________________________
#
# Create Fabric B LAN Port-Channel
#______________________________________________

module "policies_port_channel_lan_b" {
  depends_on = [
    local.org_moids,
    module.policies_flow_control,
    module.policies_link_aggregation,
    module.policies_link_control,
    module.policies_ports_b
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/port_ethernet_uplink_port_channel"
  for_each            = local.policies_port_channel_lan
  breakout_sw_port    = each.value.lan_pc_breakoutswport
  lan_uplink_pc_id    = element(each.value.lan_pc_ports, 0)
  lan_uplink_pc_ports = each.value.lan_pc_ports
  lan_uplink_speed    = each.value.lan_pc_speed
  port_policy_moid    = module.policies_ports_b[each.value.ucs_domain_profile].moid
  slot_id             = each.value.lan_pc_slot_id
  tags                = length(each.value.tags) > 0 ? each.value.tags : local.tags
  flow_control_moid = each.value.policies_flow_control != "" ? [
    module.policies_flow_control[each.value.policies_flow_control].moid
  ] : []
  link_aggregation_moid = each.value.policies_link_aggregation != "" ? [
    module.policies_link_aggregation[each.value.policies_link_aggregation].moid
  ] : []
  link_control_moid = each.value.policies_link_control != "" ? [
    module.policies_link_control[each.value.policies_link_control].moid
  ] : []
}

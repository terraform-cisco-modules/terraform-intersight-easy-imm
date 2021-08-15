#_________________________________________________________________________
#
# Intersight Flow Control Policies Variables
# GUI Location: Configure > Policy > Create Policy > Flow Control > Start
#_________________________________________________________________________

variable "policies_flow_control" {
  default = {
    default = {
      description          = ""
      flow_control_mode    = "auto"
      flow_control_receive = "Disabled"
      flow_control_send    = "Disabled"
      organization         = "default"
      tags                 = []
    }
  }
  description = <<-EOT
  key - Name of the Flow Control Policy.
  * description - Description to Assign to the Policy.
  * flow_control_mode - Configure PFC on a per-port basis to enable the no-drop behavior for the CoS as defined by the active network qos policy.
    - auto - (Default) Enables the no-drop CoS values to be advertised by the DCBXP and negotiated with the peer.  A successful negotiation enables PFC on the no-drop CoS.  Any failures because of a mismatch in the capability of peers causes the PFC not to be enabled.
    - on - Enables PFC on the local port regardless of the capability of the peers.
  * flow_control_receive - Link-level Flow Control configured in the receive direction.
    - Disabled - (Default) Admin configured Disabled State.
    - Enabled - Admin configured Enabled State.
  * flow_control_send - Link-level Flow Control configured in the send direction.
    - Disabled - (Default) Admin configured Disabled State.
    - Enabled - Admin configured Enabled State.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description          = optional(string)
      flow_control_mode    = optional(string)
      flow_control_receive = optional(string)
      flow_control_send    = optional(string)
      organization         = optional(string)
      tags                 = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Flow Control Policies
# GUI Location: Configure > Policy > Create Policy > Flow Control > Start
#_________________________________________________________________________

module "policies_flow_control" {
  depends_on = [
    local.org_moids
  ]
  source                     = "terraform-cisco-modules/imm/intersight//modules/domain_flow_control"
  for_each                   = local.policies_flow_control
  description                = each.value.description != "" ? each.value.description : "${each.key} Flow Control Policy."
  name                       = each.key
  org_moid                   = local.org_moids[each.value.organization].moid
  priority_flow_control_mode = each.value.flow_control_mode
  receive_direction          = each.value.flow_control_receive
  send_direction             = each.value.flow_control_send
  tags                       = length(each.value.tags) > 0 ? each.value.tags : local.tags
}


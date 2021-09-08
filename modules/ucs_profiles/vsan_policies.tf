#_________________________________________________________________________
#
# Intersight VSAN Policies Variables
# GUI Location: Configure > Policies > Create Policy > VSAN
#_________________________________________________________________________

variable "vsan_policies" {
  default = {
    default = {
      description     = ""
      organization    = "default"
      tags            = []
      uplink_trunking = false
      vsans = {
        default = {
          default_zoning = "Disabled"
          fcoe_vlan_id   = null
          name           = "vsan"
          vsan_id        = null
        }
      }
    }
  }
  description = <<-EOT
  key - Name of the VSAN Policy.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * uplink_trunking - Default is false.  Enable or Disable Trunking on all of configured FC uplink ports.
  * vsans - List of VSANs to add to the VSAN Policy.
    - default_zoning - Enables or Disables the default zoning state.
      1. Enabled - Admin configured Enabled State.
      2. Disabled (Default) - Admin configured Disabled State.
    - fc_zone_sharing_mode - Logical grouping mode for fc ports.  Not used at this time.
    - fcoe_vlan_id - (REQUIRED).  FCoE VLAN Identifier to Assign to the VSAN Policy.
    - name - Name for the VSAN.
    - vsan_id - (REQUIRED).  VSAN Identifier to Assign to the VSAN Policy.
  EOT
  type = map(object(
    {
      description     = optional(string)
      organization    = optional(string)
      tags            = optional(list(map(string)))
      uplink_trunking = optional(bool)
      vsans = optional(map(object(
        {
          default_zoning = optional(string)
          fcoe_vlan_id   = number
          name           = string
          vsan_id        = number
        }
      )))
    }
  ))
}


#_________________________________________________________________________
#
# VSAN Policies
# GUI Location: Configure > Policies > Create Policy > VSAN
#_________________________________________________________________________


module "vsan_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_switches
  ]
  source          = "../../../terraform-intersight-imm/modules/vsan_policies"
  for_each        = var.vsan_policies
  description     = each.value.description != "" ? each.value.description : "${each.key} VSAN Policy."
  uplink_trunking = each.value.uplink_trunking
  name            = each.key
  org_moid        = local.org_moids[each.value.organization].moid
  tags            = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merge_all_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merge_all_moids[k].vsan_policy == each.key
  }
}

#______________________________________________
#
# Assign VSANs to VSAN Policies
#______________________________________________

module "vsan_policies_add_vsans" {
  depends_on = [
    local.org_moids,
    module.vsan_policies
  ]
  source           = "../../../terraform-intersight-imm/modules/vsan_policy_add_vsan"
  for_each         = toset(keys({ for k, v in local.vsans : k => v }))
  default_zoning   = local.vsans[each.value].default_zoning
  fcoe_vlan_id     = local.vsans[each.value].fcoe_vlan_id
  name             = local.vsans[each.value].name
  vsan_id          = local.vsans[each.value].vsan_id
  vsan_policy_moid = module.vsan_policies[local.vsans[each.value].vsan_policy].moid
  # fc_zone_sharing_mode = local.vsans[each.value].fc_zone_sharing_mode
}

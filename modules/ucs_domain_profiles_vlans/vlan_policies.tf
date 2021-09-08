#_________________________________________________________________________
#
# Intersight VSAN Policies Variables
# GUI Location: Configure > Policies > Create Policy > VSAN
#_________________________________________________________________________

variable "vlan_policies" {
  default = {
    default = {
      description  = ""
      organization = "default"
      tags         = []
      vlans = {
        default = {
          auto_allow_on_uplinks = true
          multicast_policy      = ""
          name                  = "vlan-{vlan_id}"
          native_vlan           = false
          vlan_id               = null
        }
      }
    }
  }
  description = <<-EOT
  key - Name of the VLAN Policy.
  * description - Description to Assign to the Policy.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * vlans - List of VSANs to add to the VSAN Policy.
    - auto_allow_on_uplinks - Default is true.  Used to determine whether this VLAN will be allowed on all uplink ports and PCs in this FI.
    - multicast_policy - Name of the Multicast Policy to assign to the VLAN.
    - name - The 'name' used to identify this VLAN.
    - native_vlan - Default is false.  Used to define whether this VLAN is to be classified as 'native' for traffic in this FI.
    - vlan_id - (REQUIRED).  The identifier for this Virtual LAN.
  EOT
  type = map(object(
    {
      description  = optional(string)
      organization = optional(string)
      tags         = optional(list(map(string)))
      vlans = optional(map(object(
        {
          auto_allow_on_uplinks = optional(bool)
          multicast_policy      = string
          name                  = optional(string)
          native_vlan           = optional(bool)
          vlan_id               = number
        }
      )))
    }
  ))
}


#_________________________________________________________________________
#
# VLAN Policies
# GUI Location: Configure > Policies > Create Policy > VLAN
#_________________________________________________________________________


module "vlan_policies" {
  depends_on = [
    local.org_moids,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/vlan_policies"
  for_each    = var.vlan_policies
  description = each.value.description != "" ? each.value.description : "${each.key} VLAN Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merge_all_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merge_all_moids[k].vlan_policy == each.key
  }
}

#______________________________________________
#
# Assign VLANs to VLAN Policies
#______________________________________________

module "vlan_policies_add_vlans" {
  depends_on = [
    local.org_moids,
    module.multicast_policies,
    module.vlan_policies
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/vlan_policy_add_vlan"
  for_each              = toset(keys({ for k, v in local.vlans : k => v }))
  auto_allow_on_uplinks = local.vlans[each.value].auto_allow_on_uplinks
  multicast_policy_moid = module.multicast_policies[local.vlans[each.value].multicast_policy].moid
  name                  = local.vlans[each.value].name
  native_vlan           = local.vlans[each.value].native_vlan
  vlan_id               = local.vlans[each.value].vlan_id
  vlan_policy_moid      = module.vlan_policies[local.vlans[each.value].vlan_policy].moid
}

#_________________________________________________________________________
#
# FC Zone Policies
# GUI Location: Configure > Policies > Create Policy > FC Zone
#_________________________________________________________________________

variable "fc_zone_policies" {
  default = {
    default = {
      description           = ""
      fc_target_zoning_type = "None"
      tags                  = []
      targets               = []
      /* Example FC Target
      targets = [
        {
          name      = "example"
          switch_id = "A"
          vsan_id   = 100
          wwpn      = "20:00:00:25:B5:0A:00:00"
        }
      ] */
    }
  }
  description = <<-EOT
  key - Name of the FC Zoning Policy
  * description - Description for the Policy.
  * fc_target_zoning_type - Default is "None".  Type of FC zoning. Allowed values are SIST, SIMT and None.
    - None - FC zoning is not configured.
    - SIMT - The system automatically creates one zone for each vHBA. Configure this type of zoning if the number of zones created is likely to exceed the maximum supported number of zones.
    - SIST - The system automatically creates one zone for each vHBA and storage port pair. Each zone has two members.
  * tags - Default is [].  List of Key/Value Pairs to Assign as Attributes to the Policy.
  * targets - Default is [].  A List of FC Target Details to assign to the Policy
    - name - Name given to the target member.
    - Gold
    - switch_id - Unique identifier for the Fabric object.
      * A - Switch Identifier of Fabric Interconnect A.
      * B - Switch Identifier of Fabric Interconnect B.
    - vsan_id - VSAN with scope defined as Storage in the VSAN policy.
    - wwpn - WWPN that is a member of the FC zone.
  EOT
  type = map(object(
    {
      description           = optional(string)
      fc_target_zoning_type = optional(string)
      tags                  = optional(list(map(string)))
      targets = list(object(
        {
          name      = string
          switch_id = string
          vsan_id   = number
          wwpn      = string
        }
      ))
    }
  ))
}

#_______________________________________________________________________________
#
# FC Zone Policies
# GUI Location: Configure > Policies > Create Policy > FC Zone
#_______________________________________________________________________________

resource "intersight_fabric_fc_zone_policy" "fc_zone_policies" {
  depends_on = [
    local.org_moid
  ]
  for_each              = local.fc_zone_policies
  description           = each.value.description != "" ? each.value.description : "${each.key} FC Zone Policy"
  fc_target_zoning_type = each.value.fc_target_zoning_type
  name                  = each.key
  organization {
    moid        = local.org_moid
    object_type = "organization.Organization"
  }
  dynamic "fc_target_members" {
    for_each = each.value.targets
    content {
      name      = fc_target_members.key
      switch_id = fc_target_members.value.switch_id
      vsan_id   = fc_target_members.value.vsan_id
      wwpn      = fc_target_members.value.wwpn
    }
  }
  dynamic "tags" {
    for_each = length(each.value.tags) > 0 ? each.value.tags : local.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}

#_________________________________________________________________________
#
# Intersight UCS Domain Profile Variables
# GUI Location: Profiles > UCS Domain Profile > Create UCS Domain Profile
#_________________________________________________________________________

variable "ucs_domain_profiles" {
  default = {
    default = {
      action                      = "No-op"
      assign_switches             = false
      description                 = ""
      descr_fi_a                  = ""
      descr_fi_b                  = ""
      organization                = "default"
      policy_network_connectivity = ""
      policy_ntp                  = ""
      policy_ports                = ""
      policy_snmp                 = ""
      policy_switch_control       = ""
      policy_syslog               = ""
      policy_system_qos           = ""
      serial_a                    = ""
      serial_b                    = ""
      tags                        = []
      vlan_description            = ""
      vlan_native                 = 1
      vlan_list                   = "2-3"
    }
  }
  description = <<-EOT
  Intersight UCS Domain Profile Variable Map.
  * action - Action to Perform on the Chassis Profile Assignment.  Options are:
    - Deploy
    - No-op
    - Unassign
  * assign_switches - Flag to define if the physical FI's should be assigned to the policy.  Default is false.
  * description - Description to Assign to the Profile.
  * descr_fi_a - Description to Assign to the Profile Fabric Interconnect A.
  * descr_fi_b - Description to Assign to the Profile Fabric Interconnect B.
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  * policy_network_connectivity - Name of the Network Control Policy to assign to the UCS Domain Profile.
  * policy_ntp - Name of the NTP Policy to assign to the UCS Domain Profile.
  * policy_ports - Name of the Port Policy to assign to the UCS Domain Profile.
  * policy_snmp - Name of the SNMP Policy to assign to the UCS Domain Profile.
  * policy_switch_control - Name of the Switch Control Policy to assign to the UCS Domain Profile.
  * policy_syslog - Name of the Syslog Policy to assign to the UCS Domain Profile.
  * policy_system_qos - Name of the System QoS Policy to assign to the UCS Domain Profile.
  * serial_a - Serial Number for Fabric Interconnect A.
  * serial_b - Serial Number for Fabric Interconnect B.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * vlan_description - Description to Assign to the Policy.
  * vlan_native - VLAN ID to Assign as the Native VLAN.  Default is 1.
  * vlan_list - List of VLANs to assign to the Policy.  Default is "2-3"
  EOT
  type = map(object(
    {
      action                      = optional(string)
      assign_switches             = optional(bool)
      description                 = optional(string)
      descr_fi_a                  = optional(string)
      descr_fi_b                  = optional(string)
      organization                = optional(string)
      policy_network_connectivity = optional(string)
      policy_ntp                  = optional(string)
      policy_ports                = optional(string)
      policy_snmp                 = optional(string)
      policy_switch_control       = optional(string)
      policy_syslog               = optional(string)
      policy_system_qos           = optional(string)
      serial_a                    = optional(string)
      serial_b                    = optional(string)
      tags                        = optional(list(map(string)))
      vlan_description            = optional(string)
      vlan_native                 = optional(number)
      vlan_list                   = optional(string)
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
  description = each.value.description != "" ? each.value.description : "${each.key} UCS Domain."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
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
  description     = each.value.descr_fi_a != "" ? each.value.descr_fi_a : "${each.key} Fabric Interconnect A Profile."
  name            = "${each.key}-a"
  # policy_bucket   = each.value.policy_bucket
  tags = each.value.tags != [] ? each.value.tags : local.tags
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
  description     = each.value.descr_fi_b != "" ? each.value.descr_fi_b : "${each.key} Fabric Interconnect B Profile."
  name            = "${each.key}-b"
  # policy_bucket   = each.value.policy_bucket
  tags = each.value.tags != [] ? each.value.tags : local.tags
}


#____________________________________________________________
#
# Intersight UCS Domain VLAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "policies_vlan" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy"
  for_each    = local.ucs_domain_profiles
  description = each.value.vlan_description != "" ? each.value.vlan_description : "${each.value.organization} ${each.key} VLAN Policy."
  name        = "${each.key}_vlan"
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = each.value.tags != [] ? each.value.tags : local.tags
  profiles = [
    module.ucs_domain_profiles_a[each.key].moid,
    module.ucs_domain_profiles_b[each.key].moid
  ]
}


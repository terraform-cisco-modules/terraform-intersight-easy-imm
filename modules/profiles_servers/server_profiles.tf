#_________________________________________________________________________
#
# Intersight UCS Server Profile Variables
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

variable "ucs_server_profiles" {
  default = {
    default = {
      action              = "No-op"
      assign_server       = false
      description         = ""
      name                = "" # If Name is not specified the Serial Will be assigned as the Hostname
      src_template        = ""
      tags                = []
      wait_for_completion = false
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  key - Serial Number for a/the physical server.
  * action - Action to Perform on the Chassis Profile Assignment.  Options are:
    - Deploy
    - No-op
    - Unassign
  * assign_server - Flag to determine if a physical server should be assigned to the server profile or not.  Default is false.
  * description - Description to Assign to the Profile.
  * name - Name to assign to the server profile.
  * src_template - Name of the server template to apply to the server profile.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  * wait_for_completion - This model object can trigger workflows. Use this option to wait for all running workflows to reach a complete state.
  EOT
  type = map(object(
    {
      action              = optional(string)
      assign_server       = optional(bool)
      description         = optional(string)
      name                = optional(string)
      src_template        = optional(string)
      tags                = optional(list(map(string)))
      wait_for_completion = optional(bool)
    }
  ))
}

variable "ucs_server_templates" {
  default = {
    default = {
      operating_system            = "VMware"
      organization                = "default"
      policy_bios                 = ""
      policy_boot_order           = ""
      policy_device_connector     = ""
      policy_imc_access           = ""
      policy_ipmi_over_lan        = ""
      policy_lan_connectivity     = ""
      policy_ldap                 = ""
      policy_local_users          = ""
      policy_network_connectivity = ""
      policy_ntp                  = ""
      policy_persistent_memory    = ""
      policy_power                = ""
      policy_san_connectivity     = ""
      policy_sdcard               = ""
      policy_serial_over_lan      = ""
      policy_smtp                 = ""
      policy_snmp                 = ""
      policy_snmp_1_user          = ""
      policy_snmp_2_users         = ""
      policy_ssh                  = ""
      policy_storage              = ""
      policy_syslog               = ""
      policy_virtual_kvm          = ""
      policy_virtual_media        = ""
      target_platform             = "FIAttached"
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  * operating_system - Operating System to Install on the Server.  Options are:
    - Linux
    - VMware - (Default)
    - Windows
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  policy_bios - Name of the BIOS Policy to assign to the Template.
  policy_boot_order - Name of the Boot Order Policy to assign to the Template.
  policy_device_connector - Name of the Device Connector Policy to assign to the Template.
  policy_imc_access - Name of the IMC Access Policy to assign to the Template.
  policy_ipmi_over_lan - Name of the IPMI over LAN Policy to assign to the Template.
  policy_lan_connectivity - Name of the LAN Connectivity Policy to assign to the Template.
  policy_ldap - Name of the LDAP Policy to assign to the Template.
  policy_local_users - Name of the Local Users Policy to assign to the Template.
  policy_network_connectivity - Name of the Network Connectivity Policy to assign to the Template.
  policy_ntp - Name of the NTP Policy to assign to the Template.
  policy_persistent_memory - Name of the Persistent Memory Policy to assign to the Template.
  policy_power - Name of the Power Policy to assign to the Template.
  policy_san_connectivity - Name of the SAN Connectivity Policy to assign to the Template.
  policy_sdcard - Name of the SD Card Policy to assign to the Template.
  policy_serial_over_lan - Name of the Serial over LAN Policy to assign to the Template.
  policy_smtp - Name of the SMTP Policy to assign to the Template.
  policy_snmp - Name of the SNMP Policy to assign to the Template.
  policy_snmp_1_user - Name of the SNMP single user Policy to assign to the Template.
  policy_snmp_2_users - Name of the SNMP two user Policy to assign to the Template.
  policy_ssh - Name of the SSH Policy to assign to the Template.
  policy_storage - Name of the Storage Policy to assign to the Template.
  policy_syslog - Name of the Syslog Policy to assign to the Template.
  policy_virtual_kvm - Name of the Virtual KVM Policy to assign to the Template.
  policy_virtual_media - Name of the Virtual Media Policy to assign to the Template.
  target_platform - The platform for which the server profile is applicable. It can either be a server that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    - FIAttached - (Default) - Servers which are connected to a Fabric Interconnect that is managed by Intersight.
    - Standalone - Servers which are operating in standalone mode i.e. not connected to a Fabric Interconnected.
  EOT
  type = map(object(
    {
      operating_system            = optional(string)
      organization                = optional(string)
      policy_bios                 = optional(string)
      policy_boot_order           = optional(string)
      policy_device_connector     = optional(string)
      policy_imc_access           = optional(string)
      policy_ipmi_over_lan        = optional(string)
      policy_lan_connectivity     = optional(string)
      policy_ldap                 = optional(string)
      policy_local_users          = optional(string)
      policy_network_connectivity = optional(string)
      policy_ntp                  = optional(string)
      policy_persistent_memory    = optional(string)
      policy_power                = optional(string)
      policy_san_connectivity     = optional(string)
      policy_sdcard               = optional(string)
      policy_serial_over_lan      = optional(string)
      policy_smtp                 = optional(string)
      policy_snmp                 = optional(string)
      policy_snmp_1_user          = optional(string)
      policy_snmp_2_users         = optional(string)
      policy_ssh                  = optional(string)
      policy_storage              = optional(string)
      policy_syslog               = optional(string)
      policy_virtual_kvm          = optional(string)
      policy_virtual_media        = optional(string)
      target_platform             = optional(string)
    }
  ))
}

#_________________________________________________________________________
#
# Intersight UCS Server Profile Module
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

module "ucs_server_profiles" {
  depends_on = [
    local.org_moids
  ]
  source = "terraform-cisco-modules/imm/intersight//modules/server_profile"
  # source              = "terraform-cisco-modules/imm/intersight//modules/server_profile"
  for_each            = local.ucs_server_profiles
  action              = each.value.profile.action
  description         = each.value.profile.description != "" ? each.value.profile.description : "${each.value.profile.organization} ${each.value.profile.name} Server Profile."
  name                = each.value.profile.name != "" ? each.value.profile.name : each.key
  org_moid            = local.org_moids[each.value.profile.organization].moid
  tags                = length(each.value.profile.tags) > 0 ? each.value.profile.tags : local.tags
  target_platform     = each.value.profile.target_platform == "Standalone" ? "Standalone" : "FIAttached"
  wait_for_completion = each.value.profile.wait_for_completion
  assigned_server = each.value.profile.assign_server == true ? [
    {
      moid        = data.intersight_compute_physical_summary.server[each.key].results[0].moid
      object_type = data.intersight_compute_physical_summary.server[each.key].results[0].source_object_type
    }
  ] : []
  # src_template        = each.value.src_template
}

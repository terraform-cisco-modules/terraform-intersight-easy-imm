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
      operating_system              = "VMware"
      organization                  = "default"
      policies_bios                 = ""
      policies_boot_order           = ""
      policies_device_connector     = ""
      policies_imc_access           = ""
      policies_ipmi_over_lan        = ""
      policies_lan_connectivity     = ""
      policies_ldap                 = ""
      policies_local_users          = ""
      policies_network_connectivity = ""
      policies_ntp                  = ""
      policies_persistent_memory    = ""
      policies_power                = ""
      policies_san_connectivity     = ""
      policies_sdcard               = ""
      policies_serial_over_lan      = ""
      policies_smtp                 = ""
      policies_snmp                 = ""
      policies_snmp_1_user          = ""
      policies_snmp_2_users         = ""
      policies_ssh                  = ""
      policies_storage              = ""
      policies_syslog               = ""
      policies_virtual_kvm          = ""
      policies_virtual_media        = ""
      target_platform               = "FIAttached"
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
  policies_bios - Name of the BIOS Policy to assign to the Template.
  policies_boot_order - Name of the Boot Order Policy to assign to the Template.
  policies_device_connector - Name of the Device Connector Policy to assign to the Template.
  policies_imc_access - Name of the IMC Access Policy to assign to the Template.
  policies_ipmi_over_lan - Name of the IPMI over LAN Policy to assign to the Template.
  policies_lan_connectivity - Name of the LAN Connectivity Policy to assign to the Template.
  policies_ldap - Name of the LDAP Policy to assign to the Template.
  policies_local_users - Name of the Local Users Policy to assign to the Template.
  policies_network_connectivity - Name of the Network Connectivity Policy to assign to the Template.
  policies_ntp - Name of the NTP Policy to assign to the Template.
  policies_persistent_memory - Name of the Persistent Memory Policy to assign to the Template.
  policies_power - Name of the Power Policy to assign to the Template.
  policies_san_connectivity - Name of the SAN Connectivity Policy to assign to the Template.
  policies_sdcard - Name of the SD Card Policy to assign to the Template.
  policies_serial_over_lan - Name of the Serial over LAN Policy to assign to the Template.
  policies_smtp - Name of the SMTP Policy to assign to the Template.
  policies_snmp - Name of the SNMP Policy to assign to the Template.
  policies_snmp_1_user - Name of the SNMP single user Policy to assign to the Template.
  policies_snmp_2_users - Name of the SNMP two user Policy to assign to the Template.
  policies_ssh - Name of the SSH Policy to assign to the Template.
  policies_storage - Name of the Storage Policy to assign to the Template.
  policies_syslog - Name of the Syslog Policy to assign to the Template.
  policies_virtual_kvm - Name of the Virtual KVM Policy to assign to the Template.
  policies_virtual_media - Name of the Virtual Media Policy to assign to the Template.
  target_platform - The platform for which the server profile is applicable. It can either be a server that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    - FIAttached - (Default) - Servers which are connected to a Fabric Interconnect that is managed by Intersight.
    - Standalone - Servers which are operating in standalone mode i.e. not connected to a Fabric Interconnected.
  EOT
  type = map(object(
    {
      operating_system              = optional(string)
      organization                  = optional(string)
      policies_bios                 = optional(string)
      policies_boot_order           = optional(string)
      policies_device_connector     = optional(string)
      policies_imc_access           = optional(string)
      policies_ipmi_over_lan        = optional(string)
      policies_lan_connectivity     = optional(string)
      policies_ldap                 = optional(string)
      policies_local_users          = optional(string)
      policies_network_connectivity = optional(string)
      policies_ntp                  = optional(string)
      policies_persistent_memory    = optional(string)
      policies_power                = optional(string)
      policies_san_connectivity     = optional(string)
      policies_sdcard               = optional(string)
      policies_serial_over_lan      = optional(string)
      policies_smtp                 = optional(string)
      policies_snmp                 = optional(string)
      policies_snmp_1_user          = optional(string)
      policies_snmp_2_users         = optional(string)
      policies_ssh                  = optional(string)
      policies_storage              = optional(string)
      policies_syslog               = optional(string)
      policies_virtual_kvm          = optional(string)
      policies_virtual_media        = optional(string)
      target_platform               = optional(string)
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

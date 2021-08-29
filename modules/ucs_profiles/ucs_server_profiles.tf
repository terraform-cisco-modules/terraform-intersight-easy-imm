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
      bios_policies                 = ""
      boot_order_policies           = ""
      device_connector_policies     = ""
      imc_access_policies           = ""
      ipmi_over_lan_policies        = ""
      lan_connectivity_policies     = ""
      ldap_policies                 = ""
      local_users_policies          = ""
      network_connectivity_policies = ""
      ntp_policies                  = ""
      operating_system              = "VMware"
      organization                  = "default"
      persistent_memory_policies    = ""
      power_policies                = ""
      san_connectivity_policies     = ""
      sd_card_policies              = ""
      serial_over_lan_policies      = ""
      smtp_policies                 = ""
      snmp_policies                 = ""
      snmp_1_user_policies          = ""
      snmp_2_users_policies         = ""
      ssh_policies                  = ""
      storage_policies              = ""
      syslog_policies               = ""
      target_platform               = "FIAttached"
      virtual_kvm_policies          = ""
      virtual_media_policies        = ""
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  * bios_policies - Name of the BIOS Policy to assign to the Template.
  * boot_order_policies - Name of the Boot Order Policy to assign to the Template.
  * device_connector_policies - Name of the Device Connector Policy to assign to the Template.
  * imc_access_policies - Name of the IMC Access Policy to assign to the Template.
  * ipmi_over_lan_policies - Name of the IPMI over LAN Policy to assign to the Template.
  * lan_connectivity_policies - Name of the LAN Connectivity Policy to assign to the Template.
  * ldap_policies - Name of the LDAP Policy to assign to the Template.
  * local_users_policies - Name of the Local Users Policy to assign to the Template.
  * network_connectivity_policies - Name of the Network Connectivity Policy to assign to the Template.
  * ntp_policies - Name of the NTP Policy to assign to the Template.
  * operating_system - Operating System to Install on the Server.  Options are:
    - Linux
    - VMware - (Default)
    - Windows
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  * persistent_memory_policies - Name of the Persistent Memory Policy to assign to the Template.
  * power_policies - Name of the Power Policy to assign to the Template.
  * san_connectivity_policies - Name of the SAN Connectivity Policy to assign to the Template.
  * sd_card_policies - Name of the SD Card Policy to assign to the Template.
  * serial_over_lan_policies - Name of the Serial over LAN Policy to assign to the Template.
  * smtp_policies - Name of the SMTP Policy to assign to the Template.
  * snmp_policies - Name of the SNMP Policy to assign to the Template.
  * snmp_1_user_policies - Name of the SNMP single user Policy to assign to the Template.
  * snmp_2_users_policies - Name of the SNMP two user Policy to assign to the Template.
  * ssh_policies - Name of the SSH Policy to assign to the Template.
  * storage_policies - Name of the Storage Policy to assign to the Template.
  * syslog_policies - Name of the Syslog Policy to assign to the Template.
  * target_platform - The platform for which the server profile is applicable. It can either be a server that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    - FIAttached - (Default) - Servers which are connected to a Fabric Interconnect that is managed by Intersight.
    - Standalone - Servers which are operating in standalone mode i.e. not connected to a Fabric Interconnected.
  * virtual_kvm_policies - Name of the Virtual KVM Policy to assign to the Template.
  * virtual_media_policies - Name of the Virtual Media Policy to assign to the Template.
  EOT
  type = map(object(
    {
      bios_policies                 = optional(string)
      boot_order_policies           = optional(string)
      device_connector_policies     = optional(string)
      imc_access_policies           = optional(string)
      ipmi_over_lan_policies        = optional(string)
      lan_connectivity_policies     = optional(string)
      ldap_policies                 = optional(string)
      local_users_policies          = optional(string)
      network_connectivity_policies = optional(string)
      ntp_policies                  = optional(string)
      operating_system              = optional(string)
      organization                  = optional(string)
      persistent_memory_policies    = optional(string)
      power_policies                = optional(string)
      san_connectivity_policies     = optional(string)
      sd_card_policies              = optional(string)
      serial_over_lan_policies      = optional(string)
      smtp_policies                 = optional(string)
      snmp_policies                 = optional(string)
      snmp_1_user_policies          = optional(string)
      snmp_2_users_policies         = optional(string)
      ssh_policies                  = optional(string)
      storage_policies              = optional(string)
      syslog_policies               = optional(string)
      target_platform               = optional(string)
      virtual_kvm_policies          = optional(string)
      virtual_media_policies        = optional(string)
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

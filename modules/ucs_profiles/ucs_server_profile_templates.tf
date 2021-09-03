#_________________________________________________________________________
#
# Intersight UCS Server Profile Variables
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

variable "ucs_server_profile_templates" {
  default = {
    default = {
      bios_policy                 = ""
      boot_order_policy           = ""
      device_connector_policy     = ""
      imc_access_policy           = ""
      ipmi_over_lan_policy        = ""
      lan_connectivity_policy     = ""
      ldap_policy                 = ""
      local_users_policy          = ""
      network_connectivity_policy = ""
      ntp_policy                  = ""
      operating_system            = "VMware"
      organization                = "default"
      persistent_memory_policy    = ""
      power_policy                = ""
      san_connectivity_policy     = ""
      sd_card_policy              = ""
      serial_over_lan_policy      = ""
      smtp_policy                 = ""
      snmp_policy                 = ""
      snmp_1_user_policy          = ""
      snmp_2_users_policy         = ""
      ssh_policy                  = ""
      storage_policy              = ""
      syslog_policy               = ""
      target_platform             = "FIAttached"
      virtual_kvm_policy          = ""
      virtual_media_policy        = ""
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  * bios_policy - Name of the BIOS Policy to assign to the Template.
  * boot_order_policy - Name of the Boot Order Policy to assign to the Template.
  * device_connector_policy - Name of the Device Connector Policy to assign to the Template.
  * imc_access_policy - Name of the IMC Access Policy to assign to the Template.
  * ipmi_over_lan_policy - Name of the IPMI over LAN Policy to assign to the Template.
  * lan_connectivity_policy - Name of the LAN Connectivity Policy to assign to the Template.
  * ldap_policy - Name of the LDAP Policy to assign to the Template.
  * local_users_policy - Name of the Local Users Policy to assign to the Template.
  * network_connectivity_policy - Name of the Network Connectivity Policy to assign to the Template.
  * ntp_policy - Name of the NTP Policy to assign to the Template.
  * operating_system - Operating System to Install on the Server.  Options are:
    - Linux
    - VMware - (Default)
    - Windows
  * organization - Name of the Intersight Organization to assign this Profile to.  Default is default.
    -  https://intersight.com/an/settings/organizations/
  * persistent_memory_policy - Name of the Persistent Memory Policy to assign to the Template.
  * power_policy - Name of the Power Policy to assign to the Template.
  * san_connectivity_policy - Name of the SAN Connectivity Policy to assign to the Template.
  * sd_card_policy - Name of the SD Card Policy to assign to the Template.
  * serial_over_lan_policy - Name of the Serial over LAN Policy to assign to the Template.
  * smtp_policy - Name of the SMTP Policy to assign to the Template.
  * snmp_policy - Name of the SNMP Policy to assign to the Template.
  * snmp_1_user_policy - Name of the SNMP single user Policy to assign to the Template.
  * snmp_2_users_policy - Name of the SNMP two user Policy to assign to the Template.
  * ssh_policy - Name of the SSH Policy to assign to the Template.
  * storage_policy - Name of the Storage Policy to assign to the Template.
  * syslog_policy - Name of the Syslog Policy to assign to the Template.
  * target_platform - The platform for which the server profile is applicable. It can either be a server that is operating in standalone mode or which is attached to a Fabric Interconnect managed by Intersight.
    - FIAttached - (Default) - Servers which are connected to a Fabric Interconnect that is managed by Intersight.
    - Standalone - Servers which are operating in standalone mode i.e. not connected to a Fabric Interconnected.
  * virtual_kvm_policy - Name of the Virtual KVM Policy to assign to the Template.
  * virtual_media_policy - Name of the Virtual Media Policy to assign to the Template.
  EOT
  type = map(object(
    {
      bios_policy                 = optional(string)
      boot_order_policy           = optional(string)
      device_connector_policy     = optional(string)
      imc_access_policy           = optional(string)
      ipmi_over_lan_policy        = optional(string)
      lan_connectivity_policy     = optional(string)
      ldap_policy                 = optional(string)
      local_users_policy          = optional(string)
      network_connectivity_policy = optional(string)
      ntp_policy                  = optional(string)
      operating_system            = optional(string)
      organization                = optional(string)
      persistent_memory_policy    = optional(string)
      power_policy                = optional(string)
      san_connectivity_policy     = optional(string)
      sd_card_policy              = optional(string)
      serial_over_lan_policy      = optional(string)
      smtp_policy                 = optional(string)
      snmp_policy                 = optional(string)
      snmp_1_user_policy          = optional(string)
      snmp_2_users_policy         = optional(string)
      ssh_policy                  = optional(string)
      storage_policy              = optional(string)
      syslog_policy               = optional(string)
      target_platform             = optional(string)
      virtual_kvm_policy          = optional(string)
      virtual_media_policy        = optional(string)
    }
  ))
}

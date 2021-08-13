#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > Name
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  for_each = local.organizations
  name     = each.value
}

#____________________________________________________________
#
# Server Moid Data Source
# GUI Location:
#   Operate > Servers > Copy the Serial from the Column.
#____________________________________________________________

# data "intersight_compute_physical_summary" "server" {
#   for_each = {
#     for assign, serial in local.ucs_server_profiles[*].profiles : assign => serial
#     if serial.assign_server == true
#   }
#   serial = each.key
# }


locals {
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Tags for Deployment
  tags = var.tags

  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_server_profiles = {
    for k, v in var.ucs_server_profiles : k =>
    {
      for key, value in var.ucs_server_templates : "profile" =>
      {
        action                      = (v.action                       != null ? v.action : "No-op")
        assign_server               = (v.assign_server                != null ? v.assign_server : false)
        description                 = (v.description                  != null ? v.description : "")
        name                        = (v.name                         != null ? v.name : "")
        operating_system            = (value.operating_system             != null ? value.operating_system : "vmware")
        organization                = (value.organization                 != null ? value.organization : "default")
        policy_bios                 = (value.policy_bios                  != null ? value.policy_bios : "")
        policy_boot_order           = (value.policy_boot_order            != null ? value.policy_boot_order : "")
        policy_device_connector     = (value.policy_device_connector      != null ? value.policy_device_connector : "")
        policy_imc_access           = (value.policy_imc_access            != null ? value.policy_imc_access : "")
        policy_ipmi_over_lan        = (value.policy_ipmi_over_lan         != null ? value.policy_ipmi_over_lan : "")
        policy_lan_connectivity     = (value.policy_lan_connectivity      != null ? value.policy_lan_connectivity : "")
        policy_ldap_group           = (value.policy_ldap_group            != null ? value.policy_ldap_group : "")
        policy_local_users          = (value.policy_local_users           != null ? value.policy_local_users : "")
        policy_network_connectivity = (value.policy_network_connectivity  != null ? value.policy_network_connectivity : "")
        policy_ntp                  = (value.policy_ntp                   != null ? value.policy_ntp : "")
        policy_persistent_memory    = (value.policy_persistent_memory     != null ? value.policy_persistent_memory : "")
        policy_power                = (value.policy_power                 != null ? value.policy_power : "")
        policy_san_connectivity     = (value.policy_san_connectivity      != null ? value.policy_san_connectivity : "")
        policy_sdcard               = (value.policy_sdcard                != null ? value.policy_sdcard : "")
        policy_serial_over_lan      = (value.policy_serial_over_lan       != null ? value.policy_serial_over_lan : "")
        policy_smtp                 = (value.policy_smtp                  != null ? value.policy_smtp : "")
        policy_snmp                 = (value.policy_snmp                  != null ? value.policy_snmp : "")
        policy_snmp_1_user          = (value.policy_snmp_1_user           != null ? value.policy_snmp_1_user : "")
        policy_snmp_2_users         = (value.policy_snmp_2_users          != null ? value.policy_snmp_2_users : "")
        policy_ssh                  = (value.policy_ssh                   != null ? value.policy_ssh : "")
        policy_storage              = (value.policy_storage               != null ? value.policy_storage : "")
        policy_syslog               = (value.policy_syslog                != null ? value.policy_syslog : "")
        policy_virtual_kvm          = (value.policy_virtual_kvm           != null ? value.policy_virtual_kvm : "")
        policy_virtual_media        = (value.policy_virtual_media         != null ? value.policy_virtual_media : "")
        tags                        = (v.tags                         != null ? v.tags : [])
        target_platform             = (value.target_platform              != null ? value.target_platform : "FIAttached")
        type                        = "instance"
        wait_for_completion         = (v.wait_for_completion          != null ? v.wait_for_completion : false)
      } if v.src_template == key
    }
  }
}

#_________________________________________________________________________
#
# Intersight UCS Server Profile Variables
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

variable "ucs_server_profiles" {
  default = {
    default = {
      action                      = "No-op"
      assign_server               = false
      description                 = ""
      name                        = "" # If Name is not specified the Serial Will be assigned as the Hostname
      operating_system            = "vmware"
      organization                = "default"
      policy_bios                 = ""
      policy_boot_order           = ""
      policy_device_connector     = ""
      policy_imc_access           = ""
      policy_ipmi_over_lan        = ""
      policy_lan_connectivity     = ""
      policy_ldap_group           = ""
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
      src_template                = []
      tags                        = []
      target_platform             = "FIAttached"
      type                        = "instance"
      wait_for_completion         = false
    }
  }
  description = <<-EOT
  Intersight UCS Server Profile Variable Map.
  * organization - Name of the Intersight Organization to assign this pool to:
    -  https://intersight.com/an/settings/organizations/
  * For the remainder of the option documentation refer to these sources:
    - https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/server_profile
  EOT
  type = map(object(
    {
      action                      = optional(string)
      assign_server               = optional(bool)
      description                 = optional(string)
      name                        = optional(string)
      operating_system            = optional(string)
      organization                = optional(string)
      policy_bios                 = optional(string)
      policy_boot_order           = optional(string)
      policy_device_connector     = optional(string)
      policy_imc_access           = optional(string)
      policy_ipmi_over_lan        = optional(string)
      policy_lan_connectivity     = optional(string)
      policy_ldap_group           = optional(string)
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
      src_template                = optional(set(string))
      tags                        = optional(list(map(string)))
      target_platform             = optional(string)
      type                        = optional(string)
      wait_for_completion         = optional(bool)
    }
  ))
}


#_________________________________________________________________________
#
# Intersight UCS Server Profile Module
# GUI Location: Profiles > UCS Server Profile > Create UCS Server Profile
#_________________________________________________________________________

module "ucs_server_profile" {
  depends_on = [
    local.org_moids
  ]
  source = "../../../terraform-intersight-imm/modules/server_profile"
  # source              = "terraform-cisco-modules/imm/intersight//modules/server_profile"
  for_each            = local.ucs_server_profiles
  action              = each.value.action
  description         = each.value.description != "" ? each.value.description : "${each.value.organization} ${each.value.name} Server Profile."
  name                = each.value.name != "" ? each.value.name : each.key
  org_moid            = local.org_moids[each.value.organization].moid
  src_template        = each.value.src_template
  tags                = each.value.tags != "" ? each.value.tags : local.tags
  target_platform     = each.value.target_platform == "Standalone" ? "Standalone" : "FIAttached"
  wait_for_completion = each.value.wait_for_completion
  assigned_server = each.value.assign_server == true ? [
    {
      moid        = data.intersight_compute_physical_summary.server[each.key].results[0].moid
      object_type = data.intersight_compute_physical_summary.server[each.key].results[0].source_object_type
    }
  ] : []
}

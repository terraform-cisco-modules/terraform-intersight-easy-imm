#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Tags for Deployment
  tags = var.tags

  #__________________________________________________________
  #
  # UCS Server Profiles Section - Locals
  #__________________________________________________________
  ucs_server_loop_1 = {
    for k, v in var.ucs_server_profiles : k => {
      action                        = v.action != null ? v.action : "No-op"
      adapter_policy                = v.adapter_policy != null ? v.adapter_policy : null
      assign_server                 = v.assign_server != null ? v.assign_server : false
      bios_policy                   = v.bios_policy != null ? v.bios_policy : null
      boot_order_policy             = v.boot_order_policy != null ? v.boot_order_policy : null
      certificate_management_policy = v.certificate_management_policy != null ? v.certificate_management_policy : null
      description                   = v.description != null ? v.description : null
      device_connector_policy       = v.device_connector_policy != null ? v.device_connector_policy : null
      imc_access_policy             = v.imc_access_policy != null ? v.imc_access_policy : null
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy != null ? v.ipmi_over_lan_policy : null
      lan_connectivity_policy       = v.lan_connectivity_policy != null ? v.lan_connectivity_policy : null
      ldap_policy                   = v.ldap_policy != null ? v.ldap_policy : null
      local_user_policy             = v.local_user_policy != null ? v.local_user_policy : null
      network_connectivity_policy   = v.network_connectivity_policy != null ? v.network_connectivity_policy : null
      ntp_policy                    = v.ntp_policy != null ? v.ntp_policy : null
      organization                  = v.organization != null ? v.organization : "default"
      persistent_memory_policy      = v.persistent_memory_policy != null ? v.persistent_memory_policy : null
      power_policy                  = v.power_policy != null ? v.power_policy : null
      san_connectivity_policy       = v.san_connectivity_policy != null ? v.san_connectivity_policy : null
      sd_card_policy                = v.sd_card_policy != null ? v.sd_card_policy : null
      serial_number                 = v.serial_number != null ? v.serial_number : null
      serial_over_lan_policy        = v.serial_over_lan_policy != null ? v.serial_over_lan_policy : null
      smtp_policy                   = v.smtp_policy != null ? v.smtp_policy : null
      snmp_policy                   = v.snmp_policy != null ? v.snmp_policy : null
      ssh_policy                    = v.ssh_policy != null ? v.ssh_policy : null
      storage_policy                = v.storage_policy != null ? v.storage_policy : null
      syslog_policy                 = v.syslog_policy != null ? v.syslog_policy : null
      tags                          = v.tags != null ? v.tags : []
      target_platform               = v.target_platform != null ? v.target_platform : "FIAttached"
      ucs_server_profile_template   = v.ucs_server_profile_template != null ? v.ucs_server_profile_template : null
      virtual_kvm_policy            = v.virtual_kvm_policy != null ? v.virtual_kvm_policy : null
      virtual_media_policy          = v.virtual_media_policy != null ? v.virtual_media_policy : null
      wait_for_completion           = v.wait_for_completion != null ? v.wait_for_completion : false
    }
  }


  #__________________________________________________________
  #
  # UCS Server Profile Templates Section - Locals
  #__________________________________________________________
  ucs_server_profile_templates = {
    for k, v in var.ucs_server_profile_templates : k => {
      adapter_policy                = v.adapter_policy != null ? v.adapter_policy : ""
      bios_policy                   = v.bios_policy != null ? v.bios_policy : ""
      boot_order_policy             = v.boot_order_policy != null ? v.boot_order_policy : ""
      certificate_management_policy = v.certificate_management_policy != null ? v.certificate_management_policy : ""
      description                   = v.description != null ? v.description : ""
      device_connector_policy       = v.device_connector_policy != null ? v.device_connector_policy : ""
      imc_access_policy             = v.imc_access_policy != null ? v.imc_access_policy : ""
      ipmi_over_lan_policy          = v.ipmi_over_lan_policy != null ? v.ipmi_over_lan_policy : ""
      lan_connectivity_policy       = v.lan_connectivity_policy != null ? v.lan_connectivity_policy : ""
      ldap_policy                   = v.ldap_policy != null ? v.ldap_policy : ""
      local_user_policy             = v.local_user_policy != null ? v.local_user_policy : ""
      network_connectivity_policy   = v.network_connectivity_policy != null ? v.network_connectivity_policy : ""
      ntp_policy                    = v.ntp_policy != null ? v.ntp_policy : ""
      operating_system              = v.operating_system != null ? v.operating_system : "VMware"
      organization                  = v.organization != null ? v.organization : "default"
      persistent_memory_policy      = v.persistent_memory_policy != null ? v.persistent_memory_policy : ""
      power_policy                  = v.power_policy != null ? v.power_policy : ""
      san_connectivity_policy       = v.san_connectivity_policy != null ? v.san_connectivity_policy : ""
      sd_card_policy                = v.sd_card_policy != null ? v.sd_card_policy : ""
      serial_over_lan_policy        = v.serial_over_lan_policy != null ? v.serial_over_lan_policy : ""
      smtp_policy                   = v.smtp_policy != null ? v.smtp_policy : ""
      snmp_policy                   = v.snmp_policy != null ? v.snmp_policy : ""
      ssh_policy                    = v.ssh_policy != null ? v.ssh_policy : ""
      storage_policy                = v.storage_policy != null ? v.storage_policy : ""
      syslog_policy                 = v.syslog_policy != null ? v.syslog_policy : ""
      tags                          = v.tags != null ? v.tags : []
      target_platform               = v.target_platform != null ? v.target_platform : "FIAttached"
      virtual_kvm_policy            = v.virtual_kvm_policy != null ? v.virtual_kvm_policy : ""
      virtual_media_policy          = v.virtual_media_policy != null ? v.virtual_media_policy : ""
    }
  }

  merge_with_templates = flatten([
    for key, value in local.ucs_server_profile_templates : [
      for k, v in local.ucs_server_loop_1 : {
        action                        = v.action
        adapter_policy                = v.adapter_policy != null ? v.adapter_policy : value.adapter_policy
        assign_server                 = v.assign_server
        bios_policy                   = v.bios_policy != null ? v.bios_policy : value.bios_policy
        boot_order_policy             = v.boot_order_policy != null ? v.boot_order_policy : value.boot_order_policy
        certificate_management_policy = v.certificate_management_policy != null ? v.certificate_management_policy : value.certificate_management_policy
        description                   = v.description != null ? v.description : value.description
        device_connector_policy       = v.device_connector_policy != null ? v.device_connector_policy : value.device_connector_policy
        imc_access_policy             = v.imc_access_policy != null ? v.imc_access_policy : value.imc_access_policy
        ipmi_over_lan_policy          = v.ipmi_over_lan_policy != null ? v.ipmi_over_lan_policy : value.ipmi_over_lan_policy
        lan_connectivity_policy       = v.lan_connectivity_policy != null ? v.lan_connectivity_policy : value.lan_connectivity_policy
        ldap_policy                   = v.ldap_policy != null ? v.ldap_policy : value.ldap_policy
        local_user_policy             = v.local_user_policy != null ? v.local_user_policy : value.local_user_policy
        network_connectivity_policy   = v.network_connectivity_policy != null ? v.network_connectivity_policy : value.network_connectivity_policy
        ntp_policy                    = v.ntp_policy != null ? v.ntp_policy : value.ntp_policy
        organization                  = v.organization != null ? v.organization : value.organization
        persistent_memory_policy      = v.persistent_memory_policy != null ? v.persistent_memory_policy : value.persistent_memory_policy
        key_name                      = k
        power_policy                  = v.power_policy != null ? v.power_policy : value.power_policy
        san_connectivity_policy       = v.san_connectivity_policy != null ? v.san_connectivity_policy : value.san_connectivity_policy
        sd_card_policy                = v.sd_card_policy != null ? v.sd_card_policy : value.sd_card_policy
        serial_number                 = v.serial_number
        serial_over_lan_policy        = v.serial_over_lan_policy != null ? v.serial_over_lan_policy : value.serial_over_lan_policy
        smtp_policy                   = v.smtp_policy != null ? v.smtp_policy : value.smtp_policy
        snmp_policy                   = v.snmp_policy != null ? v.snmp_policy : value.snmp_policy
        ssh_policy                    = v.ssh_policy != null ? v.ssh_policy : value.ssh_policy
        storage_policy                = v.storage_policy != null ? v.storage_policy : value.storage_policy
        syslog_policy                 = v.syslog_policy != null ? v.syslog_policy : value.syslog_policy
        tags                          = v.tags != null ? v.tags : value.tags
        target_platform               = v.target_platform != null ? v.target_platform : value.target_platform
        ucs_server_profile_template   = v.ucs_server_profile_template
        virtual_kvm_policy            = v.virtual_kvm_policy != null ? v.virtual_kvm_policy : value.virtual_kvm_policy
        virtual_media_policy          = v.virtual_media_policy != null ? v.virtual_media_policy : value.virtual_media_policy
        wait_for_completion           = v.wait_for_completion != null ? v.wait_for_completion : value.wait_for_completion
      } if v.ucs_server_profile_template == key
    ]
  ])

  ucs_server_profiles = {
    for k, v in local.merge_with_templates : v.key_name => v
  }

}


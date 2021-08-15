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

  # Terraform Cloud Remote Resources
  ip_pools   = data.terraform_remote_state.pools.outputs.ip_pools
  iqn_pools  = data.terraform_remote_state.pools.outputs.iqn_pools
  mac_pools  = data.terraform_remote_state.pools.outputs.mac_pools
  fc_pools   = data.terraform_remote_state.pools.outputs.fc_pools
  uuid_pools = data.terraform_remote_state.pools.outputs.uuid_pools
  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_server_profiles = {
    for k, v in var.ucs_server_profiles : k =>
    {
      for key, value in var.ucs_server_templates : "profile" =>
      {
        action                        = (v.action != null ? v.action : "No-op")
        assign_server                 = (v.assign_server != null ? v.assign_server : false)
        description                   = (v.description != null ? v.description : "")
        name                          = (v.name != null ? v.name : "")
        operating_system              = (value.operating_system != null ? value.operating_system : "vmware")
        organization                  = (value.organization != null ? value.organization : "default")
        policies_bios                 = (value.policies_bios != null ? value.policies_bios : "")
        policies_boot_order           = (value.policies_boot_order != null ? value.policies_boot_order : "")
        policies_device_connector     = (value.policies_device_connector != null ? value.policies_device_connector : "")
        policies_imc_access           = (value.policies_imc_access != null ? value.policies_imc_access : "")
        policies_ipmi_over_lan        = (value.policies_ipmi_over_lan != null ? value.policies_ipmi_over_lan : "")
        policies_lan_connectivity     = (value.policies_lan_connectivity != null ? value.policies_lan_connectivity : "")
        policies_ldap                 = (value.policies_ldap != null ? value.policies_ldap : "")
        policies_local_users          = (value.policies_local_users != null ? value.policies_local_users : "")
        policies_network_connectivity = (value.policies_network_connectivity != null ? value.policies_network_connectivity : "")
        policies_ntp                  = (value.policies_ntp != null ? value.policies_ntp : "")
        policies_persistent_memory    = (value.policies_persistent_memory != null ? value.policies_persistent_memory : "")
        policies_power                = (value.policies_power != null ? value.policies_power : "")
        policies_san_connectivity     = (value.policies_san_connectivity != null ? value.policies_san_connectivity : "")
        policies_sdcard               = (value.policies_sdcard != null ? value.policies_sdcard : "")
        policies_serial_over_lan      = (value.policies_serial_over_lan != null ? value.policies_serial_over_lan : "")
        policies_smtp                 = (value.policies_smtp != null ? value.policies_smtp : "")
        policies_snmp                 = (value.policies_snmp != null ? value.policies_snmp : "")
        policies_snmp_1_user          = (value.policies_snmp_1_user != null ? value.policies_snmp_1_user : "")
        policies_snmp_2_users         = (value.policies_snmp_2_users != null ? value.policies_snmp_2_users : "")
        policies_ssh                  = (value.policies_ssh != null ? value.policies_ssh : "")
        policies_storage              = (value.policies_storage != null ? value.policies_storage : "")
        policies_syslog               = (value.policies_syslog != null ? value.policies_syslog : "")
        policies_virtual_kvm          = (value.policies_virtual_kvm != null ? value.policies_virtual_kvm : "")
        policies_virtual_media        = (value.policies_virtual_media != null ? value.policies_virtual_media : "")
        tags                          = (v.tags != null ? v.tags : [])
        target_platform               = (value.target_platform != null ? value.target_platform : "FIAttached")
        type                          = "instance"
        wait_for_completion           = (v.wait_for_completion != null ? v.wait_for_completion : false)
      } if v.src_template == key
    }
  }


  #__________________________________________________________
  #
  # BIOS Policy Section Locals
  #__________________________________________________________

  policies_bios = {
    for k, v in var.policies_bios : k => {
      bios_policy  = (v.bios_policy != null ? v.bios_policy : "virtual_node")
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }

  #__________________________________________________________
  #
  # BOOT Policy Section Locals
  #__________________________________________________________

  policies_boot_order = {
    for k, v in var.policies_boot_order : k => {
      boot_policy  = (v.boot_policy != null ? v.boot_policy : "uefi_m2_raid")
      boot_secure  = (v.boot_secure != null ? v.boot_secure : true)
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }

  #__________________________________________________________
  #
  # Device Connector Policy Section Locals
  #__________________________________________________________

  policies_device_connector = {
    for k, v in var.policies_device_connector : k => {
      description  = (v.description != null ? v.description : "")
      lockout      = (v.lockout != null ? v.lockout : false)
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # IMC Access Policy Section Locals
  #__________________________________________________________

  policies_imc_access = {
    for k, v in var.policies_imc_access : k => {
      description  = (v.description != null ? v.description : "")
      inband_vlan  = (v.inband_vlan != null ? v.inband_vlan : 1)
      imc_ip_pool  = (v.imc_ip_pool != null ? v.imc_ip_pool : "")
      ipv4_enable  = (v.ipv4_enable != null ? v.ipv4_enable : true)
      ipv6_enable  = (v.ipv6_enable != null ? v.ipv6_enable : false)
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # IPMI over LAN Policy Section Locals
  #__________________________________________________________

  policies_ipmi_over_lan = {
    for k, v in var.policies_ipmi_over_lan : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      ipmi_key     = (v.ipmi_key != null ? v.ipmi_key : null)
      organization = (v.organization != null ? v.organization : "default")
      privilege    = (v.privilege != null ? v.privilege : "admin")
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # LDAP Policy Section Locals
  #__________________________________________________________

  policies_ldap = {
    for k, v in var.policies_ldap : k => {
      description                     = (v.description != null ? v.description : "")
      ldap_attribute                  = (v.ldap_attribute != null ? v.ldap_attribute : "CiscoAvPair")
      ldap_base_dn                    = (v.ldap_base_dn != null ? v.ldap_base_dn : "dc=example,dc=com")
      ldap_bind_dn                    = (v.ldap_bind_dn != null ? v.ldap_bind_dn : "")
      ldap_bind_method                = (v.ldap_bind_method != null ? v.ldap_bind_method : "LoginCredentials")
      ldap_domain                     = (v.ldap_domain != null ? v.ldap_domain : "example.com")
      ldap_enable_dns                 = (v.ldap_enable_dns != null ? v.ldap_enable_dns : false)
      ldap_enable_encryption          = (v.ldap_enable_encryption != null ? v.ldap_enable_encryption : false)
      ldap_enable_group_authorization = (v.ldap_enable_group_authorization != null ? v.ldap_enable_group_authorization : false)
      ldap_enabled                    = (v.ldap_enabled != null ? v.ldap_enabled : true)
      ldap_filter                     = (v.ldap_filter != null ? v.ldap_filter : "samAccountName")
      ldap_group_attribute            = (v.ldap_group_attribute != null ? v.ldap_group_attribute : "memberOf")
      ldap_nested_group_search_depth  = (v.ldap_nested_group_search_depth != null ? v.ldap_nested_group_search_depth : 128)
      ldap_nr_source                  = (v.ldap_nr_source != null ? v.ldap_nr_source : "Extracted")
      ldap_search_domain              = (v.ldap_search_domain != null ? v.ldap_search_domain : "")
      ldap_search_forest              = (v.ldap_search_forest != null ? v.ldap_search_forest : "")
      ldap_timeout                    = (v.ldap_timeout != null ? v.ldap_timeout : 0)
      ldap_user_search_precedence     = (v.ldap_user_search_precedence != null ? v.ldap_user_search_precedence : "LocalUserDb")
      organization                    = (v.organization != null ? v.organization : "default")
      tags                            = (v.tags != null ? v.tags : [])
    }
  }

  ldap_servers = {
    for k, v in var.policies_ldap : "ldap_servers" =>
    {
      for key, value in v.ldap_servers : "${k}_${key}" =>
      {
        ldap_port   = (value.ldap_port != null ? value.ldap_port : 389)
        ldap_server = (value.ldap_server != null ? value.ldap_server : 1)
        policy      = k
      }
    }
  }

  ldap_groups = {
    for k, v in var.policies_ldap : "ldap_groups" =>
    {
      for key, value in v.ldap_groups : "${k}_${key}" =>
      {
        group_role  = (value.group_role != null ? value.group_role : "admin")
        ldap_domain = (v.ldap_domain != null ? v.ldap_domain : "example.com")
        ldap_group  = key
        policy      = k
      }
    }
  }

  #__________________________________________________________
  #
  # Local User Policy Section Locals
  #__________________________________________________________

  policies_local_users = {
    for k, v in var.policies_local_users : k => {
      description              = (v.description != null ? v.description : "")
      enforce_strong_password  = (v.enforce_strong_password != null ? v.enforce_strong_password : true)
      force_send_password      = (v.force_send_password != null ? v.force_send_password : false)
      grace_period             = (v.grace_period != null ? v.grace_period : 0)
      notification_period      = (v.notification_period != null ? v.notification_period : 15)
      organization             = (v.organization != null ? v.organization : "default")
      password_expiry          = (v.password_expiry != null ? v.password_expiry : false)
      password_expiry_duration = (v.password_expiry_duration != null ? v.password_expiry_duration : 90)
      password_history         = (v.password_history != null ? v.password_history : 5)
      tags                     = (v.tags != null ? v.tags : [])
      users                    = (v.users != null ? v.users : {})
    }
  }

  local_users = {
    for k, v in var.policies_local_users : "users" =>
    {
      for key, value in v.users : "${k}_${key}" =>
      {
        enabled      = (value.enabled != null ? value.enabled : true)
        password     = (value.password != null ? value.password : 1)
        role         = (value.role != null ? value.role : "admin")
        policy       = k
        organization = (v.organization != null ? v.organization : "default")
        username     = key
      }
    }
  }


  #__________________________________________________________
  #
  # Network Connectivity (DNS) Policy Section Locals
  #__________________________________________________________

  policies_network_connectivity = {
    for k, v in var.policies_network_connectivity : k => {
      description    = (v.description != null ? v.description : "")
      dns_servers_v4 = (v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"])
      dns_servers_v6 = (v.dns_servers_v6 != null ? v.dns_servers_v6 : [])
      dynamic_dns    = (v.dynamic_dns != null ? v.dynamic_dns : false)
      ipv6_enable    = (v.ipv6_enable != null ? v.ipv6_enable : false)
      organization   = (v.organization != null ? v.organization : "default")
      tags           = (v.tags != null ? v.tags : [])
      update_domain  = (v.update_domain != null ? v.update_domain : "")
    }
  }


  #__________________________________________________________
  #
  # NTP Policy Section Locals
  #__________________________________________________________

  policies_ntp = {
    for k, v in var.policies_ntp : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      ntp_servers  = (v.ntp_servers != null ? v.ntp_servers : ["time-a-g.nist.gov", "time-b-g.nist.gov"])
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
      timezone     = (v.timezone != null ? v.timezone : "Etc/GMT")
    }
  }


  #__________________________________________________________
  #
  # Persistent Memory Policy Section Locals
  #__________________________________________________________

  policies_persistent_memory = {
    for k, v in var.policies_persistent_memory : k => {
      description                  = (v.description != null ? v.description : "")
      goals_memory_percentage      = (v.goals_memory_percentage != null ? v.goals_memory_percentage : 0)
      goals_persistent_memory_type = (v.goals_persistent_memory_type != null ? v.goals_persistent_memory_type : "app-direct")
      logical_namespaces           = (v.logical_namespaces != null ? v.logical_namespaces : [])
      management_mode              = (v.management_mode != null ? v.management_mode : "configured-from-intersight")
      organization                 = (v.organization != null ? v.organization : "default")
      retain_namespaces            = (v.retain_namespaces != null ? v.retain_namespaces : true)
      tags                         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # Power Policy Section Locals
  #__________________________________________________________

  policies_power = {
    for k, v in var.policies_power : k => {
      allocated_budget    = (v.allocated_budget != null ? v.allocated_budget : 0)
      description         = (v.description != null ? v.description : "")
      organization        = (v.organization != null ? v.organization : "default")
      power_profiling     = (v.power_profiling != null ? v.power_profiling : "Enabled")
      power_restore_state = (v.power_restore_state != null ? v.power_restore_state : "LastState")
      tags                = (v.tags != null ? v.tags : [])
      redundancy_mode     = (v.redundancy_mode != null ? v.redundancy_mode : "Grid")
    }
  }


  #__________________________________________________________
  #
  # Serial over LAN Policy Section Locals
  #__________________________________________________________

  policies_serial_over_lan = {
    for k, v in var.policies_serial_over_lan : k => {
      baud_rate    = (v.baud_rate != null ? v.baud_rate : 115200)
      com_port     = (v.com_port != null ? v.com_port : "com0")
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      organization = (v.organization != null ? v.organization : "default")
      ssh_port     = (v.ssh_port != null ? v.ssh_port : 2400)
      tags         = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # SMTP Policy Section Locals
  #__________________________________________________________

  policies_smtp = {
    for k, v in var.policies_smtp : k => {
      description     = (v.description != null ? v.description : "")
      enabled         = (v.enabled != null ? v.enabled : true)
      min_severity    = (v.min_severity != null ? v.min_severity : "critical")
      organization    = (v.organization != null ? v.organization : "default")
      sender_email    = (v.sender_email != null ? v.sender_email : "")
      smtp_port       = (v.smtp_port != null ? v.smtp_port : 25)
      smtp_recipients = (v.smtp_recipients != null ? v.smtp_recipients : [])
      smtp_server     = (v.smtp_server != null ? v.smtp_server : "")
      tags            = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # SNMP Policy Section Locals
  #__________________________________________________________

  policies_snmp = {
    for k, v in var.policies_snmp : k => {
      description                = (v.description != null ? v.description : "")
      enabled                    = (v.enabled != null ? v.enabled : true)
      organization               = (v.organization != null ? v.organization : "default")
      snmp_access                = (v.snmp_access != null ? v.snmp_access : "Full")
      snmp_engine_id             = (v.snmp_engine_id != null ? v.snmp_engine_id : "")
      snmp_port                  = (v.snmp_port != null ? v.snmp_port : 161)
      snmp_trap_destinations     = (v.snmp_trap_destinations != null ? v.snmp_trap_destinations : [])
      snmp_user_1_auth_type      = (v.snmp_user_1_auth_type != null ? v.snmp_user_1_auth_type : "SHA")
      snmp_user_1_name           = (v.snmp_user_1_name != null ? v.snmp_user_1_name : "")
      snmp_user_1_security_level = (v.snmp_user_1_security_level != null ? v.snmp_user_1_security_level : "AuthPriv")
      snmp_user_2_auth_type      = (v.snmp_user_2_auth_type != null ? v.snmp_user_2_auth_type : "SHA")
      snmp_user_2_name           = (v.snmp_user_2_name != null ? v.snmp_user_2_name : "")
      snmp_user_2_security_level = (v.snmp_user_2_security_level != null ? v.snmp_user_2_security_level : "AuthPriv")
      system_contact             = (v.system_contact != null ? v.system_contact : "")
      system_location            = (v.system_location != null ? v.system_location : "")
      tags                       = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # SSH Policy Section Locals
  #__________________________________________________________

  policies_ssh = {
    for k, v in var.policies_ssh : k => {
      description  = (v.description != null ? v.description : "")
      enabled      = (v.enabled != null ? v.enabled : true)
      organization = (v.organization != null ? v.organization : "default")
      ssh_port     = (v.ssh_port != null ? v.ssh_port : 22)
      tags         = (v.tags != null ? v.tags : [])
      timeout      = (v.timeout != null ? v.timeout : 1800)
    }
  }


  #__________________________________________________________
  #
  # Storage Policy Section Locals
  #__________________________________________________________

  policies_storage = {
    for k, v in var.policies_storage : k => {
      access_policy = (v.access_policy != null ? v.access_policy : "Default")
      boot_drive    = (v.boot_drive != null ? v.boot_drive : true)
      description   = (v.description != null ? v.description : "")
      disks_group_0 = (v.disks_group_0 != null ? v.disks_group_0 : [1, 2])
      disks_group_1 = (v.disks_group_1 != null ? v.disks_group_1 : [])
      drive_cache   = (v.drive_cache != null ? v.drive_cache : "Default")
      drive_name    = (v.drive_name != null ? v.drive_name : "vd0")
      io_policy     = (v.io_policy != null ? v.io_policy : "Default")
      organization  = (v.organization != null ? v.organization : "default")
      raid_level    = (v.raid_level != null ? v.raid_level : "Raid1")
      read_policy   = (v.read_policy != null ? v.read_policy : "Default")
      retain_policy = (v.retain_policy != null ? v.retain_policy : true)
      stripe_size   = (v.stripe_size != null ? v.stripe_size : "Default")
      tags          = (v.tags != null ? v.tags : [])
      unused_disks  = (v.unused_disks != null ? v.unused_disks : "UnconfiguredGood")
      use_jbods     = (v.use_jbods != null ? v.use_jbods : true)
      write_policy  = (v.write_policy != null ? v.write_policy : "Default")
    }
  }


  #__________________________________________________________
  #
  # Syslog Policy Section Locals
  #__________________________________________________________

  policies_syslog = {
    for k, v in var.policies_syslog : k => {
      description         = (v.description != null ? v.description : "")
      local_min_severity  = (v.local_min_severity != null ? v.local_min_severity : "warning")
      organization        = (v.organization != null ? v.organization : "default")
      syslog_destinations = (v.syslog_destinations != null ? v.syslog_destinations : [])
      tags                = (v.tags != null ? v.tags : [])
    }
  }


  #__________________________________________________________
  #
  # vHBA SAN Connectivity Section Locals
  #__________________________________________________________

  policies_vhba_san_connectivity = {
    for k, v in var.policies_vhba_san_connectivity : k => {
      adapter_template             = (v.adapter_template != null ? v.adapter_template : "VMware")
      description                  = (v.description != null ? v.description : "")
      organization                 = (v.organization != null ? v.organization : "default")
      placement_mode               = (v.placement_mode != null ? v.placement_mode : "custom")
      target_platform              = (v.target_platform != null ? v.target_platform : "FIAttached")
      qos_burst                    = (v.qos_burst != null ? v.qos_burst : 1024)
      qos_cos                      = (v.qos_cos != null ? v.qos_cos : 3)
      qos_max_data_field_size      = (v.qos_max_data_field_size != null ? v.qos_max_data_field_size : 2112)
      qos_rate_limit               = (v.qos_rate_limit != null ? v.qos_rate_limit : 0)
      tags                         = (v.tags != null ? v.tags : [])
      vsan_a                       = (v.vsan_a != null ? v.vsan_a : 100)
      vsan_a_default_vlan_id       = (v.vsan_a_default_vlan_id != null ? v.vsan_a_default_vlan_id : 0)
      vsan_b                       = (v.vsan_b != null ? v.vsan_b : 200)
      vsan_b_default_vlan_id       = (v.vsan_b_default_vlan_id != null ? v.vsan_b_default_vlan_id : 0)
      vhba_name_a                  = (v.vhba_name_a != null ? v.vhba_name_a : "vhba-a")
      vhba_name_b                  = (v.vhba_name_b != null ? v.vhba_name_b : "vhba-b")
      vhba_order_a                 = (v.vhba_order_a != null ? v.vhba_order_a : 2)
      vhba_order_b                 = (v.vhba_order_b != null ? v.vhba_order_b : 3)
      vhba_persistent_lun_bindings = (v.vhba_persistent_lun_bindings != null ? v.vhba_persistent_lun_bindings : false)
      vhba_placement_pci_link_a    = (v.vhba_placement_pci_link_a != null ? v.vhba_placement_pci_link_a : 0)
      vhba_placement_pci_link_b    = (v.vhba_placement_pci_link_b != null ? v.vhba_placement_pci_link_b : 0)
      vhba_placement_slot_id       = (v.vhba_placement_slot_id != null ? v.vhba_placement_slot_id : "MLOM")
      vhba_placement_switch_a      = (v.vhba_placement_switch_a != null ? v.vhba_placement_switch_a : "A")
      vhba_placement_switch_b      = (v.vhba_placement_switch_b != null ? v.vhba_placement_switch_b : "B")
      vhba_placement_uplink        = (v.vhba_placement_uplink != null ? v.vhba_placement_uplink : 0)
      vhba_type                    = (v.vhba_type != null ? v.vhba_type : "fc-initiator")
      wwnn_address_static          = (v.wwnn_address_static != null ? v.wwnn_address_static : "")
      wwnn_address_type            = (v.wwnn_address_type != null ? v.wwnn_address_type : "POOL")
      wwnn_pool                    = (v.wwnn_pool != null ? v.wwnn_pool : "")
      wwpn_address_a_static        = (v.wwpn_address_a_static != null ? v.wwpn_address_a_static : "")
      wwpn_address_b_static        = (v.wwpn_address_b_static != null ? v.wwpn_address_b_static : "")
      wwpn_address_type            = (v.wwpn_address_type != null ? v.wwpn_address_type : "POOL")
      wwpn_pool_a_name             = (v.wwpn_pool_a_name != null ? v.wwpn_pool_a_name : "")
      wwpn_pool_b_name             = (v.wwpn_pool_b_name != null ? v.wwpn_pool_b_name : "")
    }
  }


  #__________________________________________________________
  #
  # Virtual KVM Policy Section Locals
  #__________________________________________________________

  policies_virtual_kvm = {
    for k, v in var.policies_virtual_kvm : k => {
      description        = (v.description != null ? v.description : "")
      enabled            = (v.enabled != null ? v.enabled : true)
      local_server_video = (v.local_server_video != null ? v.local_server_video : true)
      maximum_sessions   = (v.maximum_sessions != null ? v.maximum_sessions : 4)
      organization       = (v.organization != null ? v.organization : "default")
      remote_port        = (v.remote_port != null ? v.remote_port : 2068)
      tags               = (v.tags != null ? v.tags : [])
      video_encryption   = (v.video_encryption != null ? v.video_encryption : false)
    }
  }


  #__________________________________________________________
  #
  # Virtual Media Policy Section Locals
  #__________________________________________________________

  policies_virtual_media = {
    for k, v in var.policies_virtual_media : k => {
      description     = (v.description != null ? v.description : "")
      enabled         = (v.enabled != null ? v.enabled : true)
      encryption      = (v.encryption != null ? v.encryption : true)
      low_power_usb   = (v.low_power_usb != null ? v.low_power_usb : false)
      organization    = (v.organization != null ? v.organization : "default")
      tags            = (v.tags != null ? v.tags : [])
      vmedia_mappings = (v.vmedia_mappings != null ? v.vmedia_mappings : [])
    }
  }


  #__________________________________________________________
  #
  # vNIC LAN Connectivity Section Locals
  #__________________________________________________________

  policies_vnic_lan_connectivity = {
    for k, v in var.policies_vnic_lan_connectivity : k => {
      description         = (v.description != null ? v.description : "")
      iqn_allocation_type = (v.iqn_allocation_type != null ? v.iqn_allocation_type : "None")
      iqn_static_name     = (v.iqn_static_name != null ? v.iqn_static_name : "")
      iqn_pool            = (v.iqn_pool != null ? v.iqn_pool : [])
      organization        = (v.organization != null ? v.organization : "default")
      placement_mode      = (v.placement_mode != null ? v.placement_mode : "custom")
      tags                = (v.tags != null ? v.tags : [])
      target_platform     = (v.target_platform != null ? v.target_platform : "FIAttached")
    }
  }


  #__________________________________________________________
  #
  # vNIC Template Section Locals
  #__________________________________________________________

  policies_vnic_templates = {
    for k, v in var.policies_vnic_templates : k => {
      adapter_template          = (v.adapter_template != null ? v.adapter_template : "VMware")
      description               = (v.description != null ? v.description : "")
      lan_connectivity          = (v.lan_connectivity != null ? v.lan_connectivity : "default")
      mac_address_a_static      = (v.mac_address_a_static != null ? v.mac_address_a_static : "")
      mac_address_b_static      = (v.mac_address_b_static != null ? v.mac_address_b_static : "")
      mac_address_type          = (v.mac_address_type != null ? v.mac_address_type : "POOL")
      mac_forge                 = (v.mac_forge != null ? v.mac_forge : "allow")
      mac_pool_a_name           = (v.mac_pool_a_name != null ? v.mac_pool_a_name : "")
      mac_pool_b_name           = (v.mac_pool_b_name != null ? v.mac_pool_b_name : "")
      mac_registration_mode     = (v.mac_registration_mode != null ? v.mac_registration_mode : "nativeVlanOnly")
      neighbor_discovery        = (v.neighbor_discovery != null ? v.neighbor_discovery : "none")
      organization              = (v.organization != null ? v.organization : "default")
      qos_burst                 = (v.qos_burst != null ? v.qos_burst : 1024)
      qos_cos                   = (v.qos_cos != null ? v.qos_cos : 0)
      qos_mtu                   = (v.qos_mtu != null ? v.qos_mtu : 1500)
      qos_priority              = (v.qos_priority != null ? v.qos_priority : "")
      qos_rate_limit            = (v.qos_rate_limit != null ? v.qos_rate_limit : 0)
      qos_trust_host_cos        = (v.qos_trust_host_cos != null ? v.qos_trust_host_cos : false)
      tags                      = (v.tags != null ? v.tags : [])
      uplink_fail_action        = (v.uplink_fail_action != null ? v.uplink_fail_action : "linkDown")
      usnic_cos                 = (v.usnic_cos != null ? v.usnic_cos : 5)
      usnic_count               = (v.usnic_count != null ? v.usnic_count : 0)
      usnic_adapter_policy_moid = (v.usnic_adapter_policy_moid != null ? v.usnic_adapter_policy_moid : "")
      vlan_native_vlan          = (v.vlan_native_vlan != null ? v.vlan_native_vlan : null)
      vlan_list                 = (v.vlan_list != null ? v.vlan_list : "2-10,30-40")
      vmq_enabled               = (v.vmq_enabled != null ? v.vmq_enabled : false)
      vmq_multi_queue_support   = (v.vmq_multi_queue_support != null ? v.vmq_multi_queue_support : false)
      vmq_interrupts            = (v.vmq_interrupts != null ? v.vmq_interrupts : 16)
      vmq_number_queues         = (v.vmq_number_queues != null ? v.vmq_number_queues : 4)
      vmq_number_sub_vnics      = (v.vmq_number_sub_vnics != null ? v.vmq_number_sub_vnics : 64)
      vmq_adapter_policy_moid   = (v.vmq_adapter_policy_moid != null ? v.vmq_adapter_policy_moid : "")
      vnic_cdn_a_name           = (v.vnic_cdn_a_name != null ? v.vnic_cdn_a_name : null)
      vnic_cdn_b_name           = (v.vnic_cdn_b_name != null ? v.vnic_cdn_b_name : null)
      vnic_cdn_source           = (v.vnic_cdn_source != null ? v.vnic_cdn_source : "vnic")
      vnic_failover_enabled     = (v.vnic_failover_enabled != null ? v.vnic_failover_enabled : false)
      vnic_name_a               = (v.vnic_name_a != null ? v.vnic_name_a : "vnic-a")
      vnic_name_b               = (v.vnic_name_b != null ? v.vnic_name_b : "vnic-b")
      vnic_order_a              = (v.vnic_order_a != null ? v.vnic_order_a : 0)
      vnic_order_b              = (v.vnic_order_b != null ? v.vnic_order_b : 0)
      vnic_placement_pci_link_a = (v.vnic_placement_pci_link_a != null ? v.vnic_placement_pci_link_a : 0)
      vnic_placement_pci_link_b = (v.vnic_placement_pci_link_b != null ? v.vnic_placement_pci_link_b : 0)
      vnic_placement_slot_id    = (v.vnic_placement_slot_id != null ? v.vnic_placement_slot_id : "MLOM")
      vnic_placement_switch_a   = (v.vnic_placement_switch_a != null ? v.vnic_placement_switch_a : "A")
      vnic_placement_switch_b   = (v.vnic_placement_switch_b != null ? v.vnic_placement_switch_b : "B")
      vnic_placement_uplink     = (v.vnic_placement_uplink != null ? v.vnic_placement_uplink : 0)
    }
  }


  #____________________________________________________________
  #
  # BIOS Policy - Custom BIOS Policy
  # GUI Location: Policies > Create Policy: BIOS
  #____________________________________________________________
  #   custom_bios_policy = {
  #     for k, v in var.custom_bios_policy : k => {
  #       description                           = (v.description != null ? v.description : "")
  #       tags                                  = (v.tags != null ? v.tags : [])
  #       boot_option_num_retry                 = (v.boot_option_num_retry != null ? v.boot_option_num_retry : "platform-default")
  #       boot_option_re_cool_down              = (v.boot_option_re_cool_down != null ? v.boot_option_re_cool_down : "platform-default")
  #       boot_option_retry                     = (v.boot_option_retry != null ? v.boot_option_retry : "platform-default")
  #       ipv4http                              = (v.ipv4http != null ? v.ipv4http : "platform-default")
  #       ipv4pxe                               = (v.ipv4pxe != null ? v.ipv4pxe : "platform-default")
  #       ipv6http                              = (v.ipv6http != null ? v.ipv6http : "platform-default")
  #       ipv6pxe                               = (v.ipv6pxe != null ? v.ipv6pxe : "platform-default")
  #       network_stack                         = (v.network_stack != null ? v.network_stack : "platform-default")
  #       onboard_scu_storage_support           = (v.onboard_scu_storage_support != null ? v.onboard_scu_storage_support : "platform-default")
  #       onboard_scu_storage_sw_stack          = (v.onboard_scu_storage_sw_stack != null ? v.onboard_scu_storage_sw_stack : "platform-default")
  #       pop_support                           = (v.pop_support != null ? v.pop_support : "platform-default")
  #       psata                                 = (v.psata != null ? v.psata : "platform-default")
  #       sata_mode_select                      = (v.sata_mode_select != null ? v.sata_mode_select : "platform-default")
  #       vmd_enable                            = (v.vmd_enable != null ? v.vmd_enable : "platform-default")
  #       intel_vt_for_directed_io              = (v.intel_vt_for_directed_io != null ? v.intel_vt_for_directed_io : "platform-default")
  #       intel_vtd_coherency_support           = (v.intel_vtd_coherency_support != null ? v.intel_vtd_coherency_support : "platform-default")
  #       intel_vtd_interrupt_remapping         = (v.intel_vtd_interrupt_remapping != null ? v.intel_vtd_interrupt_remapping : "platform-default")
  #       intel_vtd_pass_through_dma_support    = (v.intel_vtd_pass_through_dma_support != null ? v.intel_vtd_pass_through_dma_support : "platform-default")
  #       intel_vtdats_support                  = (v.intel_vtdats_support != null ? v.intel_vtdats_support : "platform-default")
  #       acs_control_gpu1state                 = (v.acs_control_gpu1state != null ? v.acs_control_gpu1state : "platform-default")
  #       acs_control_gpu2state                 = (v.acs_control_gpu2state != null ? v.acs_control_gpu2state : "platform-default")
  #       acs_control_gpu3state                 = (v.acs_control_gpu3state != null ? v.acs_control_gpu3state : "platform-default")
  #       acs_control_gpu4state                 = (v.acs_control_gpu4state != null ? v.acs_control_gpu4state : "platform-default")
  #       acs_control_gpu5state                 = (v.acs_control_gpu5state != null ? v.acs_control_gpu5state : "platform-default")
  #       acs_control_gpu6state                 = (v.acs_control_gpu6state != null ? v.acs_control_gpu6state : "platform-default")
  #       acs_control_gpu7state                 = (v.acs_control_gpu7state != null ? v.acs_control_gpu7state : "platform-default")
  #       acs_control_gpu8state                 = (v.acs_control_gpu8state != null ? v.acs_control_gpu8state : "platform-default")
  #       acs_control_slot11state               = (v.acs_control_slot11state != null ? v.acs_control_slot11state : "platform-default")
  #       acs_control_slot12state               = (v.acs_control_slot12state != null ? v.acs_control_slot12state : "platform-default")
  #       acs_control_slot13state               = (v.acs_control_slot13state != null ? v.acs_control_slot13state : "platform-default")
  #       acs_control_slot14state               = (v.acs_control_slot14state != null ? v.acs_control_slot14state : "platform-default")
  #       cdn_support                           = (v.cdn_support != null ? v.cdn_support : "platform-default")
  #       edpc_en                               = (v.edpc_en != null ? v.edpc_en : "platform-default")
  #       enable_clock_spread_spec              = (v.enable_clock_spread_spec != null ? v.enable_clock_spread_spec : "platform-default")
  #       lom_port0state                        = (v.lom_port0state != null ? v.lom_port0state : "platform-default")
  #       lom_port1state                        = (v.lom_port1state != null ? v.lom_port1state : "platform-default")
  #       lom_port2state                        = (v.lom_port2state != null ? v.lom_port2state : "platform-default")
  #       lom_port3state                        = (v.lom_port3state != null ? v.lom_port3state : "platform-default")
  #       lom_ports_all_state                   = (v.lom_ports_all_state != null ? v.lom_ports_all_state : "platform-default")
  #       pci_option_ro_ms                      = (v.pci_option_ro_ms != null ? v.pci_option_ro_ms : "platform-default")
  #       pci_rom_clp                           = (v.pci_rom_clp != null ? v.pci_rom_clp : "platform-default")
  #       pcie_ari_support                      = (v.pcie_ari_support != null ? v.pcie_ari_support : "platform-default")
  #       pcie_pll_ssc                          = (v.pcie_pll_ssc != null ? v.pcie_pll_ssc : "platform-default")
  #       pcie_slot_mraid1link_speed            = (v.pcie_slot_mraid1link_speed != null ? v.pcie_slot_mraid1link_speed : "platform-default")
  #       pcie_slot_mraid1option_rom            = (v.pcie_slot_mraid1option_rom != null ? v.pcie_slot_mraid1option_rom : "platform-default")
  #       pcie_slot_mraid2link_speed            = (v.pcie_slot_mraid2link_speed != null ? v.pcie_slot_mraid2link_speed : "platform-default")
  #       pcie_slot_mraid2option_rom            = (v.pcie_slot_mraid2option_rom != null ? v.pcie_slot_mraid2option_rom : "platform-default")
  #       pcie_slot_mstorraid_link_speed        = (v.pcie_slot_mstorraid_link_speed != null ? v.pcie_slot_mstorraid_link_speed : "platform-default")
  #       pcie_slot_mstorraid_option_rom        = (v.pcie_slot_mstorraid_option_rom != null ? v.pcie_slot_mstorraid_option_rom : "platform-default")
  #       pcie_slot_nvme1link_speed             = (v.pcie_slot_nvme1link_speed != null ? v.pcie_slot_nvme1link_speed : "platform-default")
  #       pcie_slot_nvme1option_rom             = (v.pcie_slot_nvme1option_rom != null ? v.pcie_slot_nvme1option_rom : "platform-default")
  #       pcie_slot_nvme2link_speed             = (v.pcie_slot_nvme2link_speed != null ? v.pcie_slot_nvme2link_speed : "platform-default")
  #       pcie_slot_nvme2option_rom             = (v.pcie_slot_nvme2option_rom != null ? v.pcie_slot_nvme2option_rom : "platform-default")
  #       pcie_slot_nvme3link_speed             = (v.pcie_slot_nvme3link_speed != null ? v.pcie_slot_nvme3link_speed : "platform-default")
  #       pcie_slot_nvme3option_rom             = (v.pcie_slot_nvme3option_rom != null ? v.pcie_slot_nvme3option_rom : "platform-default")
  #       pcie_slot_nvme4link_speed             = (v.pcie_slot_nvme4link_speed != null ? v.pcie_slot_nvme4link_speed : "platform-default")
  #       pcie_slot_nvme4option_rom             = (v.pcie_slot_nvme4option_rom != null ? v.pcie_slot_nvme4option_rom : "platform-default")
  #       pcie_slot_nvme5link_speed             = (v.pcie_slot_nvme5link_speed != null ? v.pcie_slot_nvme5link_speed : "platform-default")
  #       pcie_slot_nvme5option_rom             = (v.pcie_slot_nvme5option_rom != null ? v.pcie_slot_nvme5option_rom : "platform-default")
  #       pcie_slot_nvme6link_speed             = (v.pcie_slot_nvme6link_speed != null ? v.pcie_slot_nvme6link_speed : "platform-default")
  #       pcie_slot_nvme6option_rom             = (v.pcie_slot_nvme6option_rom != null ? v.pcie_slot_nvme6option_rom : "platform-default")
  #       slot10link_speed                      = (v.slot10link_speed != null ? v.slot10link_speed : "platform-default")
  #       slot10state                           = (v.slot10state != null ? v.slot10state : "platform-default")
  #       slot11link_speed                      = (v.slot11link_speed != null ? v.slot11link_speed : "platform-default")
  #       slot11state                           = (v.slot11state != null ? v.slot11state : "platform-default")
  #       slot12link_speed                      = (v.slot12link_speed != null ? v.slot12link_speed : "platform-default")
  #       slot12state                           = (v.slot12state != null ? v.slot12state : "platform-default")
  #       slot13state                           = (v.slot13state != null ? v.slot13state : "platform-default")
  #       slot14state                           = (v.slot14state != null ? v.slot14state : "platform-default")
  #       slot1link_speed                       = (v.slot1link_speed != null ? v.slot1link_speed : "platform-default")
  #       slot1state                            = (v.slot1state != null ? v.slot1state : "platform-default")
  #       slot2link_speed                       = (v.slot2link_speed != null ? v.slot2link_speed : "platform-default")
  #       slot2state                            = (v.slot2state != null ? v.slot2state : "platform-default")
  #       slot3link_speed                       = (v.slot3link_speed != null ? v.slot3link_speed : "platform-default")
  #       slot3state                            = (v.slot3state != null ? v.slot3state : "platform-default")
  #       slot4link_speed                       = (v.slot4link_speed != null ? v.slot4link_speed : "platform-default")
  #       slot4state                            = (v.slot4state != null ? v.slot4state : "platform-default")
  #       slot5link_speed                       = (v.slot5link_speed != null ? v.slot5link_speed : "platform-default")
  #       slot5state                            = (v.slot5state != null ? v.slot5state : "platform-default")
  #       slot6link_speed                       = (v.slot6link_speed != null ? v.slot6link_speed : "platform-default")
  #       slot6state                            = (v.slot6state != null ? v.slot6state : "platform-default")
  #       slot7link_speed                       = (v.slot7link_speed != null ? v.slot7link_speed : "platform-default")
  #       slot7state                            = (v.slot7state != null ? v.slot7state : "platform-default")
  #       slot8link_speed                       = (v.slot8link_speed != null ? v.slot8link_speed : "platform-default")
  #       slot8state                            = (v.slot8state != null ? v.slot8state : "platform-default")
  #       slot9link_speed                       = (v.slot9link_speed != null ? v.slot9link_speed : "platform-default")
  #       slot9state                            = (v.slot9state != null ? v.slot9state : "platform-default")
  #       slot_flom_link_speed                  = (v.slot_flom_link_speed != null ? v.slot_flom_link_speed : "platform-default")
  #       slot_front_nvme10link_speed           = (v.slot_front_nvme10link_speed != null ? v.slot_front_nvme10link_speed : "platform-default")
  #       slot_front_nvme10option_rom           = (v.slot_front_nvme10option_rom != null ? v.slot_front_nvme10option_rom : "platform-default")
  #       slot_front_nvme11link_speed           = (v.slot_front_nvme11link_speed != null ? v.slot_front_nvme11link_speed : "platform-default")
  #       slot_front_nvme11option_rom           = (v.slot_front_nvme11option_rom != null ? v.slot_front_nvme11option_rom : "platform-default")
  #       slot_front_nvme12link_speed           = (v.slot_front_nvme12link_speed != null ? v.slot_front_nvme12link_speed : "platform-default")
  #       slot_front_nvme12option_rom           = (v.slot_front_nvme12option_rom != null ? v.slot_front_nvme12option_rom : "platform-default")
  #       slot_front_nvme13option_rom           = (v.slot_front_nvme13option_rom != null ? v.slot_front_nvme13option_rom : "platform-default")
  #       slot_front_nvme14option_rom           = (v.slot_front_nvme14option_rom != null ? v.slot_front_nvme14option_rom : "platform-default")
  #       slot_front_nvme15option_rom           = (v.slot_front_nvme15option_rom != null ? v.slot_front_nvme15option_rom : "platform-default")
  #       slot_front_nvme16option_rom           = (v.slot_front_nvme16option_rom != null ? v.slot_front_nvme16option_rom : "platform-default")
  #       slot_front_nvme17option_rom           = (v.slot_front_nvme17option_rom != null ? v.slot_front_nvme17option_rom : "platform-default")
  #       slot_front_nvme18option_rom           = (v.slot_front_nvme18option_rom != null ? v.slot_front_nvme18option_rom : "platform-default")
  #       slot_front_nvme19option_rom           = (v.slot_front_nvme19option_rom != null ? v.slot_front_nvme19option_rom : "platform-default")
  #       slot_front_nvme1link_speed            = (v.slot_front_nvme1link_speed != null ? v.slot_front_nvme1link_speed : "platform-default")
  #       slot_front_nvme1option_rom            = (v.slot_front_nvme1option_rom != null ? v.slot_front_nvme1option_rom : "platform-default")
  #       slot_front_nvme20option_rom           = (v.slot_front_nvme20option_rom != null ? v.slot_front_nvme20option_rom : "platform-default")
  #       slot_front_nvme21option_rom           = (v.slot_front_nvme21option_rom != null ? v.slot_front_nvme21option_rom : "platform-default")
  #       slot_front_nvme22option_rom           = (v.slot_front_nvme22option_rom != null ? v.slot_front_nvme22option_rom : "platform-default")
  #       slot_front_nvme23option_rom           = (v.slot_front_nvme23option_rom != null ? v.slot_front_nvme23option_rom : "platform-default")
  #       slot_front_nvme24option_rom           = (v.slot_front_nvme24option_rom != null ? v.slot_front_nvme24option_rom : "platform-default")
  #       slot_front_nvme2link_speed            = (v.slot_front_nvme2link_speed != null ? v.slot_front_nvme2link_speed : "platform-default")
  #       slot_front_nvme2option_rom            = (v.slot_front_nvme2option_rom != null ? v.slot_front_nvme2option_rom : "platform-default")
  #       slot_front_nvme3link_speed            = (v.slot_front_nvme3link_speed != null ? v.slot_front_nvme3link_speed : "platform-default")
  #       slot_front_nvme3option_rom            = (v.slot_front_nvme3option_rom != null ? v.slot_front_nvme3option_rom : "platform-default")
  #       slot_front_nvme4link_speed            = (v.slot_front_nvme4link_speed != null ? v.slot_front_nvme4link_speed : "platform-default")
  #       slot_front_nvme4option_rom            = (v.slot_front_nvme4option_rom != null ? v.slot_front_nvme4option_rom : "platform-default")
  #       slot_front_nvme5link_speed            = (v.slot_front_nvme5link_speed != null ? v.slot_front_nvme5link_speed : "platform-default")
  #       slot_front_nvme5option_rom            = (v.slot_front_nvme5option_rom != null ? v.slot_front_nvme5option_rom : "platform-default")
  #       slot_front_nvme6link_speed            = (v.slot_front_nvme6link_speed != null ? v.slot_front_nvme6link_speed : "platform-default")
  #       slot_front_nvme6option_rom            = (v.slot_front_nvme6option_rom != null ? v.slot_front_nvme6option_rom : "platform-default")
  #       slot_front_nvme7link_speed            = (v.slot_front_nvme7link_speed != null ? v.slot_front_nvme7link_speed : "platform-default")
  #       slot_front_nvme7option_rom            = (v.slot_front_nvme7option_rom != null ? v.slot_front_nvme7option_rom : "platform-default")
  #       slot_front_nvme8link_speed            = (v.slot_front_nvme8link_speed != null ? v.slot_front_nvme8link_speed : "platform-default")
  #       slot_front_nvme8option_rom            = (v.slot_front_nvme8option_rom != null ? v.slot_front_nvme8option_rom : "platform-default")
  #       slot_front_nvme9link_speed            = (v.slot_front_nvme9link_speed != null ? v.slot_front_nvme9link_speed : "platform-default")
  #       slot_front_nvme9option_rom            = (v.slot_front_nvme9option_rom != null ? v.slot_front_nvme9option_rom : "platform-default")
  #       slot_front_slot5link_speed            = (v.slot_front_slot5link_speed != null ? v.slot_front_slot5link_speed : "platform-default")
  #       slot_front_slot6link_speed            = (v.slot_front_slot6link_speed != null ? v.slot_front_slot6link_speed : "platform-default")
  #       slot_gpu1state                        = (v.slot_gpu1state != null ? v.slot_gpu1state : "platform-default")
  #       slot_gpu2state                        = (v.slot_gpu2state != null ? v.slot_gpu2state : "platform-default")
  #       slot_gpu3state                        = (v.slot_gpu3state != null ? v.slot_gpu3state : "platform-default")
  #       slot_gpu4state                        = (v.slot_gpu4state != null ? v.slot_gpu4state : "platform-default")
  #       slot_gpu5state                        = (v.slot_gpu5state != null ? v.slot_gpu5state : "platform-default")
  #       slot_gpu6state                        = (v.slot_gpu6state != null ? v.slot_gpu6state : "platform-default")
  #       slot_gpu7state                        = (v.slot_gpu7state != null ? v.slot_gpu7state : "platform-default")
  #       slot_gpu8state                        = (v.slot_gpu8state != null ? v.slot_gpu8state : "platform-default")
  #       slot_hba_link_speed                   = (v.slot_hba_link_speed != null ? v.slot_hba_link_speed : "platform-default")
  #       slot_hba_state                        = (v.slot_hba_state != null ? v.slot_hba_state : "platform-default")
  #       slot_lom1link                         = (v.slot_lom1link != null ? v.slot_lom1link : "platform-default")
  #       slot_lom2link                         = (v.slot_lom2link != null ? v.slot_lom2link : "platform-default")
  #       slot_mezz_state                       = (v.slot_mezz_state != null ? v.slot_mezz_state : "platform-default")
  #       slot_mlom_link_speed                  = (v.slot_mlom_link_speed != null ? v.slot_mlom_link_speed : "platform-default")
  #       slot_mlom_state                       = (v.slot_mlom_state != null ? v.slot_mlom_state : "platform-default")
  #       slot_mraid_link_speed                 = (v.slot_mraid_link_speed != null ? v.slot_mraid_link_speed : "platform-default")
  #       slot_mraid_state                      = (v.slot_mraid_state != null ? v.slot_mraid_state : "platform-default")
  #       slot_n10state                         = (v.slot_n10state != null ? v.slot_n10state : "platform-default")
  #       slot_n11state                         = (v.slot_n11state != null ? v.slot_n11state : "platform-default")
  #       slot_n12state                         = (v.slot_n12state != null ? v.slot_n12state : "platform-default")
  #       slot_n13state                         = (v.slot_n13state != null ? v.slot_n13state : "platform-default")
  #       slot_n14state                         = (v.slot_n14state != null ? v.slot_n14state : "platform-default")
  #       slot_n15state                         = (v.slot_n15state != null ? v.slot_n15state : "platform-default")
  #       slot_n16state                         = (v.slot_n16state != null ? v.slot_n16state : "platform-default")
  #       slot_n17state                         = (v.slot_n17state != null ? v.slot_n17state : "platform-default")
  #       slot_n18state                         = (v.slot_n18state != null ? v.slot_n18state : "platform-default")
  #       slot_n19state                         = (v.slot_n19state != null ? v.slot_n19state : "platform-default")
  #       slot_n1state                          = (v.slot_n1state != null ? v.slot_n1state : "platform-default")
  #       slot_n20state                         = (v.slot_n20state != null ? v.slot_n20state : "platform-default")
  #       slot_n21state                         = (v.slot_n21state != null ? v.slot_n21state : "platform-default")
  #       slot_n22state                         = (v.slot_n22state != null ? v.slot_n22state : "platform-default")
  #       slot_n23state                         = (v.slot_n23state != null ? v.slot_n23state : "platform-default")
  #       slot_n24state                         = (v.slot_n24state != null ? v.slot_n24state : "platform-default")
  #       slot_n2state                          = (v.slot_n2state != null ? v.slot_n2state : "platform-default")
  #       slot_n3state                          = (v.slot_n3state != null ? v.slot_n3state : "platform-default")
  #       slot_n4state                          = (v.slot_n4state != null ? v.slot_n4state : "platform-default")
  #       slot_n5state                          = (v.slot_n5state != null ? v.slot_n5state : "platform-default")
  #       slot_n6state                          = (v.slot_n6state != null ? v.slot_n6state : "platform-default")
  #       slot_n7state                          = (v.slot_n7state != null ? v.slot_n7state : "platform-default")
  #       slot_n8state                          = (v.slot_n8state != null ? v.slot_n8state : "platform-default")
  #       slot_n9state                          = (v.slot_n9state != null ? v.slot_n9state : "platform-default")
  #       slot_raid_link_speed                  = (v.slot_raid_link_speed != null ? v.slot_raid_link_speed : "platform-default")
  #       slot_raid_state                       = (v.slot_raid_state != null ? v.slot_raid_state : "platform-default")
  #       slot_rear_nvme1link_speed             = (v.slot_rear_nvme1link_speed != null ? v.slot_rear_nvme1link_speed : "platform-default")
  #       slot_rear_nvme1state                  = (v.slot_rear_nvme1state != null ? v.slot_rear_nvme1state : "platform-default")
  #       slot_rear_nvme2link_speed             = (v.slot_rear_nvme2link_speed != null ? v.slot_rear_nvme2link_speed : "platform-default")
  #       slot_rear_nvme2state                  = (v.slot_rear_nvme2state != null ? v.slot_rear_nvme2state : "platform-default")
  #       slot_rear_nvme3link_speed             = (v.slot_rear_nvme3link_speed != null ? v.slot_rear_nvme3link_speed : "platform-default")
  #       slot_rear_nvme3state                  = (v.slot_rear_nvme3state != null ? v.slot_rear_nvme3state : "platform-default")
  #       slot_rear_nvme4link_speed             = (v.slot_rear_nvme4link_speed != null ? v.slot_rear_nvme4link_speed : "platform-default")
  #       slot_rear_nvme4state                  = (v.slot_rear_nvme4state != null ? v.slot_rear_nvme4state : "platform-default")
  #       slot_rear_nvme5state                  = (v.slot_rear_nvme5state != null ? v.slot_rear_nvme5state : "platform-default")
  #       slot_rear_nvme6state                  = (v.slot_rear_nvme6state != null ? v.slot_rear_nvme6state : "platform-default")
  #       slot_rear_nvme7state                  = (v.slot_rear_nvme7state != null ? v.slot_rear_nvme7state : "platform-default")
  #       slot_rear_nvme8state                  = (v.slot_rear_nvme8state != null ? v.slot_rear_nvme8state : "platform-default")
  #       slot_riser1link_speed                 = (v.slot_riser1link_speed != null ? v.slot_riser1link_speed : "platform-default")
  #       slot_riser1slot1link_speed            = (v.slot_riser1slot1link_speed != null ? v.slot_riser1slot1link_speed : "platform-default")
  #       slot_riser1slot2link_speed            = (v.slot_riser1slot2link_speed != null ? v.slot_riser1slot2link_speed : "platform-default")
  #       slot_riser1slot3link_speed            = (v.slot_riser1slot3link_speed != null ? v.slot_riser1slot3link_speed : "platform-default")
  #       slot_riser2link_speed                 = (v.slot_riser2link_speed != null ? v.slot_riser2link_speed : "platform-default")
  #       slot_riser2slot4link_speed            = (v.slot_riser2slot4link_speed != null ? v.slot_riser2slot4link_speed : "platform-default")
  #       slot_riser2slot5link_speed            = (v.slot_riser2slot5link_speed != null ? v.slot_riser2slot5link_speed : "platform-default")
  #       slot_riser2slot6link_speed            = (v.slot_riser2slot6link_speed != null ? v.slot_riser2slot6link_speed : "platform-default")
  #       slot_sas_state                        = (v.slot_sas_state != null ? v.slot_sas_state : "platform-default")
  #       slot_ssd_slot1link_speed              = (v.slot_ssd_slot1link_speed != null ? v.slot_ssd_slot1link_speed : "platform-default")
  #       slot_ssd_slot2link_speed              = (v.slot_ssd_slot2link_speed != null ? v.slot_ssd_slot2link_speed : "platform-default")
  #       post_error_pause                      = (v.post_error_pause != null ? v.post_error_pause : "platform-default")
  #       tpm_support                           = (v.tpm_support != null ? v.tpm_support : "platform-default")
  #       advanced_mem_test                     = (v.advanced_mem_test != null ? v.advanced_mem_test : "platform-default")
  #       bme_dma_mitigation                    = (v.bme_dma_mitigation != null ? v.bme_dma_mitigation : "platform-default")
  #       burst_and_postponed_refresh           = (v.burst_and_postponed_refresh != null ? v.burst_and_postponed_refresh : "platform-default")
  #       cbs_cmn_cpu_smee                      = (v.cbs_cmn_cpu_smee != null ? v.cbs_cmn_cpu_smee : "platform-default")
  #       cbs_cmn_gnb_nb_iommu                  = (v.cbs_cmn_gnb_nb_iommu != null ? v.cbs_cmn_gnb_nb_iommu : "platform-default")
  #       cbs_cmn_mem_ctrl_bank_group_swap_ddr4 = (v.cbs_cmn_mem_ctrl_bank_group_swap_ddr4 != null ? v.cbs_cmn_mem_ctrl_bank_group_swap_ddr4 : "platform-default")
  #       cbs_cmn_mem_map_bank_interleave_ddr4  = (v.cbs_cmn_mem_map_bank_interleave_ddr4 != null ? v.cbs_cmn_mem_map_bank_interleave_ddr4 : "platform-default")
  #       cbs_dbg_cpu_snp_mem_cover             = (v.cbs_dbg_cpu_snp_mem_cover != null ? v.cbs_dbg_cpu_snp_mem_cover : "platform-default")
  #       cbs_dbg_cpu_snp_mem_size_cover        = (v.cbs_dbg_cpu_snp_mem_size_cover != null ? v.cbs_dbg_cpu_snp_mem_size_cover : "platform-default")
  #       cbs_df_cmn_dram_nps                   = (v.cbs_df_cmn_dram_nps != null ? v.cbs_df_cmn_dram_nps : "platform-default")
  #       cbs_df_cmn_mem_intlv                  = (v.cbs_df_cmn_mem_intlv != null ? v.cbs_df_cmn_mem_intlv : "platform-default")
  #       cbs_df_cmn_mem_intlv_size             = (v.cbs_df_cmn_mem_intlv_size != null ? v.cbs_df_cmn_mem_intlv_size : "platform-default")
  #       cbs_sev_snp_support                   = (v.cbs_sev_snp_support != null ? v.cbs_sev_snp_support : "platform-default")
  #       cke_low_policy                        = (v.cke_low_policy != null ? v.cke_low_policy : "platform-default")
  #       cr_qos                                = (v.cr_qos != null ? v.cr_qos : "platform-default")
  #       crfastgo_config                       = (v.crfastgo_config != null ? v.crfastgo_config : "platform-default")
  #       dcpmm_firmware_downgrade              = (v.dcpmm_firmware_downgrade != null ? v.dcpmm_firmware_downgrade : "platform-default")
  #       dram_refresh_rate                     = (v.dram_refresh_rate != null ? v.dram_refresh_rate : "platform-default")
  #       dram_sw_thermal_throttling            = (v.dram_sw_thermal_throttling != null ? v.dram_sw_thermal_throttling : "platform-default")
  #       eadr_support                          = (v.eadr_support != null ? v.eadr_support : "platform-default")
  #       lv_ddr_mode                           = (v.lv_ddr_mode != null ? v.lv_ddr_mode : "platform-default")
  #       memory_bandwidth_boost                = (v.memory_bandwidth_boost != null ? v.memory_bandwidth_boost : "platform-default")
  #       memory_refresh_rate                   = (v.memory_refresh_rate != null ? v.memory_refresh_rate : "platform-default")
  #       memory_size_limit                     = (v.memory_size_limit != null ? v.memory_size_limit : "platform-default")
  #       memory_thermal_throttling             = (v.memory_thermal_throttling != null ? v.memory_thermal_throttling : "platform-default")
  #       mirroring_mode                        = (v.mirroring_mode != null ? v.mirroring_mode : "platform-default")
  #       numa_optimized                        = (v.numa_optimized != null ? v.numa_optimized : "platform-default")
  #       nvmdimm_perform_config                = (v.nvmdimm_perform_config != null ? v.nvmdimm_perform_config : "platform-default")
  #       operation_mode                        = (v.operation_mode != null ? v.operation_mode : "platform-default")
  #       panic_high_watermark                  = (v.panic_high_watermark != null ? v.panic_high_watermark : "platform-default")
  #       partial_cache_line_sparing            = (v.partial_cache_line_sparing != null ? v.partial_cache_line_sparing : "platform-default")
  #       partial_mirror_mode_config            = (v.partial_mirror_mode_config != null ? v.partial_mirror_mode_config : "platform-default")
  #       partial_mirror_percent                = (v.partial_mirror_percent != null ? v.partial_mirror_percent : "platform-default")
  #       partial_mirror_value1                 = (v.partial_mirror_value1 != null ? v.partial_mirror_value1 : "platform-default")
  #       partial_mirror_value2                 = (v.partial_mirror_value2 != null ? v.partial_mirror_value2 : "platform-default")
  #       partial_mirror_value3                 = (v.partial_mirror_value3 != null ? v.partial_mirror_value3 : "platform-default")
  #       partial_mirror_value4                 = (v.partial_mirror_value4 != null ? v.partial_mirror_value4 : "platform-default")
  #       pc_ie_ras_support                     = (v.pc_ie_ras_support != null ? v.pc_ie_ras_support : "platform-default")
  #       post_package_repair                   = (v.post_package_repair != null ? v.post_package_repair : "platform-default")
  #       select_memory_ras_configuration       = (v.select_memory_ras_configuration != null ? v.select_memory_ras_configuration : "platform-default")
  #       select_ppr_type                       = (v.select_ppr_type != null ? v.select_ppr_type : "platform-default")
  #       sev                                   = (v.sev != null ? v.sev : "platform-default")
  #       smee                                  = (v.smee != null ? v.smee : "platform-default")
  #       snoopy_mode_for2lm                    = (v.snoopy_mode_for2lm != null ? v.snoopy_mode_for2lm : "platform-default")
  #       snoopy_mode_for_ad                    = (v.snoopy_mode_for_ad != null ? v.snoopy_mode_for_ad : "platform-default")
  #       sparing_mode                          = (v.sparing_mode != null ? v.sparing_mode : "platform-default")
  #       tsme                                  = (v.tsme != null ? v.tsme : "platform-default")
  #       uma_based_clustering                  = (v.uma_based_clustering != null ? v.uma_based_clustering : "platform-default")
  #       vol_memory_mode                       = (v.vol_memory_mode != null ? v.vol_memory_mode : "platform-default")
  #       aspm_support                          = (v.aspm_support != null ? v.aspm_support : "platform-default")
  #       ioh_resource                          = (v.ioh_resource != null ? v.ioh_resource : "platform-default")
  #       memory_mapped_io_above4gb             = (v.memory_mapped_io_above4gb != null ? v.memory_mapped_io_above4gb : "platform-default")
  #       mmcfg_base                            = (v.mmcfg_base != null ? v.mmcfg_base : "platform-default")
  #       onboard10gbit_lom                     = (v.onboard10gbit_lom != null ? v.onboard10gbit_lom : "platform-default")
  #       onboard_gbit_lom                      = (v.onboard_gbit_lom != null ? v.onboard_gbit_lom : "platform-default")
  #       pc_ie_ssd_hot_plug_support            = (v.pc_ie_ssd_hot_plug_support != null ? v.pc_ie_ssd_hot_plug_support : "platform-default")
  #       sr_iov                                = (v.sr_iov != null ? v.sr_iov : "platform-default")
  #       vga_priority                          = (v.vga_priority != null ? v.vga_priority : "platform-default")
  #       cbs_cmn_cpu_cpb                       = (v.cbs_cmn_cpu_cpb != null ? v.cbs_cmn_cpu_cpb : "platform-default")
  #       cbs_cmn_cpu_global_cstate_ctrl        = (v.cbs_cmn_cpu_global_cstate_ctrl != null ? v.cbs_cmn_cpu_global_cstate_ctrl : "platform-default")
  #       cbs_cmn_cpu_l1stream_hw_prefetcher    = (v.cbs_cmn_cpu_l1stream_hw_prefetcher != null ? v.cbs_cmn_cpu_l1stream_hw_prefetcher : "platform-default")
  #       cbs_cmn_cpu_l2stream_hw_prefetcher    = (v.cbs_cmn_cpu_l2stream_hw_prefetcher != null ? v.cbs_cmn_cpu_l2stream_hw_prefetcher : "platform-default")
  #       cbs_cmn_determinism_slider            = (v.cbs_cmn_determinism_slider != null ? v.cbs_cmn_determinism_slider : "platform-default")
  #       cbs_cmn_efficiency_mode_en            = (v.cbs_cmn_efficiency_mode_en != null ? v.cbs_cmn_efficiency_mode_en : "platform-default")
  #       cbs_cmn_gnb_smucppc                   = (v.cbs_cmn_gnb_smucppc != null ? v.cbs_cmn_gnb_smucppc : "platform-default")
  #       cbs_cmnc_tdp_ctl                      = (v.cbs_cmnc_tdp_ctl != null ? v.cbs_cmnc_tdp_ctl : "platform-default")
  #       adjacent_cache_line_prefetch          = (v.adjacent_cache_line_prefetch != null ? v.adjacent_cache_line_prefetch : "platform-default")
  #       altitude                              = (v.altitude != null ? v.altitude : "platform-default")
  #       auto_cc_state                         = (v.auto_cc_state != null ? v.auto_cc_state : "platform-default")
  #       autonumous_cstate_enable              = (v.autonumous_cstate_enable != null ? v.autonumous_cstate_enable : "platform-default")
  #       boot_performance_mode                 = (v.boot_performance_mode != null ? v.boot_performance_mode : "platform-default")
  #       cbs_cmn_apbdis                        = (v.cbs_cmn_apbdis != null ? v.cbs_cmn_apbdis : "platform-default")
  #       cbs_cmn_cpu_gen_downcore_ctrl         = (v.cbs_cmn_cpu_gen_downcore_ctrl != null ? v.cbs_cmn_cpu_gen_downcore_ctrl : "platform-default")
  #       cbs_cmn_cpu_streaming_stores_ctrl     = (v.cbs_cmn_cpu_streaming_stores_ctrl != null ? v.cbs_cmn_cpu_streaming_stores_ctrl : "platform-default")
  #       cbs_cmn_fixed_soc_pstate              = (v.cbs_cmn_fixed_soc_pstate != null ? v.cbs_cmn_fixed_soc_pstate : "platform-default")
  #       cbs_cmn_gnb_smu_df_cstates            = (v.cbs_cmn_gnb_smu_df_cstates != null ? v.cbs_cmn_gnb_smu_df_cstates : "platform-default")
  #       cbs_cpu_ccd_ctrl_ssp                  = (v.cbs_cpu_ccd_ctrl_ssp != null ? v.cbs_cpu_ccd_ctrl_ssp : "platform-default")
  #       cbs_cpu_core_ctrl                     = (v.cbs_cpu_core_ctrl != null ? v.cbs_cpu_core_ctrl : "platform-default")
  #       cbs_cpu_smt_ctrl                      = (v.cbs_cpu_smt_ctrl != null ? v.cbs_cpu_smt_ctrl : "platform-default")
  #       cbs_df_cmn_acpi_srat_l3numa           = (v.cbs_df_cmn_acpi_srat_l3numa != null ? v.cbs_df_cmn_acpi_srat_l3numa : "platform-default")
  #       channel_inter_leave                   = (v.channel_inter_leave != null ? v.channel_inter_leave : "platform-default")
  #       cisco_xgmi_max_speed                  = (v.cisco_xgmi_max_speed != null ? v.cisco_xgmi_max_speed : "platform-default")
  #       closed_loop_therm_throtl              = (v.closed_loop_therm_throtl != null ? v.closed_loop_therm_throtl : "platform-default")
  #       cmci_enable                           = (v.cmci_enable != null ? v.cmci_enable : "platform-default")
  #       config_tdp                            = (v.config_tdp != null ? v.config_tdp : "platform-default")
  #       config_tdp_level                      = (v.config_tdp_level != null ? v.config_tdp_level : "platform-default")
  #       core_multi_processing                 = (v.core_multi_processing != null ? v.core_multi_processing : "platform-default")
  #       cpu_energy_performance                = (v.cpu_energy_performance != null ? v.cpu_energy_performance : "platform-default")
  #       cpu_frequency_floor                   = (v.cpu_frequency_floor != null ? v.cpu_frequency_floor : "platform-default")
  #       cpu_performance                       = (v.cpu_performance != null ? v.cpu_performance : "platform-default")
  #       cpu_power_management                  = (v.cpu_power_management != null ? v.cpu_power_management : "platform-default")
  #       demand_scrub                          = (v.demand_scrub != null ? v.demand_scrub : "platform-default")
  #       direct_cache_access                   = (v.direct_cache_access != null ? v.direct_cache_access : "platform-default")
  #       dram_clock_throttling                 = (v.dram_clock_throttling != null ? v.dram_clock_throttling : "platform-default")
  #       energy_efficient_turbo                = (v.energy_efficient_turbo != null ? v.energy_efficient_turbo : "platform-default")
  #       eng_perf_tuning                       = (v.eng_perf_tuning != null ? v.eng_perf_tuning : "platform-default")
  #       enhanced_intel_speed_step_tech        = (v.enhanced_intel_speed_step_tech != null ? v.enhanced_intel_speed_step_tech : "platform-default")
  #       epp_enable                            = (v.epp_enable != null ? v.epp_enable : "platform-default")
  #       epp_profile                           = (v.epp_profile != null ? v.epp_profile : "platform-default")
  #       execute_disable_bit                   = (v.execute_disable_bit != null ? v.execute_disable_bit : "platform-default")
  #       extended_apic                         = (v.extended_apic != null ? v.extended_apic : "platform-default")
  #       hardware_prefetch                     = (v.hardware_prefetch != null ? v.hardware_prefetch : "platform-default")
  #       hwpm_enable                           = (v.hwpm_enable != null ? v.hwpm_enable : "platform-default")
  #       imc_interleave                        = (v.imc_interleave != null ? v.imc_interleave : "platform-default")
  #       intel_dynamic_speed_select            = (v.intel_dynamic_speed_select != null ? v.intel_dynamic_speed_select : "platform-default")
  #       intel_hyper_threading_tech            = (v.intel_hyper_threading_tech != null ? v.intel_hyper_threading_tech : "platform-default")
  #       intel_speed_select                    = (v.intel_speed_select != null ? v.intel_speed_select : "platform-default")
  #       intel_turbo_boost_tech                = (v.intel_turbo_boost_tech != null ? v.intel_turbo_boost_tech : "platform-default")
  #       intel_virtualization_technology       = (v.intel_virtualization_technology != null ? v.intel_virtualization_technology : "platform-default")
  #       ioh_error_enable                      = (v.ioh_error_enable != null ? v.ioh_error_enable : "platform-default")
  #       ip_prefetch                           = (v.ip_prefetch != null ? v.ip_prefetch : "platform-default")
  #       kti_prefetch                          = (v.kti_prefetch != null ? v.kti_prefetch : "platform-default")
  #       llc_prefetch                          = (v.llc_prefetch != null ? v.llc_prefetch : "platform-default")
  #       memory_inter_leave                    = (v.memory_inter_leave != null ? v.memory_inter_leave : "platform-default")
  #       package_cstate_limit                  = (v.package_cstate_limit != null ? v.package_cstate_limit : "platform-default")
  #       patrol_scrub                          = (v.patrol_scrub != null ? v.patrol_scrub : "platform-default")
  #       patrol_scrub_duration                 = (v.patrol_scrub_duration != null ? v.patrol_scrub_duration : "platform-default")
  #       processor_c1e                         = (v.processor_c1e != null ? v.processor_c1e : "platform-default")
  #       processor_c3report                    = (v.processor_c3report != null ? v.processor_c3report : "platform-default")
  #       processor_c6report                    = (v.processor_c6report != null ? v.processor_c6report : "platform-default")
  #       processor_cstate                      = (v.processor_cstate != null ? v.processor_cstate : "platform-default")
  #       pstate_coord_type                     = (v.pstate_coord_type != null ? v.pstate_coord_type : "platform-default")
  #       pwr_perf_tuning                       = (v.pwr_perf_tuning != null ? v.pwr_perf_tuning : "platform-default")
  #       qpi_link_speed                        = (v.qpi_link_speed != null ? v.qpi_link_speed : "platform-default")
  #       rank_inter_leave                      = (v.rank_inter_leave != null ? v.rank_inter_leave : "platform-default")
  #       single_pctl_enable                    = (v.single_pctl_enable != null ? v.single_pctl_enable : "platform-default")
  #       smt_mode                              = (v.smt_mode != null ? v.smt_mode : "platform-default")
  #       snc                                   = (v.snc != null ? v.snc : "platform-default")
  #       streamer_prefetch                     = (v.streamer_prefetch != null ? v.streamer_prefetch : "platform-default")
  #       svm_mode                              = (v.svm_mode != null ? v.svm_mode : "platform-default")
  #       ufs_disable                           = (v.ufs_disable != null ? v.ufs_disable : "platform-default")
  #       work_load_config                      = (v.work_load_config != null ? v.work_load_config : "platform-default")
  #       xpt_prefetch                          = (v.xpt_prefetch != null ? v.xpt_prefetch : "platform-default")
  #       qpi_link_frequency                    = (v.qpi_link_frequency != null ? v.qpi_link_frequency : "platform-default")
  #       qpi_snoop_mode                        = (v.qpi_snoop_mode != null ? v.qpi_snoop_mode : "platform-default")
  #       serial_port_aenable                   = (v.serial_port_aenable != null ? v.serial_port_aenable : "platform-default")
  #       assert_nmi_on_perr                    = (v.assert_nmi_on_perr != null ? v.assert_nmi_on_perr : "platform-default")
  #       assert_nmi_on_serr                    = (v.assert_nmi_on_serr != null ? v.assert_nmi_on_serr : "platform-default")
  #       baud_rate                             = (v.baud_rate != null ? v.baud_rate : "platform-default")
  #       cdn_enable                            = (v.cdn_enable != null ? v.cdn_enable : "platform-default")
  #       cisco_adaptive_mem_training           = (v.cisco_adaptive_mem_training != null ? v.cisco_adaptive_mem_training : "platform-default")
  #       cisco_debug_level                     = (v.cisco_debug_level != null ? v.cisco_debug_level : "platform-default")
  #       cisco_oprom_launch_optimization       = (v.cisco_oprom_launch_optimization != null ? v.cisco_oprom_launch_optimization : "platform-default")
  #       console_redirection                   = (v.console_redirection != null ? v.console_redirection : "platform-default")
  #       flow_control                          = (v.flow_control != null ? v.flow_control : "platform-default")
  #       frb2enable                            = (v.frb2enable != null ? v.frb2enable : "platform-default")
  #       legacy_os_redirection                 = (v.legacy_os_redirection != null ? v.legacy_os_redirection : "platform-default")
  #       os_boot_watchdog_timer                = (v.os_boot_watchdog_timer != null ? v.os_boot_watchdog_timer : "platform-default")
  #       os_boot_watchdog_timer_policy         = (v.os_boot_watchdog_timer_policy != null ? v.os_boot_watchdog_timer_policy : "platform-default")
  #       os_boot_watchdog_timer_timeout        = (v.os_boot_watchdog_timer_timeout != null ? v.os_boot_watchdog_timer_timeout : "platform-default")
  #       out_of_band_mgmt_port                 = (v.out_of_band_mgmt_port != null ? v.out_of_band_mgmt_port : "platform-default")
  #       putty_key_pad                         = (v.putty_key_pad != null ? v.putty_key_pad : "platform-default")
  #       redirection_after_post                = (v.redirection_after_post != null ? v.redirection_after_post : "platform-default")
  #       terminal_type                         = (v.terminal_type != null ? v.terminal_type : "platform-default")
  #       ucsm_boot_order_rule                  = (v.ucsm_boot_order_rule != null ? v.ucsm_boot_order_rule : "platform-default")
  #       enable_mktme                          = (v.enable_mktme != null ? v.enable_mktme : "platform-default")
  #       enable_sgx                            = (v.enable_sgx != null ? v.enable_sgx : "platform-default")
  #       enable_tme                            = (v.enable_tme != null ? v.enable_tme : "platform-default")
  #       epoch_update                          = (v.epoch_update != null ? v.epoch_update : "platform-default")
  #       sgx_auto_registration_agent           = (v.sgx_auto_registration_agent != null ? v.sgx_auto_registration_agent : "platform-default")
  #       sgx_epoch0                            = (v.sgx_epoch0 != null ? v.sgx_epoch0 : "platform-default")
  #       sgx_epoch1                            = (v.sgx_epoch1 != null ? v.sgx_epoch1 : "platform-default")
  #       sgx_factory_reset                     = (v.sgx_factory_reset != null ? v.sgx_factory_reset : "platform-default")
  #       sgx_le_pub_key_hash0                  = (v.sgx_le_pub_key_hash0 != null ? v.sgx_le_pub_key_hash0 : "platform-default")
  #       sgx_le_pub_key_hash1                  = (v.sgx_le_pub_key_hash1 != null ? v.sgx_le_pub_key_hash1 : "platform-default")
  #       sgx_le_pub_key_hash2                  = (v.sgx_le_pub_key_hash2 != null ? v.sgx_le_pub_key_hash2 : "platform-default")
  #       sgx_le_pub_key_hash3                  = (v.sgx_le_pub_key_hash3 != null ? v.sgx_le_pub_key_hash3 : "platform-default")
  #       sgx_le_wr                             = (v.sgx_le_wr != null ? v.sgx_le_wr : "platform-default")
  #       sgx_package_info_in_band_access       = (v.sgx_package_info_in_band_access != null ? v.sgx_package_info_in_band_access : "platform-default")
  #       sgx_qos                               = (v.sgx_qos != null ? v.sgx_qos : "platform-default")
  #       tpm_control                           = (v.tpm_control != null ? v.tpm_control : "platform-default")
  #       tpm_pending_operation                 = (v.tpm_pending_operation != null ? v.tpm_pending_operation : "platform-default")
  #       txt_support                           = (v.txt_support != null ? v.txt_support : "platform-default")
  #       all_usb_devices                       = (v.all_usb_devices != null ? v.all_usb_devices : "platform-default")
  #       legacy_usb_support                    = (v.legacy_usb_support != null ? v.legacy_usb_support : "platform-default")
  #       make_device_non_bootable              = (v.make_device_non_bootable != null ? v.make_device_non_bootable : "platform-default")
  #       pch_usb30mode                         = (v.pch_usb30mode != null ? v.pch_usb30mode : "platform-default")
  #       usb_emul6064                          = (v.usb_emul6064 != null ? v.usb_emul6064 : "platform-default")
  #       usb_port_front                        = (v.usb_port_front != null ? v.usb_port_front : "platform-default")
  #       usb_port_internal                     = (v.usb_port_internal != null ? v.usb_port_internal : "platform-default")
  #       usb_port_kvm                          = (v.usb_port_kvm != null ? v.usb_port_kvm : "platform-default")
  #       usb_port_rear                         = (v.usb_port_rear != null ? v.usb_port_rear : "platform-default")
  #       usb_port_sd_card                      = (v.usb_port_sd_card != null ? v.usb_port_sd_card : "platform-default")
  #       usb_port_vmedia                       = (v.usb_port_vmedia != null ? v.usb_port_vmedia : "platform-default")
  #       usb_xhci_support                      = (v.usb_xhci_support != null ? v.usb_xhci_support : "platform-default")
  #     }
  #   }
}


#____________________________________________________________
#
# Boot Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "boot_uefi_m2pch" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  for_each    = var.assign_best_practice_boot == true ? local.best_practice_policies : {}
  boot_secure = local.boot_secure
  description = local.boot_policy != "" ? "${local.boot_policy} UEFI M.2 PCH Boot Policy." : "${local.org_name} UEFI M.2 PCH Boot Policy."
  name        = "${each.key}_boot_uefi_m2pch"
  org_moid    = local.org_moids[each.value.organization].moid
  profiles    = each.value.profiles
  tags        = var.tags
  boot_devices = [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "CIMC_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "KVM_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          },
          Lun = 0

        }
      )
      enabled     = true,
      name        = "M2-PCH",
      object_type = "boot.PchStorage",
    },
  ]
}

module "boot_uefi_m2raid" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  boot_secure = local.boot_secure
  description = local.boot_policy != "" ? "${local.boot_policy} UEFI M.2 HWRAID Boot Policy." : "${local.org_name} UEFI M.2 HWRAID Boot Policy."
  name        = local.boot_policy != "" ? "${local.boot_policy}_uefi_m2raid" : "${local.org_name}_uefi_m2raid"
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
  boot_devices = [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "CIMC_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "KVM_DVD",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          },
          Slot = "MSTOR-RAID"

        }
      )
      enabled     = true,
      name        = "M2_RAID",
      object_type = "boot.LocalDisk",
    },
  ]
}

module "boot_uefi_sdcard" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  boot_secure = local.boot_secure
  description = local.boot_policy != "" ? "${local.boot_policy} UEFI SD Card Boot Policy." : "${local.org_name} UEFI SD Card Boot Policy."
  name        = local.boot_policy != "" ? "${local.boot_policy}_uefi_sdcard" : "${local.org_name}_uefi_sdcard"
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
  boot_devices = [
    {
      additional_properties = jsonencode({ Subtype = "cimc-mapped-dvd" })
      enabled               = true,
      name                  = "cimc_dvd",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode({ Subtype = "kvm-mapped-dvd" })
      enabled               = true,
      name                  = "kvm_dvd",
      object_type           = "boot.VirtualMedia",
    },
    {
      additional_properties = jsonencode(
        {
          Bootloader = {
            ClassId     = "boot.Bootloader"
            Description = "ESXi Bootloader",
            Name        = "BOOTX64.EFI",
            ObjectType  = "boot.Bootloader"
            Path        = "\\EFI\\BOOT\\"
          }
          Lun     = 0
          Subtype = "none"
        }
      )
      enabled     = true,
      name        = "SdCard",
      object_type = "boot.SdCard",
    },
  ]
}


#____________________________________________________________
#
# Device Connector Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "device_connector" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_device_connector"
  description = local.device_connector_policy != "" ? "${local.device_connector_policy} Device Connector Policy." : "${local.org_name} Device Connector Policy."
  lockout     = local.dc_lockout
  name        = local.device_connector_policy != "" ? local.device_connector_policy : local.org_name
  org_moid    = local.org_moid
  tags        = var.tags
}


#____________________________________________________________
#
# Disk Group Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "disk_group_raid1" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_disk_group"
  description = local.disk_group_policy != "" ? "${local.disk_group_policy} Disk Group Policy Raid 1." : "${local.org_name} Disk Group Policy Raid 1."
  name        = local.disk_group_policy != "" ? "${local.disk_group_policy}_raid1" : "${local.org_name}_raid1"
  raid_level  = "Raid1"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = var.tags
  # The default var.span_groups included disk 1 and 2
  # which will work for this.
}

module "disk_group_raid5" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_disk_group"
  description = local.disk_group_policy != "" ? "${local.disk_group_policy} Disk Group Policy Raid 5." : "${local.org_name} Disk Group Policy Raid 5."
  name        = local.disk_group_policy != "" ? "${local.disk_group_policy}_raid5" : "${local.org_name}_raid5"
  raid_level  = "Raid5"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = var.tags
  span_groups = {
    span_0 = [
      {
        disk = 1
      },
      {
        disk = 2
      },
      {
        disk = 3
      }
    ]
  }
}

module "disk_group_raid10" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_disk_group"
  description = local.disk_group_policy != "" ? "${local.disk_group_policy} Disk Group Policy Raid 10." : "${local.org_name} Disk Group Policy Raid 10."
  name        = local.disk_group_policy != "" ? "${local.disk_group_policy}_raid10" : "${local.org_name}_raid10"
  raid_level  = "Raid10"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = var.tags
  span_groups = {
    span_0 = [
      {
        disk = 1
      },
      {
        disk = 2
      }
    ],
    span_1 = [
      {
        disk = 3
      },
      {
        disk = 4
      }
    ]
  }
}


#____________________________________________________________
#
# Storage Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "storage" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.disk_group_raid1,
    module.disk_group_raid5,
    module.disk_group_raid10
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/policies_storage"
  description   = local.storage_policy != "" ? "${local.storage_policy} Storage Policy." : "${local.org_name} Storage Policy."
  name          = local.storage_policy != "" ? local.storage_policy : local.org_name
  org_moid      = local.org_moid
  profiles      = []
  retain_policy = true
  tags          = var.tags
  unused_disks  = "UnconfiguredGood"
  virtual_drives = [
    {
      access_policy         = "Default"
      additional_properties = ""
      boot_drive            = false
      disk_group_name       = module.disk_group_raid5.name
      disk_group_policy     = module.disk_group_raid5.moid
      drive_cache           = "Default"
      expand_to_available   = true
      io_policy             = "Default"
      name                  = "vd0"
      read_policy           = "Default"
      size                  = 25
      strip_size            = "Default"
      vdid                  = "value"
      write_policy          = "Default"
    }
  ]
}

#____________________________________________________________
#
# IMC Access Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "imc_access" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_imc_access"
  description      = local.imc_access_policy != "" ? "${local.imc_access_policy} IMC Access Policy." : "${local.org_name} IMC Access Policy."
  inband_mgmt_vlan = local.imc_mgmt_vlan
  name             = local.imc_access_policy != "" ? local.imc_access_policy : local.org_name
  org_moid         = local.org_moid
  tags             = var.tags
  ipv4_enable      = local.ipv4_enable
  ipv6_enable      = local.ipv6_enable
  imc_ip_pool      = local.imc_ip_pool
}

#____________________________________________________________
#
# IPMI over LAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ipmi_over_lan" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_ipmi_over_lan"
  description           = local.ipmi_over_lan_policy != "" ? "${local.ipmi_over_lan_policy} IPMI Over LAN Policy." : "${local.org_name} IPMI Over LAN Policy."
  enabled               = local.ipmi_enabled
  encryption_key        = local.ipmi_encryption_key
  is_encryption_key_set = local.ipmi_encryption_enable
  privilege             = local.ipmi_privilege
  name                  = local.ipmi_over_lan_policy != "" ? local.ipmi_over_lan_policy : local.org_name
  profiles              = []
  org_moid              = local.org_moid
  tags                  = var.tags
}


#____________________________________________________________
#
# LDAP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# LDAP Policy
#______________________________________________

module "ldap_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                     = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_policy"
  attribute                  = local.ldap_attribute
  base_dn                    = local.ldap_base_dn
  bind_dn                    = local.ldap_bind_dn
  bind_method                = local.ldap_bind_method
  description                = local.ldap_policy != "" ? "${local.ldap_policy} LDAP Policy." : "${local.org_name} LDAP Policy."
  domain                     = local.ldap_domain
  enable_encryption          = local.ldap_enable_encryption
  enable_dns                 = local.ldap_enable_dns
  enable_group_authorization = local.ldap_enable_group_authorization
  enabled                    = local.ldap_enabled
  filter                     = local.ldap_filter
  group_attribute            = local.ldap_group_attribute
  name                       = local.ldap_policy != "" ? local.ldap_policy : local.org_name
  nested_group_search_depth  = local.ldap_nested_group_search_depth
  nr_source                  = local.ldap_nr_source
  org_moid                   = local.org_moid
  password                   = local.ldap_password
  search_domain              = local.ldap_search_domain
  search_forest              = local.ldap_search_forest
  tags                       = var.tags
  timeout                    = local.ldap_timeout
  user_search_precedence     = local.ldap_user_search_precedence
}

#______________________________________________
#
# LDAP Provider
#______________________________________________

module "ldap_provider" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.ldap_policy
  ]
  for_each         = local.ldap_server
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_provider"
  ldap_policy_moid = module.ldap_policy.moid
  ldap_server      = each.value
}

#______________________________________________
#
# LDAP Groups
#______________________________________________

module "ldap_groups" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.ldap_policy
  ]
  for_each         = local.ldap_groups
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_group"
  group_role       = each.value.group_role
  ldap_group       = each.value.ldap_group
  ldap_policy_moid = module.ldap_policy.moid
}


#____________________________________________________________
#
# Local User Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# Local User Policy
#______________________________________________

module "local_user_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                   = "terraform-cisco-modules/imm/intersight//modules/policies_local_user_policy"
  description              = local.local_user_policy != "" ? "${var.local_user_policy} Local User Policy." : "${local.org_name} Local User Policy."
  enable_password_expiry   = local.local_user_password_expiry
  enforce_strong_password  = local.local_user_enforce_strong_password
  force_send_password      = local.local_user_force_send_password
  grace_period             = local.local_user_grace_period
  name                     = local.local_user_policy != "" ? var.local_user_policy : local.org_name
  notification_period      = local.local_notification_period
  org_moid                 = local.org_moid
  password_expiry_duration = local.local_password_expiry_duration
  password_history         = local.local_password_history
  tags                     = var.tags
}


#______________________________________________
#
# Local Users
#______________________________________________

module "local_users" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.local_user
  ]
  for_each         = local.local_users
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_local_user"
  org_moid         = local.org_moid
  user_enabled     = each.value.enabled
  user_password    = join(".", var, join("_", password_user, each.value.user_count))
  user_policy_moid = module.local_user.moid
  user_role        = each.value.role
  username         = each.value.username
}



#_______________________________________________________________
#
# Network Connectivity (DNS) Policy
# GUI Location: Policies > Create Policy
#_______________________________________________________________

module "dns" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity"
  description    = local.dns_policy != "" ? "${local.dns_policy} DNS Policy." : "${local.org_name} DNS Policy."
  dns_servers_v4 = local.dns_servers_v4
  dns_servers_v6 = local.dns_servers_v6
  dynamic_dns    = local.dynamic_dns
  ipv6_enable    = local.ipv6_enable
  name           = local.dns_policy != "" ? local.dns_policy : local.org_name
  org_moid       = local.org_moid
  tags           = var.tags
  update_domain  = local.update_domain
}


#____________________________________________________________
#
# NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description = local.ntp_policy != "" ? "${local.ntp_policy} NTP Policy." : "${local.org_name} NTP Policy."
  name        = local.ntp_policy != "" ? local.ntp_policy : local.org_name
  ntp_servers = local.ntp_servers
  org_moid    = local.org_moid
  tags        = var.tags
  timezone    = local.timezone
}


#____________________________________________________________
#
# Persistent Memory Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "persistent_memory" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source            = "terraform-cisco-modules/imm/intersight//modules/policies_persistent_memory"
  description       = local.persistent_memory_policy != "" ? "${local.persistent_memory_policy} Persistent Memory Policy." : "${local.org_name} Persistent Memory Policy."
  name              = local.persistent_memory_policy != "" ? local.persistent_memory_policy : local.org_name
  org_moid          = local.org_moid
  profiles          = []
  retain_namespaces = local.retain_namespaces
  secure_passphrase = var.persistent_passphrase
  tags              = var.tags
  logical_namespaces = [
    {
      capacity         = 512
      mode             = "raw"
      name             = "example_1"
      socket_id        = 1
      socket_memory_id = "Not Applicable"
    }
  ]
}


#____________________________________________________________
#
# SD Card Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "sd_card_m4" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = local.sdcard_policy != "" ? "${local.sdcard_policy} M4 SD Card Policy." : "${local.org_name} M4 SD Card Policy."
  name        = local.sdcard_policy != "" ? "${local.sdcard_policy}_m4" : "${local.org_name}_m4"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = var.sdcard_policy != "" ? "${var.sdcard_policy} M5 SD Card Policy without FlexUtil." : "${local.org_name} M5 SD Card Policy without FlexUtil."
  name        = var.sdcard_policy != "" ? "${var.sdcard_policy}_m5" : "${local.org_name}_m5"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5_flexutil" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = local.sdcard_policy != "" ? "${local.sdcard_policy} M5 SD Card Policy with FlexUtil." : "${local.org_name} M5 SD Card Policy with FlexUtil."
  name        = local.sdcard_policy != "" ? "${local.sdcard_policy}_m5flexutil" : "${local.org_name}_m5flexutil"
  org_moid    = local.org_moid
  tags        = var.tags
}


#____________________________________________________________
#
# Serial over LAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "serial_over_lan" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_serial_over_lan"
  description = local.serial_over_lan_policy != "" ? "${local.serial_over_lan_policy} Serial over LAN Policy." : "${local.org_name} Serial over LAN Policy."
  name        = local.serial_over_lan_policy != "" ? local.serial_over_lan_policy : local.org_name
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
}


#____________________________________________________________
#
# SMTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "smtp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_smtp"
  description     = local.smtp_policy != "" ? "${local.smtp_policy} SMTP Policy." : "${local.org_name} SMTP Policy."
  name            = local.smtp_policy != "" ? local.smtp_policy : local.org_name
  org_moid        = local.org_moid
  sender_email    = "admin@example.com"
  smtp_recipients = ["server_admins@example.com"]
  smtp_server     = "smtp-relay.example.com"
  tags            = var.tags
}


#____________________________________________________________
#
# SNMP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "snmp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description     = local.snmp_policy != "" ? "${local.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name            = local.snmp_policy != "" ? local.snmp_policy : local.org_name
  org_moid        = local.org_moid
  snmp_community  = local.snmp_community
  snmp_traps      = local.snmp_trap_destinations
  snmp_users      = local.snmp_users
  system_contact  = local.system_contact
  system_location = local.system_location
  tags            = var.tags
  trap_community  = local.trap_community
}


#____________________________________________________________
#
# SSH Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ssh_disable" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ssh"
  description = local.ssh_policy != "" ? "${local.ssh_policy} SSH Disable Policy." : "${local.org_name} SSH Disable Policy."
  enabled     = false
  name        = local.ssh_policy != "" ? "${local.ssh_policy}_disable" : "${local.org_name}_disable"
  org_moid    = local.org_moid
  port        = local.ssh_port
  tags        = var.tags
  timeout     = local.ssh_timeout
}

module "ssh_enable" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ssh"
  description = local.ssh_policy != "" ? "${local.ssh_policy} SSH Enable Policy." : "${local.org_name} SSH Enable Policy."
  enabled     = true
  name        = local.ssh_policy != "" ? "${local.ssh_policy}_enable" : "${local.org_name}_enable"
  org_moid    = local.org_moid
  port        = local.ssh_port
  tags        = var.tags
  timeout     = local.ssh_timeout
}



#____________________________________________________________
#
# Syslog Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "syslog" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  description     = local.syslog_policy != "" ? "${local.syslog_policy} Syslog Policy." : "${local.org_name} Syslog Policy."
  name            = local.syslog_policy != "" ? local.syslog_policy : local.org_name
  org_moid        = local.org_moid
  remote_clients  = local.syslog_destinations
  syslog_severity = local.syslog_severity
  tags            = var.tags
}


#____________________________________________________________
#
# Fibre Channel (vHBA) Adapter Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_adapter" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                           = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_adapter"
  description                      = local.vhba_adapter_policy != "" ? "${local.vhba_adapter_policy} vHBA Adapter Policy." : "${local.org_name} vHBA Adapter Policy."
  name                             = local.vhba_adapter_policy != "" ? local.vhba_adapter_policy : local.org_name
  org_moid                         = local.org_moid
  error_detection_timeout          = local.vhba_error_detection_timeout
  error_recovery_enabled           = local.vhba_error_recovery_enabled
  error_recovery_io_retry_count    = local.vhba_error_recovery_io_retry_count
  error_recovery_io_retry_timeout  = local.vhba_error_recovery_io_retry_timeout
  error_recovery_link_down_timeout = local.vhba_error_recovery_link_down_timeout
  error_recovery_port_down_timeout = local.vhba_error_recovery_port_down_timeout
  flogi_retries                    = local.vhba_flogi_retries
  flogi_timeout                    = local.vhba_flogi_timeout
  interrupt_mode                   = local.vhba_interrupt_mode
  io_throttle_count                = local.vhba_io_throttle_count
  lun_count                        = local.vhba_lun_count
  lun_queue_depth                  = local.vhba_lun_queue_depth
  plogi_retries                    = local.vhba_plogi_retries
  plogi_timeout                    = local.vhba_plogi_timeout
  resource_allocation_timeout      = local.vhba_resource_allocation_timeout
  rx_ring_size                     = local.vhba_rx_ring_size
  scsi_io_queues                   = local.vhba_scsi_io_queues
  scsi_io_ring_size                = local.vhba_scsi_io_ring_size
  tags                             = var.tags
  tx_ring_size                     = local.vhba_tx_ring_size
}


#____________________________________________________________
#
# Fibre Channel (vHBA) Network Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_network_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  description = local.vhba_network_policy != "" ? "${local.vhba_network_policy} vHBA Network Fabric A Policy." : "${local.org_name} vHBA Network Fabric A Policy."
  name        = local.vhba_network_policy != "" ? "${local.vhba_network_policy}_a" : "${local.org_name}_a"
  org_moid    = local.org_moid
  tags        = var.tags
  vsan_id     = local.vhba_vsan_a
}

module "vhba_network_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  description = local.vhba_network_policy != "" ? "${local.vhba_network_policy} vHBA Network Fabric B Policy." : "${local.org_name} vHBA Network Fabric B Policy."
  name        = local.vhba_network_policy != "" ? "${local.vhba_network_policy}_b" : "${local.org_name}_b"
  org_moid    = local.org_moid
  tags        = var.tags
  vsan_id     = local.vhba_vsan_b
}


#____________________________________________________________
#
# Fibre Channel (vHBA) QoS Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_qos" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos"
  burst               = local.vhba_burst
  description         = local.vhba_qos_policy != "" ? "${local.vhba_qos_policy} vHBA QoS Policy." : "${local.org_name} vHBA QoS Policy."
  max_data_field_size = local.vhba_max_data_field_size
  name                = local.vhba_qos_policy != "" ? local.vhba_qos_policy : local.org_name
  org_moid            = local.org_moid
  rate_limit          = local.vhba_rate_limit
  tags                = var.tags
}


#____________________________________________________________
#
# Virtual KVM Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "virtual_kvm" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                    = "terraform-cisco-modules/imm/intersight//modules/policies_virtual_kvm"
  description               = local.virtual_kvm_policy != "" ? "${local.virtual_kvm_policy} Virtual KVM Policy." : "${local.org_name} Virtual KVM Policy."
  enable_local_server_video = local.vkvm_local_server_video
  enable_video_encryption   = local.vkvm_video_encryption
  enabled                   = local.vkvm_enabled
  maximum_sessions          = local.vkvm_maximum_sessions
  name                      = local.virtual_kvm_policy != "" ? local.virtual_kvm_policy : local.org_name
  org_moid                  = local.org_moid
  remote_port               = local.vkvm_remote_port
  tags                      = var.tags
}


#____________________________________________________________
#
# Virtual Media Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "virtual_media" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/policies_virtual_media"
  description   = local.virtual_media_policy != "" ? "${local.virtual_media_policy} Virtual Media Policy." : "${local.org_name} Virtual Media Policy."
  enabled       = local.vmedia_enabled
  encryption    = local.vmedia_encryption
  low_power_usb = local.vmedia_low_power_usb
  name          = local.virtual_media_policy != "" ? local.virtual_media_policy : local.org_name
  org_moid      = local.org_moid
  tags          = var.tags
  mappings      = local.vmedia_mappings
}

#____________________________________________________________
#
# Ethernet (vNIC) Adapter Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_adapter_linux" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - Linux." : "${local.org_name} vNIC Adapter Policy - Linux."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_linux" : "${local.org_name}_linux"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queues = 2
  # Interrupt Settings - Reduce Interrupts
  interrupt_interrupts = 4
  # Disable Receive Side Scaling
  receive_side_scaling = false
  # Reduce Receive Queues
  rx_queue_count = 1
}

module "vnic_adapter_nvmeof" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy for NVMe over Fabric." : "${local.org_name} vNIC Adapter Policy for NVMe over Fabric."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_nvmeof" : "${local.org_name}_nvmeof"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Increase Completion Queues
  completion_queues = 16
  # Interrupt Settings - Increase Interrupts
  interrupt_interrupts = 256
  # Enable RoCE
  roce_enable          = true
  roce_memory_regions  = 131072
  roce_queue_pairs     = 1024
  roce_resource_groups = 8
  # Recieve Settings - Increase Receive Settings
  rx_queue_count = 8
  rx_ring_size   = 4096
  # Transmit Settings - Increase Transmit Settings
  tx_queue_count = 8
  tx_ring_size   = 4096
}

module "vnic_adapter_vmware" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - VMware." : "${local.org_name} vNIC Adapter Policy - VMware."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_vmware" : "${local.org_name}_vmware"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queues = 2
  # Interrupt Settings - Reduce Interupts
  interrupt_interrupts = 4
  # Disable Receive Side Scaling
  receive_side_scaling = false
  # Reduce Receive Queues
  rx_queue_count = 1
}

module "vnic_adapter_windows" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy} vNIC Adapter Policy - Windows." : "${local.org_name} vNIC Adapter Policy - Windows."
  name        = local.vnic_adapter_policy != "" ? "${local.vnic_adapter_policy}_windows" : "${local.org_name}_windows"
  org_moid    = local.org_moid
  tags        = var.tags
}


#____________________________________________________________
#
# Ethernet (vNIC) Network Control Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_netctrl_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy." : "${local.org_name} vNIC Network Control Policy."
  mac_registration_mode = "allVlans"
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}" : "${local.org_name}"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_cdp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  cdp_enabled           = true
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy - CDP Eanbled." : "${local.org_name} vNIC Network Control Policy - CDP Eanbled."
  mac_registration_mode = "allVlans"
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}_cdp" : "${local.org_name}_cdp"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_lldp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  description           = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy} vNIC Network Control Policy - LLDP Eanbled." : "${local.org_name} vNIC Network Control Policy - LLDP Eanbled."
  mac_registration_mode = "allVlans"
  lldp_receive          = true
  lldp_transmit         = true
  name                  = local.vnic_netctrl_policy != "" ? "${local.vnic_netctrl_policy}_lldp" : "${local.org_name}_lldp"
  org_moid              = local.org_moid
  tags                  = var.tags
}


#____________________________________________________________
#
# Ethernet (vNIC) Network Group Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_vlan_group_livem" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Live Migration VLANs." : "${local.org_name} vNIC Network Group Policy - Live Migration VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_live_migration" : "${local.org_name}_live_migration"
  native_vlan = local.vnic_livem_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_livem_vlan_list
}

module "vnic_vlan_group_mgmt" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Management VLANs." : "${local.org_name} vNIC Network Group Policy - Management VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_mgmt" : "${local.org_name}_mgmt"
  native_vlan = local.vnic_mgmt_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_mgmt_vlan_list
}

module "vnic_vlan_group_stg" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Storage VLANs." : "${local.org_name} vNIC Network Group Policy - Storage VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_storage" : "${local.org_name}_storage"
  native_vlan = local.vnic_stg_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_stg_vlan_list
}

module "vnic_vlan_group_vms" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy} vNIC Network Group Policy - Virtual Machine VLANs." : "${local.org_name} vNIC Network Group Policy - Virtual Machine VLANs."
  list_type   = "list"
  name        = local.vnic_netgrp_policy != "" ? "${local.vnic_netgrp_policy}_virtual_machines" : "${local.org_name}_virtual_machines"
  native_vlan = local.vnic_vms_native_vlan
  org_moid    = local.org_moid
  tags        = var.tags
  vlan_list   = local.vnic_vms_vlan_list
}

#______________________________________________
#
# Ethernet (vNIC) QoS Policies
# GUI Location: Policies > Create Policy
#______________________________________________

module "vnic_qos_platinum" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Platinum." : "${local.org_name} vNIC QoS Policy - Platinum."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_platinum" : "${local.org_name}_platinum"
  mtu            = local.vnic_platinum_mtu
  burst          = local.vnic_platinum_burst
  priority       = "Platinum"
  rate_limit     = local.vnic_platinum_rate_limit
  trust_host_cos = local.vnic_platinum_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_gold" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Gold." : "${local.org_name} vNIC QoS Policy - Gold."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_gold" : "${local.org_name}_gold"
  mtu            = local.vnic_gold_mtu
  burst          = local.vnic_gold_burst
  priority       = "Gold"
  rate_limit     = local.vnic_gold_rate_limit
  trust_host_cos = local.vnic_gold_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_silver" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Silver." : "${local.org_name} vNIC QoS Policy - Silver."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_silver" : "${local.org_name}_silver"
  mtu            = local.vnic_silver_mtu
  burst          = local.vnic_silver_burst
  priority       = "Silver"
  rate_limit     = local.vnic_silver_rate_limit
  trust_host_cos = local.vnic_silver_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_bronze" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Bronze." : "${local.org_name} vNIC QoS Policy - Bronze."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_bronze" : "${local.org_name}_bronze"
  mtu            = local.vnic_bronze_mtu
  burst          = local.vnic_bronze_burst
  priority       = "Bronze"
  rate_limit     = local.vnic_bronze_rate_limit
  trust_host_cos = local.vnic_bronze_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}

module "vnic_qos_best_effort" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy} vNIC QoS Policy - Best Effort." : "${local.org_name} vNIC QoS Policy - Best Effort."
  name           = local.vnic_qos_policy != "" ? "${local.vnic_qos_policy}_best_effort" : "${local.org_name}_best_effort"
  mtu            = local.vnic_best_effort_mtu
  burst          = local.vnic_best_effort_burst
  priority       = "Bronze"
  rate_limit     = local.vnic_best_effort_rate_limit
  trust_host_cos = local.vnic_best_effort_trust_host_cos
  org_moid       = local.org_moid
  tags           = var.tags
}


#______________________________________________
#
# LAN Connectivity
#______________________________________________

module "vnic_lan_connectivity" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_lan_connectivity"
  description = local.vnic_lan_connectivity != "" ? "${local.vnic_lan_connectivity} vNIC LAN Connectivity Policy." : "${local.org_name} vNIC LAN Connectivity Policy."
  name        = local.vnic_lan_connectivity != "" ? local.vnic_lan_connectivity : local.org_name
  org_moid    = local.org_moid
  profiles    = []
  tags        = var.tags
}


#______________________________________________
#
# Create vNICs
#______________________________________________

module "vnic_loop" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.vnic_adapter_policy,
    module.vnic_lan_connectivity,
    module.vnic_netctrl_policy,
    module.vnic_vlan_group_livem,
    module.vnic_vlan_group_mgmt,
    module.vnic_vlan_group_stg,
    module.vnic_vlan_group_vms,
    module.vnic_qos_platinum,
    module.vnic_qos_gold,
    module.vnic_qos_silver,
    module.vnic_qos_bronze,
    module.vnic_qos_best_effort,
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_loop"
  cdn_source            = "vnic"
  lan_connectivity_moid = module.vnic_lan_connectivity.moid
  mac_address_type      = "POOL"
  placement_pci_link    = local.vnic_placement_pci_link
  placement_uplink      = local.vnic_placement_uplink
  placement_slot_id     = local.vnic_placement_slot_id
  fabric_vnic = {
    vNIC_0 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_management
      vnic_name         = "MANAGEMENT-A"
      vnic_order        = 0
      vnic_qos_moid     = module.vnic_qos_silver.moid
      vnic_vlans_moid   = module.vnic_vlan_group_mgmt.moid
    },
    vNIC_1 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_management
      vnic_name         = "MANAGEMENT-B"
      vnic_order        = 1
      vnic_qos_moid     = module.vnic_qos_silver.moid
      vnic_vlans_moid   = module.vnic_vlan_group_mgmt.moid
    },
    vNIC_2 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_migration
      vnic_name         = "MIGRATION-A"
      vnic_order        = 2
      vnic_qos_moid     = module.vnic_qos_bronze.moid
      vnic_vlans_moid   = module.vnic_vlan_group_livem.moid
    },
    vNIC_3 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_migration
      vnic_name         = "MIGRATION-B"
      vnic_order        = 3
      vnic_qos_moid     = module.vnic_qos_bronze.moid
      vnic_vlans_moid   = module.vnic_vlan_group_livem.moid
    },
    vNIC_4 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_storage
      vnic_name         = "STORAGE-A"
      vnic_order        = 4
      vnic_qos_moid     = module.vnic_qos_platinum.moid
      vnic_vlans_moid   = module.vnic_vlan_group_stg.moid
    },
    vNIC_5 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_storage
      vnic_name         = "STORAGE-B"
      vnic_order        = 5
      vnic_qos_moid     = module.vnic_qos_platinum.moid
      vnic_vlans_moid   = module.vnic_vlan_group_stg.moid
    }
    vNIC_6 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id         = "A"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_virtual
      vnic_name         = "VIRTUAL-A"
      vnic_order        = 6
      vnic_qos_moid     = module.vnic_qos_gold.moid
      vnic_vlans_moid   = module.vnic_vlan_group_vms.moid
    },
    vNIC_7 = {
      mac_pool_moid     = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id         = "B"
      vnic_adapter_moid = local.vnic_adapter_policy_management
      vnic_control_moid = local.vnic_network_control_virtual
      vnic_name         = "VIRTUAL-B"
      vnic_order        = 7
      vnic_qos_moid     = module.vnic_qos_gold.moid
      vnic_vlans_moid   = module.vnic_vlan_group_vms.moid
    }
  }
}

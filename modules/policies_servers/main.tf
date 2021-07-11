#____________________________________________________________
#
# BIOS Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "bios" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
  description = var.bios_policy != "" ? "${var.bios_policy} BIOS Policy." : "${local.org_name} BIOS Policy."
  name        = var.bios_policy != "" ? var.bios_policy : local.org_name
  org_moid    = local.org_moid
  profiles    = []
  tags        = local.tags
  #+++++++++++++++++++++++++++++++
  # Boot Options Section
  #+++++++++++++++++++++++++++++++
  vmd_enable = "enabled"          # VMD Enablement
  #+++++++++++++++++++++++++++++++
  # Intel Directed IO Section
  #+++++++++++++++++++++++++++++++
  intel_vt_for_directed_io      = "enabled" # Intel VT for Directed IO
  intel_vtd_coherency_support   = "enabled" # Intel(R) VT-d Coherency Support
  intel_vtd_interrupt_remapping = "enabled" # Intel(R) VT-d interrupt Remapping
  #+++++++++++++++++++++++++++++++
  # LOM and PCIe Slots Section
  #+++++++++++++++++++++++++++++++
  cdn_support         = "enabled"  # CDN Support for LOM
  lom_ports_all_state = "disabled" # All Onboard LOM Ports
  #+++++++++++++++++++++++++++++++
  # Memory Section
  #+++++++++++++++++++++++++++++++
  select_memory_ras_configuration = "maximum-performance" # Memory RAS Configuration
  #+++++++++++++++++++++++++++++++
  # PCI Section
  #+++++++++++++++++++++++++++++++
  memory_mapped_io_above4gb = "enabled" # Memory Mapped IO Above 4GiB
  #+++++++++++++++++++++++++++++++
  # Processor Section
  #+++++++++++++++++++++++++++++++
  altitude                        = "auto"        # Altitude
  cpu_energy_performance          = "performance" # Energy Performance
  cpu_performance                 = "hpc"         # CPU Performance
  cpu_frequency_floor             = "enabled"     # Frequency Floor Override
  cpu_power_management            = "performance" # Power Technology
  direct_cache_access             = "enabled"     # Direct Cache Access Support
  dram_clock_throttling           = "Performance" # DRAM Clock Throttling
  imc_interleave                  = "Auto"        # IMC Interleaving
  intel_virtualization_technology = "enabled"     # Intel(R) VT
  llc_prefetch                    = "disabled"    # LLC Prefetch
  processor_c1e                   = "disabled"    # Processor C1E
  processor_c3report              = "disabled"    # Processor C3 Report
  processor_c6report              = "disabled"    # Processor C6 Report
  processor_cstate                = "disabled"    # CPU C State
  snc                             = "disabled"    # Sub Numa Clustering
  xpt_prefetch                    = "disabled"    # XPT Prefetch
  #+++++++++++++++++++++++++++++++
  # Serial Port Section
  #+++++++++++++++++++++++++++++++
  serial_port_aenable = "enabled" # Serial A Enable
  #+++++++++++++++++++++++++++++++
  # Server Management Section
  #+++++++++++++++++++++++++++++++
  cdn_enable            = "enabled"       # Consistent Device Naming
  console_redirection   = "serial-port-a" # Console Redirection
  out_of_band_mgmt_port = "enabled"       # Out-of-Band Mgmt Port
  #+++++++++++++++++++++++++++++++
  # Trusted Platform Section
  #+++++++++++++++++++++++++++++++
  txt_support = "enabled" # Intel Trusted Execution Technology Support
}

module "bios_m4" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_bios"
  description = var.bios_policy != "" ? "${var.bios_policy} M4 BIOS Policy." : "${local.org_name} M4 BIOS Policy."
  name        = var.bios_policy != "" ? "${var.bios_policy}_m4" : "${local.org_name}_m4"
  org_moid    = local.org_moid
  profiles    = []
  tags        = local.tags
  #+++++++++++++++++++++++++++++++
  # Intel Directed IO Section
  #+++++++++++++++++++++++++++++++
  intel_vt_for_directed_io      = "enabled" # Intel VT for Directed IO
  intel_vtd_coherency_support   = "enabled" # Intel(R) VT-d Coherency Support
  intel_vtd_interrupt_remapping = "enabled" # Intel(R) VT-d interrupt Remapping
  #+++++++++++++++++++++++++++++++
  # LOM and PCIe Slots Section
  #+++++++++++++++++++++++++++++++
  cdn_support         = "enabled"  # CDN Support for LOM
  lom_ports_all_state = "disabled" # All Onboard LOM Ports
  #+++++++++++++++++++++++++++++++
  # Memory Section
  #+++++++++++++++++++++++++++++++
  select_memory_ras_configuration = "maximum-performance" # Memory RAS Configuration
  #+++++++++++++++++++++++++++++++
  # PCI Section
  #+++++++++++++++++++++++++++++++
  memory_mapped_io_above4gb = "enabled" # Memory Mapped IO Above 4GiB
  #+++++++++++++++++++++++++++++++
  # Processor Section
  #+++++++++++++++++++++++++++++++
  altitude                        = "auto"        # Altitude
  cpu_energy_performance          = "performance" # Energy Performance
  cpu_frequency_floor             = "enabled"     # Frequency Floor Override
  cpu_power_management            = "performance" # Power Technology
  direct_cache_access             = "enabled"     # Direct Cache Access Support
  dram_clock_throttling           = "Performance" # DRAM Clock Throttling
  intel_virtualization_technology = "enabled"     # Intel(R) VT
  processor_c1e                   = "disabled"    # Processor C1E
  processor_c3report              = "disabled"    # Processor C3 Report
  processor_c6report              = "disabled"    # Processor C6 Report
  processor_cstate                = "disabled"    # CPU C State
  #+++++++++++++++++++++++++++++++
  # Serial Port Section
  #+++++++++++++++++++++++++++++++
  serial_port_aenable = "enabled" # Serial A Enable
  #+++++++++++++++++++++++++++++++
  # Server Management Section
  #+++++++++++++++++++++++++++++++
  cdn_enable            = "enabled"       # Consistent Device Naming
  console_redirection   = "serial-port-a" # Console Redirection
  out_of_band_mgmt_port = "enabled"       # Out-of-Band Mgmt Port
  #+++++++++++++++++++++++++++++++
  # Trusted Platform Section
  #+++++++++++++++++++++++++++++++
  txt_support = "enabled" # Intel Trusted Execution Technology Support
}


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
  boot_secure = var.boot_secure
  description = var.boot_policy != "" ? "${var.boot_policy} UEFI M.2 PCH Boot Policy." : "${local.org_name} UEFI M.2 PCH Boot Policy."
  name        = var.boot_policy != "" ? "${var.boot_policy}_uefi_m2pch" : "${local.org_name}_uefi_m2pch"
  org_moid    = local.org_moid
  profiles    = []
  tags        = local.tags
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
      enabled               = true,
      name                  = "M2",
      object_type           = "boot.PchStorage",
    },
  ]
}

module "boot_uefi_m2raid" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  boot_secure = var.boot_secure
  description = var.boot_policy != "" ? "${var.boot_policy} UEFI M.2 HWRAID Boot Policy." : "${local.org_name} UEFI M.2 HWRAID Boot Policy."
  name        = var.boot_policy != "" ? "${var.boot_policy}_uefi_m2raid" : "${local.org_name}_uefi_m2raid"
  org_moid    = local.org_moid
  profiles    = []
  tags        = local.tags
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
      enabled               = true,
      name                  = "LocalDisk",
      object_type           = "boot.LocalDisk",
    },
  ]
}

module "boot_uefi_sdcard" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_boot_order"
  boot_secure = var.boot_secure
  description = var.boot_policy != "" ? "${var.boot_policy} UEFI SD Card Boot Policy." : "${local.org_name} UEFI SD Card Boot Policy."
  name        = var.boot_policy != "" ? "${var.boot_policy}_uefi_sdcard" : "${local.org_name}_uefi_sdcard"
  org_moid    = local.org_moid
  profiles    = []
  tags        = local.tags
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
      enabled               = true,
      name                  = "SdCard",
      object_type           = "boot.SdCard",
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
  description = var.device_connector_policy != "" ? "${var.device_connector_policy} Device Connector Policy." : "${local.org_name} Device Connector Policy."
  lockout     = var.dc_lockout
  name        = var.device_connector_policy != "" ? var.device_connector_policy : local.org_name
  org_moid    = local.org_moid
  tags        = local.tags
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
  description = var.disk_group_policy != "" ? "${var.disk_group_policy} Disk Group Policy Raid 1." : "${local.org_name} Disk Group Policy Raid 1."
  name        = var.disk_group_policy != "" ? "${var.disk_group_policy}_raid1" : "${local.org_name}_raid1"
  raid_level  = "Raid1"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = local.tags
  # The default var.span_groups included disk 1 and 2
  # which will work for this.
}

module "disk_group_raid5" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_disk_group"
  description = var.disk_group_policy != "" ? "${var.disk_group_policy} Disk Group Policy Raid 5." : "${local.org_name} Disk Group Policy Raid 5."
  name        = var.disk_group_policy != "" ? "${var.disk_group_policy}_raid5" : "${local.org_name}_raid5"
  raid_level  = "Raid5"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = local.tags
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
  description = var.disk_group_policy != "" ? "${var.disk_group_policy} Disk Group Policy Raid 10." : "${local.org_name} Disk Group Policy Raid 10."
  name        = var.disk_group_policy != "" ? "${var.disk_group_policy}_raid10" : "${local.org_name}_raid10"
  raid_level  = "Raid10"
  use_jbods   = true
  org_moid    = local.org_moid
  tags        = local.tags
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
  description   = var.storage_policy != "" ? "${var.storage_policy} Storage Policy." : "${local.org_name} Storage Policy."
  name          = var.storage_policy != "" ? var.storage_policy : local.org_name
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
  description = var.imc_access_policy != "" ? "${var.imc_access_policy} IMC Access Policy." : "${local.org_name} IMC Access Policy."
  inband_mgmt_vlan = var.imc_mgmt_vlan
  name        = var.imc_access_policy != "" ? var.imc_access_policy : local.org_name
  org_moid         = local.org_moid
  tags             = local.tags
  ipv4_enable      = var.ipv4_enable
  ipv6_enable      = var.ipv6_enable
  imc_ip_pool      = var.imc_ip_pool
}

#____________________________________________________________
#
# IPMI over LAN Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ipmi_over_lan" {
  depends_on        = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_ipmi_over_lan"
  description           = var.ipmi_over_lan_policy != "" ? "${var.ipmi_over_lan_policy} IPMI Over LAN Policy." : "${local.org_name} IPMI Over LAN Policy."
  enabled               = var.ipmi_enabled
  encryption_key        = var.ipmi_encryption_key
  is_encryption_key_set = var.ipmi_encryption_enable
  privilege             = var.ipmi_privilege
  name                  = var.ipmi_over_lan_policy != "" ? var.ipmi_over_lan_policy : local.org_name
  profiles              = []
  org_moid              = local.org_moid
  tags                  = local.tags
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
  attribute                  = var.ldap_attribute
  base_dn                    = var.ldap_base_dn
  bind_dn                    = var.ldap_bind_dn
  bind_method                = var.ldap_bind_method
  description                = var.ldap_policy != "" ? "${var.ldap_policy} LDAP Policy." : "${local.org_name} LDAP Policy."
  domain                     = var.ldap_domain
  enable_encryption          = var.ldap_enable_encryption
  enable_dns                 = var.ldap_enable_dns
  enable_group_authorization = var.ldap_enable_group_authorization
  enabled                    = var.ldap_enabled
  filter                     = var.ldap_filter
  group_attribute            = var.ldap_group_attribute
  name                       = var.ldap_policy != "" ? var.ldap_policy : local.org_name
  nested_group_search_depth  = var.ldap_nested_group_search_depth
  nr_source                  = var.ldap_nr_source
  org_moid                   = local.org_moid
  password                   = var.ldap_password
  search_domain              = var.ldap_search_domain
  search_forest              = var.ldap_search_forest
  tags                       = local.tags
  timeout                    = var.ldap_timeout
  user_search_precedence     = var.ldap_user_search_precedence
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
  for_each         = var.ldap_server
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
  for_each         = var.ldap_groups
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
  description              = var.local_user_policy != "" ? "${var.local_user_policy} Local User Policy." : "${local.org_name} Local User Policy."
  enable_password_expiry   = var.local_user_password_expiry
  enforce_strong_password  = var.local_user_enforce_strong_password
  force_send_password      = var.local_user_force_send_password
  grace_period             = var.local_user_grace_period
  name                     = var.local_user_policy != "" ? var.local_user_policy : local.org_name
  notification_period      = var.local_notification_period
  org_moid                 = var.org_moid
  password_expiry_duration = var.local_password_expiry_duration
  password_history         = var.local_password_history
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
  user_password    = "${join(".", var, join("_", password_user, each.value.user_count))}"
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
  description    = var.dns_policy != "" ? "${var.dns_policy} DNS Policy." : "${local.org_name} DNS Policy."
  dns_servers_v4 = var.dns_servers_v4
  dns_servers_v6 = var.dns_servers_v6
  dynamic_dns    = var.dynamic_dns
  ipv6_enable    = var.ipv6_enable
  name           = var.dns_policy != "" ? var.dns_policy : local.org_name
  org_moid       = local.org_moid
  tags           = local.tags
  update_domain  = var.update_domain
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
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description    = var.ntp_policy != "" ? "${var.ntp_policy} NTP Policy." : "${local.org_name} NTP Policy."
  name           = var.ntp_policy != "" ? var.ntp_policy : local.org_name
  ntp_servers  = var.ntp_servers
  org_moid     = local.org_moid
  tags         = local.tags
  timezone     = var.timezone
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
  description       = var.persistent_memory_policy != "" ? "${var.persistent_memory_policy} Persistent Memory Policy." : "${local.org_name} Persistent Memory Policy."
  name              = var.persistent_memory_policy != "" ? var.persistent_memory_policy : local.org_name
  org_moid          = local.org_moid
  profiles          = []
  retain_namespaces = var.retain_namespaces
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
  description    = var.sdcard_policy != "" ? "${var.sdcard_policy} M4 SD Card Policy." : "${local.org_name} M4 SD Card Policy."
  name           = var.sdcard_policy != "" ? "${var.sdcard_policy}_m4" : "${local.org_name}_m4"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description    = var.sdcard_policy != "" ? "${var.sdcard_policy} M5 SD Card Policy without FlexUtil." : "${local.org_name} M5 SD Card Policy without FlexUtil."
  name           = var.sdcard_policy != "" ? "${var.sdcard_policy}_m5" : "${local.org_name}_m5"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "sd_card_m5_flexutil" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_sd_card"
  description = var.sdcard_policy != "" ? "${var.sdcard_policy} M5 SD Card Policy with FlexUtil." : "${local.org_name} M5 SD Card Policy with FlexUtil."
  name        = var.sdcard_policy != "" ? "${var.sdcard_policy}_m5flexutil" : "${local.org_name}_m5flexutil"
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
  description = var.serial_over_lan_policy != "" ? "${var.serial_over_lan_policy} Serial over LAN Policy." : "${local.org_name} Serial over LAN Policy."
  name        = var.serial_over_lan_policy != "" ? var.serial_over_lan_policy : local.org_name
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
  description     = var.smtp_policy != "" ? "${var.smtp_policy} SMTP Policy." : "${local.org_name} SMTP Policy."
  name            = var.smtp_policy != "" ? var.smtp_policy : local.org_name
  org_moid        = local.org_moid
  profiles        = []
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
  description    = var.snmp_policy != "" ? "${var.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name           = var.snmp_policy != "" ? var.snmp_policy : local.org_name
  org_moid        = local.org_moid
  snmp_community  = var.snmp_community
  snmp_traps      = var.snmp_trap_destinations
  snmp_users      = var.snmp_users
  system_contact  = var.system_contact
  system_location = var.system_location
  tags            = local.tags
  trap_community  = var.trap_community
}


#____________________________________________________________
#
# SSH Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ssh" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_ssh"
  description = var.ssh_policy != "" ? "${var.ssh_policy} SSH Policy." : "${local.org_name} SSH Policy."
  name        = var.ssh_policy != "" ? var.ssh_policy : local.org_name
  org_moid    = local.org_moid
  profiles    = []
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
  description     = var.syslog_policy != "" ? "${var.syslog_policy} Syslog Policy." : "${local.org_name} Syslog Policy."
  name            = var.syslog_policy != "" ? var.syslog_policy : local.org_name
  org_moid        = local.org_moid
  remote_clients  = var.syslog_destinations
  syslog_severity = var.syslog_severity
  tags            = local.tags
}


#____________________________________________________________
#
# Fibre Channel (vHBA) Adapter Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vhba_adapter_example" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_adapter"
  description = "vHBA Adapter Policy Example."
  name        = "vhba_adapter"
  org_moid    = local.org_moid
  error_detection_timeout          = 20000
  error_recovery_enabled           = false
  error_recovery_io_retry_count    = 8
  error_recovery_io_retry_timeout  = 5
  error_recovery_link_down_timeout = 30000
  error_recovery_port_down_timeout = 10000
  flogi_retries                    = 8
  flogi_timeout                    = 4000
  interrupt_mode                   = "MSIx"
  io_throttle_count                = 512
  lun_count                        = 1024
  lun_queue_depth                  = 20
  plogi_retries                    = 8
  plogi_timeout                    = 20000
  resource_allocation_timeout      = 10000
  rx_ring_size                     = 64
  scsi_io_queues                   = 1
  scsi_io_ring_size                = 512
  tags                             = var.tags
  tx_ring_size                     = 64
}


# Fabric Interconnect Attached Example
module "vhba_network_example_a" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  vsan_id     = 100
  description = "vHBA Network Policy Fabric A Example."
  name        = "example_a"
  org_moid    = local.org_moid
  tags        = var.tags
}

module "vhba_network_example_b" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_network"
  vsan_id     = 200
  description = "vHBA Network Policy Fabric B Example."
  name        = "example_b"
  org_moid    = local.org_moid
  tags        = var.tags
}


# Fabric Interconnect Attached Example
module "vhba_qos_example_1" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos"
  description = "FI Attached vHBA QoS Example"
  name        = "example_1"
  org_moid    = local.org_moid
  tags        = var.tags
}

# Standalone Example
module "vhba_qos_example_2" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vhba_qos"
  description = "Standalone vHBA QoS Example"
  name        = "example_2"
  org_moid    = local.org_moid
  tags        = var.tags
}


#____________________________________________________________
#
# (VIC) Adapter Configuration (Standalone Servers)
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vic_adapter" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vic_adapter"
  description         = var.vic_adapter_policy != "" ? "${var.vic_adapter_policy} VIC Adapter Policy (Standalone Servers)." : "${local.org_name} VIC Adapter Policy (Standalone Servers)."
  fip_enabled         = var.vic_fip_enabled
  int0_fec_mode       = var.vic_fec_mode_int0
  int1_fec_mode       = var.vic_fec_mode_int1
  int2_fec_mode       = var.vic_fec_mode_int2
  int3_fec_mode       = var.vic_fec_mode_int3
  lldp_enabled        = var.vic_lldp_enabled
  name                = var.vic_adapter_policy != "" ? var.vic_adapter_policy : local.org_name
  org_moid            = local.org_moid
  portchannel_enabled = var.vic_portchannel
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
  description               = var.virtual_kvm_policy != "" ? "${var.virtual_kvm_policy} Virtual KVM Policy." : "${local.org_name} Virtual KVM Policy."
  enable_local_server_video = var.vkvm_local_server_video
  enable_video_encryption   = var.vkvm_video_encryption
  enabled                   = var.vkvm_enabled
  maximum_sessions          = var.vkvm_maximum_sessions
  name                      = var.virtual_kvm_policy != "" ? var.virtual_kvm_policy : local.org_name
  org_moid                  = local.org_moid
  remote_port               = var.vkvm_remote_port
  tags                      = local.tags
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
  description   = var.virtual_media_policy != "" ? "${var.virtual_media_policy} Virtual Media Policy." : "${local.org_name} Virtual Media Policy."
  enabled       = var.vmedia_enabled
  encryption    = var.vmedia_encryption
  low_power_usb = var.vmedia_low_power_usb
  name          = var.virtual_media_policy != "" ? var.virtual_media_policy : local.org_name
  org_moid      = local.org_moid
  tags          = local.tags
  mappings      = var.vmedia_mappings
}

#____________________________________________________________
#
# Ethernet (vNIC) Adapter Policies
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_adapter_nvmeof" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy} vNIC Adapter Policy for NVMe over Fabric." : "${local.org_name} vNIC Adapter Policy for NVMe over Fabric."
  name        = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy}_nvmeof" : "${local.org_name}_nvmeof"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queue_count = 2
  # Interrupt Settings - Increase Interupts
  interrupt_interrupts = 256
  # Enable RoCE
  roce_enable          = true
  roce_memory_regions  = 131072
  roce_queue_pairs     = 256
  roce_resource_groups = 4
  # Reduce Recieve Queue Count
  rx_queue_count = 1
}

module "vnic_adapter_vmware" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy} vNIC Adapter Policy for VMware." : "${local.org_name} vNIC Adapter Policy for VMware."
  name        = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy}_vmware" : "${local.org_name}_vmware"
  org_moid    = local.org_moid
  tags        = var.tags
  # Completion Settings - Reduce Queue Count
  completion_queue_count = 2
  # Interrupt Settings - Reduce Interupts
  interrupt_interrupts = 4
  # Disable Receive Side Scaling
  receive_side_scaling = false
  # Reduce Recieve Queue Count
  rx_queue_count = 1
}

module "vnic_adapter_windows" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_adapter"
  description = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy} vNIC Adapter Policy." : "${local.org_name} vNIC Adapter Policy."
  name        = var.vnic_adapter_policy != "" ? "${var.vnic_adapter_policy}_windows" : "${local.org_name}_windows"
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
  description           = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy} vNIC Network Control Policy." : "${local.org_name} vNIC Network Control Policy."
  mac_registration_mode = "allVlans"
  name                  = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy}" : "${local.org_name}"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_cdp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  cdp_enabled           = true
  description           = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy} vNIC Network Control Policy - CDP Eanbled." : "${local.org_name} vNIC Network Control Policy - CDP Eanbled."
  mac_registration_mode = "allVlans"
  name                  = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy}_cdp" : "${local.org_name}_cdp"
  org_moid              = local.org_moid
  tags                  = var.tags
}

module "vnic_netctrl_policy_lldp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_control"
  description           = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy} vNIC Network Control Policy - LLDP Eanbled." : "${local.org_name} vNIC Network Control Policy - LLDP Eanbled."
  mac_registration_mode = "allVlans"
  lldp_receive          = true
  lldp_transmit         = true
  name                  = var.vnic_netctrl_policy != "" ? "${var.vnic_netctrl_policy}_lldp" : "${local.org_name}_lldp"
  org_moid              = local.org_moid
  tags                  = var.tags
}


#____________________________________________________________
#
# Example Intersight Ethernet vNIC Adapter Policy Module
# GUI Location: Policies > Create Policy
#____________________________________________________________

#________________________________________________
#
# Example VLAN Group using a Range of VLANs
# GUI Location: Policies > Create Policy
#________________________________________________



module "vnic_vlan_group_1" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network_group"
  description = "Example VLAN Group using Range."
  name        = "vlan_group_range"
  org_moid    = local.org_moid
  tags        = var.tags
  native_vlan = 1
  # The Range Below would add VLANs 1 thru 100.
  list_type  = "range"
  vlan_start = 1
  vlan_stop  = 101
}

#____________________________________________________________
#
# Ethernet (vNIC) Network Policy (Standalone Servers)
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vnic_network" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source        = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_network"
  allowed_vlans = "1-100"
  default_vlan  = 1
  description   = "vNIC Network Example."
  mode          = "TRUNK"
  name          = "example"
  org_moid      = local.org_moid
  tags          = var.tags
}

#______________________________________________
#
# Ethernet (vNIC) QoS Policy - FI-Attached
# GUI Location: Policies > Create Policy
#______________________________________________

module "vnic_qos_domain" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = "Recommended Domain Attached vNIC QoS Example."
  name           = "recommended"
  mtu            = 9000
  burst          = 1024
  priority       = "Best Effort"
  rate_limit     = 0
  trust_host_cos = false
  org_moid       = local.org_moid
  tags           = var.tags
}


#______________________________________________
#
# Ethernet (vNIC) QoS Policy - Standalone
# GUI Location: Policies > Create Policy
#______________________________________________

module "vnic_qos_standalone" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source         = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_qos"
  description    = "Default Standalone vNIC QoS Example."
  name           = "default_standalone"
  cos            = 0
  mtu            = 1500
  rate_limit     = 0
  trust_host_cos = false
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
  description = "vNIC LAN Connectivity Example."
  name        = "example"
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
    module.vnic_vlan_group_1,
    module.vnic_vlan_group_2,
    module.vnic_vlan_group_3,
    module.vnic_qos_domain
  ]
  source     = "terraform-cisco-modules/imm/intersight//modules/policies_vnic_loop"
  cdn_source = "vnic"
  fabric_vnic = {
    vNIC_1 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id  = "A"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-1"
      vnic_order = 0
    },
    vNIC_2 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id  = "B"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-2"
      vnic_order = 1
    },
    vNIC_3 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id  = "A"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-3"
      vnic_order = 2
    },
    vNIC_4 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      switch_id  = "B"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-4"
      vnic_order = 3
    },
    vNIC_5 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_a.moid
      switch_id  = "A"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-5"
      vnic_order = 4
    },
    vNIC_6 = {
      mac_pool   = data.terraform_remote_state.pools.outputs.mac_pool_b.moid
      pci_order  = 5
      switch_id  = "B"
      vlan_group = module.vlan_group_list.moid
      vnic_name  = "vNIC-6"
      vnic_order = 5
    }
  }
  lan_connectivity_moid = module.vnic_lan_connectivity.moid
  mac_address_type      = "POOL"
  placement_pci_link    = 0
  placement_uplink      = 0
  placement_slot_id     = "MLOM"
  vnic_adapter_moid     = module.vnic_adapter_policy.moid
  vnic_control_moid     = module.vnic_netctrl_policy_lldp.moid
  vnic_qos_moid         = module.vnic_qos_domain.moid
}


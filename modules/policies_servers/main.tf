#____________________________________________________________
#
# Intersight BIOS Policy
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
# Intersight Boot Policies
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
# Intersight Device Connector Policy
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
# Intersight Disk Group Policy
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
# Intersight IMC Access Policy
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
# Intersight IPMI over LAN Policy
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
# Intersight LDAP Policy
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
# Intersight Local User Policy
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
# Intersight Network Connectivity (DNS) Policy
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
  name           = var.dns_policy != "" ? "${var.dns_policy}" : "${local.org_name}_domain"
  org_moid       = local.org_moid
  tags           = local.tags
  update_domain  = var.update_domain
}


#____________________________________________________________
#
# Intersight NTP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "ntp" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
  ]
  source       = "terraform-cisco-modules/imm/intersight//modules/policies_ntp"
  description    = var.ntp_policy != "" ? "${var.ntp_policy} NTP Policy." : "${local.org_name} NTP Policy."
  name           = var.ntp_policy != "" ? "${var.ntp_policy}" : "${local.org_name}_domain"
  ntp_servers  = var.ntp_servers
  org_moid     = local.org_moid
  tags         = local.tags
  timezone     = var.timezone
}


#____________________________________________________________
#
# Intersight SNMP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "snmp" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_snmp"
  description    = var.snmp_policy != "" ? "${var.snmp_policy} SNMP Policy." : "${local.org_name} SNMP Policy."
  name           = var.snmp_policy != "" ? "${var.snmp_policy}" : local.org_name
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
# Intersight Syslog Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "syslog" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source          = "terraform-cisco-modules/imm/intersight//modules/policies_syslog"
  description    = var.syslog_policy != "" ? "${var.syslog_policy} Syslog Policy." : "${local.org_name} Syslog Policy."
  name           = var.syslog_policy != "" ? "${var.syslog_policy}" : "${local.org_name}_domain"
  org_moid        = local.org_moid
  remote_clients  = var.syslog_destinations
  syslog_severity = var.syslog_severity
  tags            = local.tags
}


#____________________________________________________________
#
# Intersight Adapter Configuration (Standalone Servers)
# GUI Location: Policies > Create Policy
#____________________________________________________________

module "vic_adapter" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source              = "terraform-cisco-modules/imm/intersight//modules/policies_vic_adapter"
  description         = "${local.cluster_name} VIC Adapter Policy."
  name                = "${local.cluster_name}_adapter"
  org_moid            = local.org_moid
  portchannel_enabled = true
  tags                = var.tags
}




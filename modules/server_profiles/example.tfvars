#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# terraform_version = "1.0.3"
# tfc_email         = "tyscott@cisco.com"
# tfc_organization = "Cisco-Richfield-Lab"
# vcs_repo         = "scotttyso/terraform-intersight-easy-imm"
/*
  We highly recommend that for the terraform_cloud_token you use an environment variable for input:
  - export TF_VAR_terraform_cloud_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# terraform_cloud_token = "value"
/*
  We highly recommend that for the tfc_oath_token you use an environment variable for input; Like:
  - export TF_VAR_tfc_oath_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# tfc_oath_token = "value"


#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

/*
  We highly recommend that for the apikey you use an environment variable for input:
  - export TF_VAR_apikey="abcdefghijklmnopqrstuvwxyz.0123456789"
*/
# apikey = "value"

# endpoint     = "https://intersight.com"

organizations = ["Asgard"]

# secretkey    = "../../../../intersight.secret"
/*
  To export the Secret Key via an Environment Variable the format is as follows (Note: they are not quotation marks, but escape characters):
  - export TF_VAR_secretkey=`cat ../../intersight.secret`
  Either way will work in this case as we are not posting the contents of the file here.
*/

#__________________________________________________________
#
# Intersight Tags
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-easy-imm" }, { key = "Owner", value = "tyscott" }]

#__________________________________________________________
#
# Intersight UCS Server Profiles - Variables
#__________________________________________________________

#______________________________________________
#
# UCS Server Profile Variables
#______________________________________________

ucs_server_profiles = {
  FCH21427BUQ = {
    action                      = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_server               = false
    name                        = "asgard-esx01" # If Name is not specified the Serial Will be assigned as the Hostname
    operating_system            = "vmware"
    organization                = "Asgard"
    policy_bios                 = "Asgard_virtual_node"
    policy_boot_order           = "Asgard_uefi_m2_raid"
    policy_device_connector     = "Asgard_dev_conn"
    policy_imc_access           = "Asgard_imc_access"
    policy_ipmi_over_lan        = "Asgard_ipmi"
    policy_lan_connectivity     = ""
    policy_local_user           = "Asgard_local_users"
    policy_network_connectivity = "Asgard_dns"
    policy_ntp                  = "Asgard_ntp"
    policy_power                = ""
    policy_san_connectivity     = ""
    policy_sdcard               = ""
    policy_serial_over_lan      = "Asgard_sol"
    policy_snmp_1_user          = ""
    policy_ssh                  = "Asgard_ssh"
    policy_storage              = "Asgard_Raid1"
    policy_syslog               = "Asgard_syslog"
    policy_virtual_kvm          = "Asgard_vkvm"
    policy_virtual_media        = "Asgard_vmedia_usb"
  }
  FCH21427CHB = {
    action                      = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_server               = true
    description                 = ""
    name                        = "asgard-lnx01" # If Name is not specified the Serial Will be assigned as the Hostname
    operating_system            = "linux"
    organization                = "Asgard"
    policy_bios                 = "Asgard_nvmeof"
    policy_boot_order           = "Asgard_uefi_m2_raid"
    policy_device_connector     = "Asgard_dev_conn"
    policy_imc_access           = "Asgard_imc_access"
    policy_ipmi_over_lan        = "Asgard_ipmi"
    policy_lan_connectivity     = ""
    policy_local_user           = "Asgard_local_users"
    policy_network_connectivity = "Asgard_dns"
    policy_ntp                  = "Asgard_ntp"
    policy_power                = ""
    policy_san_connectivity     = ""
    policy_sdcard               = ""
    policy_serial_over_lan      = "Asgard_sol"
    policy_snmp_1_user          = ""
    policy_ssh                  = "Asgard_ssh"
    policy_storage              = "Asgard_Raid1"
    policy_syslog               = "Asgard_syslog"
    policy_virtual_kvm          = "Asgard_vkvm"
    policy_virtual_media        = "Asgard_vmedia_usb"
    src_template                = []
    tags = [
      {
        key   = "Module",
        value = "Easy IMM"
      },
      {
        key   = "Install OS",
        value = "Linux"
      }
    ]
    target_platform     = "FIAttached"
    type                = "instance"
    wait_for_completion = false
  }
}


#__________________________________________________________
#
# Intersight UCS Server Policies - Variables
#__________________________________________________________

#______________________________________________
#
# BIOS Policies
#______________________________________________

policy_bios = {
  "Asgard_nvmeof" = {
    bios_policy  = "nvmeof"
    description  = ""
    organization = "Asgard"
    tags         = []
  }
  "Asgard_virtual_node" = {
    bios_policy  = "virtual_node"
    description  = ""
    organization = "Asgard"
    tags         = []
  }
  "Asgard_virtual_rack" = {
    bios_policy  = "virtual_rack"
    description  = ""
    organization = "Asgard"
    tags         = []
  }
}


#______________________________________________
#
# BOOT Policies
#______________________________________________

policy_boot_order = {
  "Asgard_uefi_m2_pch" = {
    boot_policy  = "uefi_m2_pch"
    boot_secure  = true
    description  = ""
    organization = "Asgard"
    tags         = []
  }
  "Asgard_uefi_m2_raid" = {
    boot_policy  = "uefi_m2_raid"
    boot_secure  = true
    description  = ""
    organization = "Asgard"
    tags         = []
  }
  "Asgard_uefi_sdcard" = {
    boot_policy  = "uefi_sdcard"
    boot_secure  = true
    description  = ""
    organization = "Asgard"
    tags         = []
  }
}


#______________________________________________
#
# Device Connector Policies
#______________________________________________

policy_device_connector = {
  "Asgard_devconn" = {
    description  = ""
    lockout      = false
    organization = "Asgard"
    tags        = []
  }
}

#______________________________________________
#
# IMC Access Policies
#______________________________________________

policy_imc_access = {
  "Asgard_imc_access" = {
    description  = ""
    imc_ip_pool  = "ip_pool_1"
    inband_vlan  = 1
    ipv4_enable  = true
    ipv6_enable  = false
    organization = "Asgard"
    tags         = []
  }
}

#______________________________________________
#
# IPMI over LAN Policies
#______________________________________________

policy_ipmi_over_lan = {
  "Asgard_ipmi" = {
    description = ""
    enabled     = true
    privilege   = "admin"
    organization = "Asgard"
    tags        = []
  }
}

#______________________________________________
#
# Local User Policies
#______________________________________________

policy_local_users = {
  "Asgard_users" = {
    description             = ""
    enforce_strong_password = true
    force_send_password     = false
    grace_period            = 0
    local_users = [
      {
        enabled  = true
        password = 1
        role     = "value"
        username = "admin"
      }
    ]
    notification_period      = 15
    organization             = "Asgard"
    password_expiry          = false
    password_expiry_duration = 90
    password_history         = 5
    tags = []
  }
}


#______________________________________________
#
# Network Connectivity (DNS) Policies
#______________________________________________

policy_network_connectivity = {
  "Asgard_dns" = {
    description    = ""
    dns_servers_v4 = ["10.101.128.15", "10.101.128.16"]
    dns_servers_v6 = []
    dynamic_dns    = false
    ipv6_enable    = false
    organization   = "Asgard"
    tags           = []
    update_domain  = ""
  }
}


#______________________________________________
#
# NTP Policies
#______________________________________________

policy_ntp = {
  "Asgard_ntp" = {
    description  = ""
    enabled      = true
    ntp_servers  = ["10.101.128.15", "10.101.128.16"]
    organization = "Asgard"
    tags         = []
    timezone     = "America/New_York"
  }
}


#______________________________________________
#
# NTP Policies
#______________________________________________

policy_power = {
  "Asgard_power" = {
    allocated_budget    = 0
    description         = ""
    organization        = "Asgard"
    power_profiling     = "Enabled"
    power_restore_state = "LastState"
    redundancy_mode     = "Grid"
    tags                = []
  }
}


#______________________________________________
#
# Serial over LAN Policies
#______________________________________________

policy_serial_over_lan = {
  "Asgard_sol" = {
    baud_rate = 115200
    com_port = "com0"
    description = ""
    enabled = true
    organization = "Asgard"
    ssh_port = 2400
    tags = []
  }
}

#______________________________________________
#
# Storage Policies
#______________________________________________

policy_storage = {
  "Asgard_Raid0"  = {
    description   = ""
    disks_group_0 = [1, 2]
    organization  = "Asgard"
    raid_level    = "Raid0"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid1"  = {
    description   = ""
    disks_group_0 = [1, 2]
    organization  = "Asgard"
    raid_level    = "Raid1"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid5"  = {
    description   = ""
    disks_group_0 = [1, 2, 3]
    organization  = "Asgard"
    raid_level    = "Raid5"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid6"  = {
    description   = ""
    disks_group_0 = [1, 2, 3, 4]
    organization  = "Asgard"
    raid_level    = "Raid6"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid10"  = {
    description   = ""
    disks_group_0 = [1, 2]
    disks_group_1 = [3, 4]
    organization  = "Asgard"
    raid_level    = "Raid6"
    retain_policy = true
    tags          = []
  }
}


#______________________________________________
#
# Syslog Policies
#______________________________________________

policy_syslog = {
  "Asgard_syslog" = {
    description         = ""
    local_min_severity  = "warning"
    organization        = "Asgard"
    syslog_destinations = [
      {
        enabled      = true
        hostname     = "lnx1.rich.ciscolabs.com"
        port         = 514
        protocol     = "udp"
        min_severity = "warning"
      },
      {
        enabled      = true
        hostname     = "lnx2.rich.ciscolabs.com"
        port         = 514
        protocol     = "udp"
        min_severity = "warning"
      }
    ]
    tags = []
  }
}


#______________________________________________
#
# Virtual KVM Policies
#______________________________________________

policy_virtual_kvm = {
  "Asgard_vkvm" = {
    description        = ""
    enabled            = true
    local_server_video = true
    maximum_sessions   = 4
    organization       = "Asgard"
    remote_port        = 2068
    tags               = []
    video_encryption   = false
  }
}


#______________________________________________
#
# Virtual KVM Policies
#______________________________________________

policy_virtual_media = {
  "Asgard_vmedia_usb" = {
    description = ""
    enabled = true
    encryption = false
    low_power_usb = true
    organization = "Asgard"
    tags = []
    vmedia_mappings = []
  }
}


# policy_snmp = {
#   "Asgard_snmp" = {
#     snmp_policy_configure     = true
#     snmp_config_type          = "snmp_1_user"
#     snmp_system_contact       = "Richfield Lab Admins: rich-lab@cisco.com"
#     snmp_system_location      = "Richfield Ohio: Room 143, Rack 143D."
#     snmp_trap_destinations    = [
#       {
#         community    = ""
#         destination  = "lnx1.rich.ciscolabs.com"
#         enabled      = true
#         port         = 162
#         snmp_version = "V3"
#         type         = "Trap"
#         user         = "richuser"
#       },
#       {
#         community    = ""
#         destination  = "lnx2.rich.ciscolabs.com"
#         enabled      = true
#         port         = 162
#         snmp_version = "V3"
#         type         = "Trap"
#         user         = "richuser"
#       }
#     ]
#     snmp_user_1_auth_type   = "SHA"
#     snmp_user_1_name        = "richuser"
#     snmp_user_1_sec_level   = "AuthPriv"
#   }
# }

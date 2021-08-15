#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# terraform_version = "1.0.3"
# tfc_email         = "tyscott@cisco.com"
tfc_organization = "Cisco-Richfield-Lab"
# vcs_repo         = "scotttyso/terraform-intersight-easy-imm"
ws_pools = "Intersight_Pools"
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

ucs_server_templates = {
  "Asgard_VMware" = {
    operating_system        = "vmware"
    organization            = "Asgard"
    policy_bios             = "Asgard_virtual_node"
    policy_boot_order       = "Asgard_uefi_m2_raid"
    policy_device_connector = "Asgard_dev_conn"
    policy_imc_access       = "Asgard_imc_access"
    policy_ipmi_over_lan    = "Asgard_ipmi"
    policy_lan_connectivity = "Asgard_lan_vmware"
    policy_ldap             = "" # Standalone Only Today
    policy_local_users      = "Asgard_users"
    policy_power            = "Asgard_power_server"
    policy_san_connectivity = "Asgard_san"
    policy_sdcard           = ""
    policy_serial_over_lan  = "Asgard_sol"
    policy_snmp             = "Asgard_snmp"
    policy_storage          = "Asgard_Raid1"
    policy_syslog           = "Asgard_syslog"
    policy_virtual_kvm      = "Asgard_vkvm"
    policy_virtual_media    = "Asgard_vmedia_usb"
    target_platform         = "FIAttached"
  }
  "Asgard_Linux_NVMe" = {
    operating_system        = "linux"
    organization            = "Asgard"
    policy_bios             = "Asgard_nvmeof"
    policy_boot_order       = "Asgard_uefi_m2_raid"
    policy_device_connector = "Asgard_dev_conn"   # Standalone Only Today
    policy_imc_access       = "Asgard_imc_access" # FIAttached Only
    policy_ipmi_over_lan    = "Asgard_ipmi"
    policy_lan_connectivity = "Asgard_lan_linux_nvme"
    policy_ldap             = "" # Standalone Only Today
    policy_local_users      = "Asgard_users"
    policy_power            = "Asgard_power_server" # FIAttached Only
    policy_san_connectivity = "Asgard_san"
    policy_sdcard           = ""
    policy_serial_over_lan  = "Asgard_sol"
    policy_snmp             = "Asgard_snmp"
    policy_storage          = "Asgard_Raid1"
    policy_syslog           = "Asgard_syslog"
    policy_virtual_kvm      = "Asgard_vkvm"
    policy_virtual_media    = "Asgard_vmedia_usb"
    target_platform         = "FIAttached"
    # policy_adapter_config       = "" # Standalone Only Today
    # policy_certificate_mgmt     = "" # FIAttached Only
    # policy_network_connectivity = "Asgard_dns" # Standalone Only Today
    # policy_ntp                  = "Asgard_ntp" # Standalone Only Today
    # policy_persistent_memory    = "" # Standalone Only Today
    # policy_smtp                 = "Asgard_smtp" # Standalone Only Today
    # policy_snmp_1_user          = ""
    # policy_snmp_2_users         = ""
    # policy_ssh                  = "Asgard_ssh" # Standalone Only Today
  }
}

ucs_server_profiles = {
  FCH21427BUQ = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_server       = false
    description         = ""
    name                = "asgard-esx01" # If Name is not specified the Serial Will be assigned as the Hostname
    src_template        = "Asgard_VMware"
    tags                = []
    wait_for_completion = false
  }
  FCH21427CHB = {
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    assign_server       = true
    description         = ""
    name                = "asgard-lnx01" # If Name is not specified the Serial Will be assigned as the Hostname
    src_template        = "Asgard_Linux_NVMe"
    tags                = [{ key = "Module", value = "Easy IMM" }, { key = "Install OS", value = "Linux" }]
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
  # "Asgard_uefi_sdcard" = {
  #   boot_policy  = "uefi_sdcard"
  #   boot_secure  = true
  #   description  = ""
  #   organization = "Asgard"
  #   tags         = []
  # }
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
    tags         = []
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
    inband_vlan  = 4
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
    description  = ""
    enabled      = true
    privilege    = "admin"
    organization = "Asgard"
    tags         = []
  }
}

#______________________________________________
#
# LDAP Policies
#______________________________________________

policy_ldap = {
  "Asgard_ldap" = {
    description                     = ""
    ldap_attribute                  = "CiscoAvPair"
    ldap_base_dn                    = "dc=rich,dc=ciscolabs,dc=com"
    ldap_bind_dn                    = ""
    ldap_bind_method                = "LoginCredentials"
    ldap_domain                     = "rich.ciscolabs.com"
    ldap_enable_dns                 = false
    ldap_enable_encryption          = false
    ldap_enable_group_authorization = false
    ldap_enabled                    = true
    ldap_filter                     = "value"
    ldap_group_attribute            = "value"
    ldap_groups = {
      "Lab_Admin" = {
        group_role = "admin"
      }
    }
    ldap_nested_group_search_depth = 128
    ldap_nr_source                 = "Extracted"
    ldap_search_domain             = ""
    ldap_search_forest             = ""
    ldap_servers = {
      "ad1" = {
        ldap_port   = 389
        ldap_server = "ad1.rich.ciscolabs.com"
      }
      "ad2" = {
        ldap_port   = 389
        ldap_server = "ad2.rich.ciscolabs.com"
      }
    }
    ldap_timeout                = 0
    ldap_user_search_precedence = "LocalUserDb"
    organization                = "Asgard"
    tags                        = []
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
    users = {
      "admin" = {
        # enabled  = true
        # password = 1
        # role     = "admin"
      }
      "serverops" = {
        enabled  = true
        password = 2
        role     = "readonly"
      }
    }
    notification_period      = 15
    organization             = "Asgard"
    password_expiry          = false
    password_expiry_duration = 90
    password_history         = 5
    tags                     = []
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
# Persistent Memory Policies
#______________________________________________

policy_persistent_memory = {
  "Asgard_persistent_memory" = {
    description                  = ""
    goals_memory_percentage      = 0
    goals_persistent_memory_type = "app-direct"
    logical_namespaces = [
      {
        capacity         = 512
        mode             = "raw"
        name             = "profile_1"
        socket_id        = 1
        socket_memory_id = "Not Applicable"
      }
    ]
    management_mode   = "configured-from-intersight"
    organization      = "Asgard"
    retain_namespaces = true
    tags              = []
  }
}


#______________________________________________
#
# Power Policies
#______________________________________________

policy_power = {
  "Asgard_power_server" = {
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
    baud_rate    = 115200
    com_port     = "com0"
    description  = ""
    enabled      = true
    organization = "Asgard"
    ssh_port     = 2400
    tags         = []
  }
}

#______________________________________________
#
# SMTP Policies
#______________________________________________

policy_smtp = {
  "Asgard_smtp" = {
    description     = ""
    enabled         = true
    min_severity    = "critical"
    organization    = "Asgard"
    sender_email    = "rich-lab@cisco.com"
    smtp_port       = 25
    smtp_recipients = ["rich-lab@cisco.com"]
    smtp_server     = "smtp-ext.cisco.com"
    tags            = []
  }
}

#______________________________________________
#
# SNMP Policies
#______________________________________________

policy_snmp = {
  "Asgard_snmp" = {
    description                = ""
    enabled                    = true
    organization               = "Asgard"
    snmp_access                = "Full"
    snmp_engine_id             = ""
    snmp_port                  = 161
    snmp_user_1_auth_type      = "SHA"
    snmp_user_1_name           = "richuser"
    snmp_user_1_security_level = "AuthPriv"
    snmp_user_2_auth_type      = "SHA"
    snmp_user_2_name           = ""
    snmp_user_2_security_level = "AuthPriv"
    system_contact             = "Richfield Lab Admins: rich-lab@cisco.com"
    system_location            = "Richfield Ohio: Room 143, Rack 143D."
    tags                       = []
    snmp_trap_destinations = [
      {
        community    = ""
        destination  = "lnx1.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      },
      {
        community    = ""
        destination  = "lnx2.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      }
    ]
  }
}

#______________________________________________
#
# SSH Policies
#______________________________________________

policy_ssh = {
  "Asgard_ssh" = {
    description  = ""
    enabled      = true
    organization = "Asgard"
    ssh_port     = 22
    tags         = []
    timeout      = 1800
  }
}

#______________________________________________
#
# Storage Policies
#______________________________________________

policy_storage = {
  "Asgard_Raid0" = {
    description   = ""
    disks_group_0 = [1, 2]
    organization  = "Asgard"
    raid_level    = "Raid0"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid1" = {
    description   = ""
    disks_group_0 = [1, 2]
    organization  = "Asgard"
    raid_level    = "Raid1"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid5" = {
    description   = ""
    disks_group_0 = [1, 2, 3]
    organization  = "Asgard"
    raid_level    = "Raid5"
    retain_policy = true
    tags          = []
  }
  "Asgard_Raid6" = {
    description   = ""
    disks_group_0 = [1, 2, 3, 4]
    organization  = "Asgard"
    raid_level    = "Raid6"
    retain_policy = true
    tags          = []
  }
  # "Asgard_Raid10" = {
  #   description   = ""
  #   disks_group_0 = [1, 2]
  #   disks_group_1 = [3, 4]
  #   organization  = "Asgard"
  #   raid_level    = "Raid6"
  #   retain_policy = true
  #   tags          = []
  # }
}


#______________________________________________
#
# Syslog Policies
#______________________________________________

policy_syslog = {
  "Asgard_syslog" = {
    description        = ""
    local_min_severity = "warning"
    organization       = "Asgard"
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
# vHBA SAN Connectivity Policies
#______________________________________________

policy_vhba_san_connectivity = {
  "Asgard_san" = {
    adapter_template             = "VMware"
    description                  = ""
    organization                 = "Asgard"
    placement_mode               = "custom"
    qos_burst                    = 1024
    qos_cos                      = 3
    qos_max_data_field_size      = 2112
    qos_rate_limit               = 0
    tags                         = []
    target_platform              = "FIAttached"
    vhba_name_a                  = "VHBA-A"
    vhba_name_b                  = "vHBA-B"
    vhba_order_a                 = 8
    vhba_order_b                 = 9
    vhba_persistent_lun_bindings = false
    vhba_placement_pci_link_a    = 0
    vhba_placement_pci_link_b    = 0
    vhba_placement_slot_id       = "MLOM"
    vhba_placement_switch_a      = "A"
    vhba_placement_switch_b      = "B"
    vhba_placement_uplink        = 0
    vhba_type                    = "fc-initiator"
    vsan_a                       = 100
    vsan_a_default_vlan_id       = 0
    vsan_b                       = 200
    vsan_b_default_vlan_id       = 0
    wwnn_address_static          = ""
    wwnn_address_type            = "POOL"
    wwnn_pool                    = "wwnn_pool"
    wwpn_address_a_static        = ""
    wwpn_address_b_static        = ""
    wwpn_address_type            = "POOL"
    wwpn_pool_a_name             = "wwpn_pool_a"
    wwpn_pool_b_name             = "wwpn_pool_b"
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
    description     = ""
    enabled         = true
    encryption      = false
    low_power_usb   = true
    organization    = "Asgard"
    tags            = []
    vmedia_mappings = []
  }
}


#______________________________________________
#
# vNIC LAN Connectivity Policies
#______________________________________________

policy_vnic_lan_connectivity = {
  "Asgard_lan_vmware" = {
    description         = ""
    iqn_allocation_type = "None"
    iqn_pool            = []
    iqn_static_name     = ""
    organization        = "Asgard"
    placement_mode      = "custom"
    tags                = []
    target_platform     = "FIAttached"
  }
  "Asgard_lan_linux_nvme" = {
    description         = ""
    iqn_allocation_type = "None"
    iqn_pool            = []
    iqn_static_name     = ""
    organization        = "Asgard"
    placement_mode      = "custom"
    tags                = []
    target_platform     = "FIAttached"
  }
}


#______________________________________________
#
# vNIC LAN Connectivity Policies
#______________________________________________

policy_vnic_templates = {
  "MANAGEMENT" = {
    adapter_template          = "VMware"
    description               = ""
    lan_connectivity          = "Asgard_lan_vmware"
    mac_address_a_static      = ""
    mac_address_b_static      = ""
    mac_address_type          = "POOL"
    mac_forge                 = "allow"
    mac_pool_a_name           = "mac_pool_a"
    mac_pool_b_name           = "mac_pool_b"
    mac_registration_mode     = "allVlans"
    neighbor_discovery        = "lldp"
    organization              = "Asgard"
    qos_burst                 = 1024
    qos_cos                   = 0
    qos_mtu                   = 9000
    qos_priority              = "Silver"
    qos_rate_limit            = 0
    qos_trust_host_cos        = false
    tags                      = []
    uplink_fail_action        = "linkDown"
    usnic_adapter_policy_moid = ""
    usnic_cos                 = 5
    usnic_count               = 0
    vlan_list                 = "2-10"
    vlan_native_vlan          = 1
    vmq_adapter_policy_moid   = ""
    vmq_enabled               = false
    vmq_interrupts            = 16
    vmq_multi_queue_support   = false
    vmq_number_queues         = 4
    vmq_number_sub_vnics      = 64
    vnic_cdn_a_name           = ""
    vnic_cdn_b_name           = ""
    vnic_cdn_source           = "vnic"
    vnic_failover_enabled     = false
    vnic_name_a               = "MANAGEMENT-A"
    vnic_name_b               = "MANAGEMENT-B"
    vnic_order_a              = 0
    vnic_order_b              = 1
    vnic_placement_pci_link_a = 0
    vnic_placement_pci_link_b = 0
    vnic_placement_slot_id    = "MLOM"
    vnic_placement_switch_a   = "A"
    vnic_placement_switch_b   = "B"
    vnic_placement_uplink     = 0
  }
  "MIGRATION" = {
    lan_connectivity   = "Asgard_lan_vmware"
    mac_pool_a_name    = "mac_pool_a"
    mac_pool_b_name    = "mac_pool_b"
    neighbor_discovery = "lldp"
    organization       = "Asgard"
    qos_priority       = "Bronze"
    vlan_list          = "2-10"
    vlan_native_vlan   = 1
    vnic_name_a        = "MIGRATION-A"
    vnic_name_b        = "MIGRATION-B"
    vnic_order_a       = 2
    vnic_order_b       = 3
  }
  "STORAGE" = {
    lan_connectivity   = "Asgard_lan_vmware"
    mac_pool_a_name    = "mac_pool_a"
    mac_pool_b_name    = "mac_pool_b"
    neighbor_discovery = "lldp"
    organization       = "Asgard"
    qos_priority       = "Platinum"
    vlan_list          = "2-10"
    vlan_native_vlan   = 1
    vnic_name_a        = "STORAGE-A"
    vnic_name_b        = "STORAGE-B"
    vnic_order_a       = 4
    vnic_order_b       = 5
  }
  "VIRTUAL" = {
    lan_connectivity   = "Asgard_lan_vmware"
    mac_pool_a_name    = "mac_pool_a"
    mac_pool_b_name    = "mac_pool_b"
    neighbor_discovery = "lldp"
    organization       = "Asgard"
    qos_priority       = "Gold"
    vlan_list          = "2-10"
    vlan_native_vlan   = 1
    vnic_name_a        = "VIRTUAL-A"
    vnic_name_b        = "VIRTUAL-B"
    vnic_order_a       = 6
    vnic_order_b       = 7
  }
  "NVMeOF" = {
    adapter_template   = "Linux-NVMe-RoCE"
    lan_connectivity   = "Asgard_lan_linux_nvme"
    mac_pool_a_name    = "mac_pool_a"
    mac_pool_b_name    = "mac_pool_b"
    neighbor_discovery = "lldp"
    organization       = "Asgard"
    qos_priority       = "Platinum"
    vlan_list          = "1101"
    vlan_native_vlan   = 1101
    vnic_name_a        = "NVMeOF-A"
    vnic_name_b        = "NVMeOF-B"
    vnic_order_a       = 0
    vnic_order_b       = 1
  }
}

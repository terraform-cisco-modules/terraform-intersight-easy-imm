#__________________________________________________________
#
# Variables for Terraform Cloud
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# tfc_email         = "tyscott@cisco.com"
terraform_version = "1.0.3"
tfc_organization  = "Cisco-Richfield-Lab"
vcs_repo          = "scotttyso/terraform-intersight-easy-imm"
#__________________________________________________________
#
# Variables for Intersight
#__________________________________________________________

# Intersight URL
# endpoint = "https://intersight.com"

#__________________________________________________________
#
# Variables for the Intersight Organization
#__________________________________________________________

# Intersight Organization Name
# organization = "default"
organizations = ["Asgard"]

#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

# Tags to assign to the Cluster
tags = [{ key = "Terraform Module", value = "Easy IMM" }, { key = "Owner", value = "rich-lab@cisco.com" }]

#______________________________________________
#
# Fibre-Channel Pool Variables
#______________________________________________

fc_pools_create = true
fc_pools_map = {
  wwpn_pool_a = {
    assignment_order = "sequential"
    organization     = "Asgard"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0a:00:00"
        to   = "20:00:00:25:B5:0a:00:ff"
      }
    ]
  }
  wwpn_pool_b = {
    assignment_order = "sequential"
    organization     = "Asgard"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0b:00:00"
        to   = "20:00:00:25:B5:0b:00:ff"
      }
    ]
  }
  wwnn_pool = {
    assignment_order = "sequential"
    organization     = "Asgard"
    pool_purpose     = "WWNN"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0c:00:00"
        to   = "20:00:00:25:B5:0c:00:ff"
      }
    ]
  }
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

ip_pools_create = true
ip_pools_map = {
  ip_pool_1 = {
    assignment_order = "sequential"
    dns_servers_v4   = ["10.101.128.15", "10.101.128.16"]
    ipv4_block = [
      {
        pool_size   = 32
        starting_ip = "10.92.110.96"
      },
      {
        pool_size   = 31
        starting_ip = "10.92.110.128"
      }
    ]
    ipv4_config = [
      {
        gateway = "10.92.110.1"
        netmask = "255.255.255.0"
      }
    ]
    organization = "Asgard"
    tags         = []
  }
}


#______________________________________________
#
# IQN Pool Variables
#______________________________________________

iqn_pools_create = false
iqn_pools_map    = {}


#______________________________________________
#
# MAC Pool Variables
#______________________________________________

mac_pools_create = true
mac_pools_map = {
  mac_pool_a = {
    assignment_order = "sequential"
    organization     = "Asgard"
    mac_blocks = [
      {
        from = "00:25:B5:0a:00:00"
        to   = "00:25:B5:0a:00:ff"
      }
    ]
  }
  mac_pool_b = {
    assignment_order = "sequential"
    organization     = "Asgard"
    mac_blocks = [
      {
        from = "00:25:B5:0b:00:00"
        to   = "00:25:B5:0b:00:ff"
      }
    ]
  }
}


#______________________________________________
#
# UUID Pool Variables
#______________________________________________

uuid_pools_create = false
uuid_pools_map = {
  uuid_pool = {
    assignment_order = "sequential"
    organization     = "Asgard"
    prefix           = "" # "000025B5-000A-0002"
    uuid_suffix_blocks = [
      {
        from = "0000-000000000000"
        size = 32768
      }
    ]
  }
}


#______________________________________________
#
# UCS Domain Profile Variables
#______________________________________________

assign_switches         = false
assign_domain           = true
configure_fibre_channel = true
configure_snmp          = true
configure_snmp_type     = "snmp_1_user"
configure_syslog        = true


ucs_domain_profile = {
  asgard-ucs = {
    domain_action        = "No-op"
    domain_serial_a      = "FDO23360Y8U"
    domain_serial_b      = "FDO23360XWU"
    dns_servers_v4       = ["10.101.128.15", "10.101.128.16"]
    ntp_servers          = ["10.101.128.15", "10.101.128.16"]
    ntp_timezone         = "America/New_York"
    organization         = "Asgard"
    ports_device_model   = "UCS-FI-64108"
    ports_lan_pc_ports   = [97, 99]
    ports_san_pc_ports   = [1, 3]
    ports_san_pc_speed   = "32Gbps"
    ports_servers        = "5-12"
    snmp_system_contact  = "Richfield Lab Admins: rich-lab@cisco.com"
    snmp_system_location = "Richfield Ohio: Room 143, Rack 143D."
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
    snmp_user_1_auth_type      = "SHA"
    snmp_user_1_name           = "richuser"
    snmp_user_1_security_level = "AuthPriv"
    syslog_description         = ""
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
    vlan_native          = 1
    vlan_list            = "101-199,201-299,1100-1299,1700-1799"
    vsan_enable_trunking = false
    vsan_fabric_a        = 100
    vsan_fabric_b        = 200
  }
}

#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

# Intersight URL
# endpoint = "https://intersight.com"

#__________________________________________________________
#
# Intersight Organization Variables
#__________________________________________________________

# Intersight Organization Name
# organization = "default"
organization = "Asgard"

#______________________________________________
#
# Deployment Variables
#______________________________________________

# A Unique Identifier for the UCS Cluster Assignment
# Cluster_ID = "0"

# Organization Unique Identifier for the UCS Cluster
# Organization_ID = "0"
Organization_ID = "A"

# A Unique Site Identifier
# Site_ID = "0"

# Cluster Name to use for Policy Names
cluster_name = "asgard-ucs"

#______________________________________________
#
# IP Variables
#______________________________________________

# IPv4
# ipv4_enable = true

# IPv6
# ipv6_enable = false

#______________________________________________
#
# DNS Variables
#______________________________________________

# Domain Name
# domain_name = "example.com"
domain_name = "rich.ciscolabs.com"

# DNS IPv4 Server List.  If List is empty put ["empty"].
# dns_servers_v4 = ["empty"]
# dns_servers_v4 = ["208.67.222.222", "208.67.220.220"]
dns_servers_v4 = ["10.101.128.15", "10.101.128.16"]

# DNS IPv6 Server List.  If List is empty put ["empty"].
# dns_servers_v6 = ["empty"]

# Dynamic DNS
# dynamic_dns = false

#______________________________________________
#
# Time Variables
#______________________________________________

# Timezone.  See https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md for full list
timezone = "America/New_York"

# NTP Server List.  If List is empty put ["empty"].
# ntp_servers = ["empty"]
ntp_servers = ["10.101.128.15", "10.101.128.16"]

#______________________________________________
#
# Intersight IP Pool Variables
#______________________________________________


# IP Pool Gateway/Prefix
ip_pool_gateway = "10.92.101.1/24"

# IP Pool Staring IP Address
ip_pool_from = "10.92.101.16"

# IP Pool Size
ip_pool_size = "16"

#______________________________________________
#
# Intersight UCS Domain Variables
#______________________________________________

# Server Port Range
# server_port_range = "5-18"
server_port_range = "5-12"

# LAN Uplink Port-Channel List
lan_uplink_pc_list = [97, 99]

# SAN Uplink Port-Channel List
san_uplink_pc_list = [1, 3]

# VLAN List
vlan_list = "101-199,201-299,1100-1299,1700-1799"


#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

# Tags to assign to the Cluster
tags = [ { key = "Owner", value = "rich-lab@cisco.com" }, { key = "Terraform Module", value = "Easy IMM" } ]

#______________________________________________
#
# Intersight SNMP Policy Variables
#______________________________________________

/*
 SNMP Trap Destinations
 - community:    SNMP community group used for sending SNMP trap to other devices. Applicable only for SNMP v2c.
                 If using SNMPv3 set: community = ""
 - destination:  Either Hostname or IP Address.
 - port:         Port used by the server to communicate with the trap destination. Enter a value between 1-65535.
                 Reserved ports not allowed (22, 23, 80, 123, 389, 443, 623, 636, 2068, 3268, 3269).
 - snmp_version: Either "V2" or 'V3"
 - type:         Either "Trap" or "Inform".  Type of trap which decides whether to receive a notification when a
                 trap is received at the destination.
 - user:         SNMP user for the trap. Applicable only to SNMPv3.  If using SNMPv2 set: user = ""
*/
# snmp_trap_destinations = []
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

# System Contact
system_contact = "rich-lab@cisco.com"

# System Contact
system_location = "Richfield Lab Room 143 Rack 143D."

#______________________________________________
#
# Intersight Syslog Policy Variables
#______________________________________________

# Remote Syslog Servers
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

# Syslog Severity
# syslog_severity = "warning"

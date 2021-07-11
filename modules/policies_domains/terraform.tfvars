#__________________________________________________________
#
# Variables for the Intersight Organization
#__________________________________________________________

# Intersight Organization Name
# organization = "default"
organization = "Asgard"

#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

# Tags to assign to the Cluster
tags = [ { key = "Owner", value = "rich-lab@cisco.com" }, { key = "Terraform Module", value = "Easy IMM" } ]

#______________________________________________
#
# Intersight UCS Domain Variables
#______________________________________________

# Flag to assign Policies to domain or not.
assign_domain = false

# Server Port Range
# server_port_range = "5-18"
server_port_range = "5-12"

# LAN Uplink Port-Channel List
lan_port_channel = [97, 99]

# SAN Uplink Port-Channel List
san_port_channel = [1, 3]

# VLAN List
vlan_list = "101-199,201-299,1100-1299,1700-1799"


#______________________________________________
#
# DNS Variables
#______________________________________________

# DNS IPv4 Server List.
# dns_servers_v4 = ["208.67.222.222", "208.67.220.220"]
dns_servers_v4 = ["10.101.128.15", "10.101.128.16"]

# DNS IPv6 Server List.
# dns_servers_v6 = []

# Dynamic DNS
# dynamic_dns = false

# IPv6
# ipv6_enable = false

# Update Domain for Dynamic DNS
# update_domain = ""

#______________________________________________
#
# NTP Policy Variables
#______________________________________________

# NTP Server List.  If List is empty put ["empty"].
# ntp_servers = ["empty"]
ntp_servers = ["10.101.128.15", "10.101.128.16"]

# Timezone.  See https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md for full list
timezone = "America/New_York"

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

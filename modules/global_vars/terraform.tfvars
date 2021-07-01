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

organization = "Asgard"

#______________________________________________
#
# DNS Variables
#______________________________________________

# Domain Name
domain_name = "rich.ciscolabs.com"

# DNS Server List.  1 or 2 servers.
dns_servers_v4 = ["10.101.128.15", "10.101.128.16"]

#______________________________________________
#
# Time Variables
#______________________________________________

# Timezone.  See https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md for full list
timezone = "America/New_York"

# NTP Server List.  1 or 2 Servers
ntp_servers = ["10.101.128.15", "10.101.128.16"]

#______________________________________________
#
# Deployment Variables
#______________________________________________

# A Unique Identifier for the UCS Cluster Assignment
# Cluster_ID = "0"

# Organization Unique Identifier for the UCS Cluster
Organization_ID = "A"

# A Unique Site Identifier
# Site_ID = "0"

# Prefix to use for Policy Names
cluster_prefix = "asgard-ucs"

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

# Model of the Fabric Interconnects
device_model = "64108"

# Server Port Range
# server_port_range = "5-18"

# LAN Uplink Port-Channel List
lan_uplink_pc_list = [97, 98]

# SAN Uplink Port-Channel List
san_uplink_pc_list = [1, 3]

# VLAN List
vlan_list = "101-199,201-299,1100-1299,1700-1799"


#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

# Tags to assign to the Cluster
tags = [ { key = "Owner", value = "rich-lab@cisco.com" }, { key = "Terraform", value = "Module" } ]

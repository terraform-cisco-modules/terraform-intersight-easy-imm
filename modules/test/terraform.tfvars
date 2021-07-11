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
# Variables for the Domain Workspace
#______________________________________________

# List of UCS Domains to for Workspace Creation.
cluster_name = "asgard-ucs"

# Flag to Disable Switch Assignment.  true or false.
assign_switches = false

tfc_variables = {
  serial_a = "FDO23360Y8U"
  serial_b = "FDO23360XWU"
}

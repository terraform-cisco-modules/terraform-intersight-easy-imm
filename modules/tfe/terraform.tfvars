#__________________________________________________________
#
# Variables for the Intersight API
#__________________________________________________________

vcs_repo = "scotttyso/terraform-intersight-easy-imm"
#__________________________________________________________
#
# Variables for the Intersight API
#__________________________________________________________

# Intersight URL
# endpoint = "https://intersight.com"

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
tags = "[ { key = \"Owner\", value = \"rich-lab@cisco.com\" }, { key = \"Terraform Module\", value = \"Easy IMM\" } ]"

#______________________________________________
#
# Variables for the Domain Workspace
#______________________________________________

# List of UCS Domains to for Workspace Creation.
domain_list = {
  "asgard-ucs" = {
    domain        = "asgard-ucs"
    tfc_variables = "{ serial_a = \"FDO23360Y8U\", serial_b = \"FDO23360XWU\" }"
  }
}

# Flag to Disable Switch Assignment.  true or false.
assign_switches = false

# Variable to Assign Workspace for remote state
domain_workspace = "Asgard_asgard-ucs"

# Flag to assign Policies to domain or not.
assign_domain = false


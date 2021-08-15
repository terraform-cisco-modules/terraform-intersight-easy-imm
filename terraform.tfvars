#__________________________________________________________
#
# Variables for Terraform Cloud
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# tfc_email         = "tyscott@cisco.com"
terraform_version = "1.0.3"
tfc_organization  = "Cisco-Richfield-Lab"
vcs_repo          = "scotttyso/Asgard"

#__________________________________________________________
#
# Workspaces to Create
#__________________________________________________________

workspaces = {
  "Asgard_pools" = {
    auto_apply        = true
    description       = "Pools for the Asgard Organization."
    working_directory = "modules/pools"
    workspace_type    = "pool"
  }
  "Asgard_chassis_profiles" = {
    auto_apply        = true
    description       = "Asgard UCS Chassis Profiles."
    working_directory = "modules/profiles_chassis"
    workspace_type    = "chassis"
  }
  "Asgard_domain" = {
    auto_apply        = true
    description       = "Asgard UCS Domain Profile."
    working_directory = "modules/profiles_domains"
    workspace_type    = "domain"
  }
  "Asgard_domain_vlans" = {
    auto_apply        = true
    description       = "Asgard UCS Domain VLANs."
    working_directory = "modules/profiles_domains_vlans"
    workspace_type    = "vlan"
  }
  "Asgard_server_profiles" = {
    auto_apply        = true
    description       = "Asgard UCS Server Profiles."
    working_directory = "modules/profiles_servers"
    workspace_type    = "server"
  }
}

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
  "Asgard_chassis_profiles" = {
    auto_apply          = true
    description         = "Asgard UCS Chassis Profiles."
    global_remote_state = true
    working_directory   = "modules/ucs_chassis_profiles"
    workspace_type      = "chassis"
  }
  "Asgard_domain_profiles" = {
    auto_apply          = true
    description         = "Asgard UCS Domain Profile."
    global_remote_state = true
    working_directory   = "modules/ucs_domain_profiles"
    workspace_type      = "domain"
  }
  "Asgard_policies" = {
    auto_apply        = true
    description       = "Asgard UCS Policies."
    working_directory = "modules/policies"
    workspace_type    = "policies"
  }
  "Asgard_policies_vlans" = {
    auto_apply        = true
    description       = "Asgard UCS Multicast and VLAN Policies."
    working_directory = "modules/policies_vlans"
    workspace_type    = "vlan"
  }
  "Asgard_pools" = {
    auto_apply          = true
    description         = "Pools for the Asgard Organization."
    global_remote_state = true
    working_directory   = "modules/pools"
    workspace_type      = "pool"
  }
  "Asgard_server_profiles" = {
    auto_apply          = true
    description         = "Asgard UCS Server Profiles."
    global_remote_state = true
    working_directory   = "modules/ucs_server_profiles"
    workspace_type      = "server"
  }
}

module "workspace_pools" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  auto_apply          = true
  description         = "Terraform Workspace for Pools."
  global_remote_state = true
  name                = "Intersight_Pools"
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/pools"
}

output "workspace_pools" {
  description = "Terraform Cloud Intersight Pools Workspace ID and Name."
  value       = module.workspace_pools
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: domain
#__________________________________________________________

module "workspace_pools_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspace_pools
  ]
  for_each     = var.organizations
  category     = "terraform"
  workspace_id = module.workspace_pools.workspace.id
  variable_list = {
    #---------------------------
    # Intersight Variables
    #---------------------------
    apikey = {
      description = "Intersight API Key."
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    endpoint = {
      description = "Intersight Endpoint."
      key         = "endpoint"
      value       = var.endpoint
    },
    organizations = {
      description = "Intersight Organizations."
      key         = "organizations"
      value       = jsonencode(var.organizations)
    },
    secretkey = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    tags = {
      description = "Intersight Tags for Poliices and Profiles."
      key         = "tags"
      value       = jsonencode(var.tags)
    },
    #----------------------------
    # Intersight Pools Variables
    #----------------------------
    fc_pools_create = {
      description = "Set this to True if you want to Create Fibre-Channel Pools."
      key         = "fc_pools_create"
      value       = var.fc_pools_create
    },
    fc_pools_map = {
      description = "Fibre-Channel Pools Variable Map."
      key         = "fc_pools_map"
      value       = jsonencode(var.fc_pools_map)
    },
    ip_pools_create = {
      description = "Set this to True if you want to Create IP Pools."
      key         = "ip_pools_create"
      value       = var.ip_pools_create
    },
    ip_pools_map = {
      description = "IP Pools Variable Map."
      key         = "ip_pools_map"
      value       = jsonencode(var.ip_pools_map)
    },
    iqn_pools_create = {
      description = "Set this to True if you want to Create IQN Pools."
      key         = "iqn_pools_create"
      value       = var.iqn_pools_create
    },
    iqn_pools_map = {
      description = "IQN Pools Variable Map."
      key         = "iqn_pools_map"
      value       = jsonencode(var.iqn_pools_map)
    },
    mac_pools_create = {
      description = "Set this to True if you want to Create MAC Pools."
      key         = "mac_pools_create"
      value       = var.mac_pools_create
    },
    mac_pools_map = {
      description = "MAC Pools Variable Map."
      key         = "mac_pools_map"
      value       = jsonencode(var.mac_pools_map)
    },
    uuid_pools_create = {
      description = "Set this to True if you want to Create an IP Pool."
      key         = "uuid_pools_create"
      value       = var.uuid_pools_create
    },
    uuid_pools_map = {
      description = "UUID Pools Variable Map."
      key         = "uuid_pools_map"
      value       = jsonencode(var.uuid_pools_map)
    }
  }
}


#__________________________________________________________
#
# Terraform Cloud Workspaces - UCS Domain Profiles
#__________________________________________________________

module "workspaces_domain" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each            = local.ucs_domain_profile
  auto_apply          = true
  description         = "Terraform Workspace for Organization ${each.value.organization}, UCS Domain ${each.key} Profile."
  global_remote_state = true
  name                = each.key
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/domains"
}

output "workspaces_domain" {
  description = "Terraform Cloud UCS Domain Workspace IDs and Names."
  value       = { for v in sort(keys(module.workspaces_domain)) : v => module.workspaces_domain[v] }
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: UCS Domain Profiles
#__________________________________________________________

module "workspaces_domain_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspaces_domain
  ]
  for_each     = var.ucs_domain_profile
  category     = "terraform"
  workspace_id = module.workspaces_domain[each.key].workspace.id
  variable_list = {
    #---------------------------
    # Intersight Variables
    #---------------------------
    apikey = {
      description = "Intersight API Key."
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    endpoint = {
      description = "Intersight Endpoint."
      key         = "endpoint"
      value       = var.endpoint
    },
    organizations = {
      description = "Intersight Organizations."
      key         = "organizations"
      value       = jsonencode(var.organizations)
    },
    secretkey = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    tags = {
      description = "Intersight Tags for Poliices and Profiles."
      hcl         = false
      key         = "tags"
      value       = jsonencode(var.tags)
    },
    #-----------------------------------------
    # Intersight UCS Domain Profile Variables
    #-----------------------------------------
    snmp_community = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "snmp_community"
      sensitive   = true
      value       = var.snmp_community
    },
    snmp_trap_community = {
      description = "The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long."
      key         = "snmp_trap_community"
      sensitive   = true
      value       = var.snmp_trap_community
    },
    snmp_user_1_auth_password = {
      description = "Authorization password for the user."
      key         = "snmp_user_1_auth_password"
      sensitive   = true
      value       = var.snmp_user_1_auth_password
    },
    snmp_user_1_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_1_privacy_password"
      sensitive   = true
      value       = var.snmp_user_1_privacy_password
    },
    snmp_user_2_auth_password = {
      description = "Authorization password for the user."
      key         = "snmp_user_2_auth_password"
      sensitive   = true
      value       = var.snmp_user_2_auth_password
    },
    snmp_user_2_privacy_password = {
      description = "Privacy password for the user."
      key         = "snmp_user_2_privacy_password"
      sensitive   = true
      value       = var.snmp_user_2_privacy_password
    },
    ucs_domain_profile = {
      description = "Intersight UCS Domain Profiles."
      key         = "ucs_domain_profile"
      value       = jsonencode(var.ucs_domain_profile)
    },
  }
}


#__________________________________________________________
#
# Terraform Cloud Workspaces - UCS Domain Profiles
#__________________________________________________________

module "workspaces_domain_vlans" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each            = local.ucs_domain_profile
  auto_apply          = true
  description         = "Terraform Workspace for Organization ${each.value.organization}, UCS Domain ${each.key} VLANs."
  global_remote_state = true
  name                = "${each.key}_vlans"
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/domain_vlans"
}

output "workspaces_domain_vlans" {
  description = "Terraform Cloud UCS Domain VLANs Workspace IDs and Names."
  value       = { for v in sort(keys(module.workspaces_domain_vlans)) : v => module.workspaces_domain_vlans[v] }
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: UCS Domain Profiles
#__________________________________________________________

module "workspaces_domain_vlans_variables" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.workspaces_domain_vlans
  ]
  for_each     = var.ucs_domain_profile
  category     = "terraform"
  workspace_id = module.workspaces_domain_vlans[each.key].workspace.id
  variable_list = {
    #---------------------------
    # Terraform Cloud Variables
    #---------------------------
    tfc_organization = {
      description = "Terraform Cloud Organization."
      key         = "tfc_organization"
      value       = var.tfc_organization
    },
    ws_domain = {
      description = "Terraform Cloud UCS Domain Workspace."
      key         = "ws_domain"
      value       = each.key
    },
    #---------------------------
    # Intersight Variables
    #---------------------------
    apikey = {
      description = "Intersight API Key."
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    endpoint = {
      description = "Intersight Endpoint."
      key         = "endpoint"
      value       = var.endpoint
    },
    organizations = {
      description = "Intersight Organizations."
      key         = "organizations"
      value       = jsonencode(var.organizations)
    },
    secretkey = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    #-----------------------------------------
    # Intersight UCS Domain Profile Variables
    #-----------------------------------------
    ucs_domain_profile = {
      description = "Intersight UCS Domain Profiles."
      key         = "ucs_domain_profile"
      value       = jsonencode(var.ucs_domain_profile)
    },
  }
}


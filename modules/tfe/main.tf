#__________________________________________________________
#
# Terraform Cloud Workspace - Domains
#__________________________________________________________

module "domain_workspaces" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each            = var.domain_list
  auto_apply          = true
  description         = "Terraform Workspace for Organization ${var.organization}, UCS Domain ${each.value.domain}"
  global_remote_state = true
  name                = "${var.organization}_${each.value.domain}"
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/domain"
}

output "domain_workspaces" {
  description = "Terraform Cloud UCS Domain Workspace ID and Name."
  value       = { for v in sort(keys(module.domain_workspaces)) : v => module.domain_workspaces[v] }
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: domain
#__________________________________________________________

module "domain_variables" {
  source = "../../../terraform-tfe-modules/modules/tfc_variables"
  depends_on = [
    module.domain_workspaces
  ]
  for_each     = var.domain_list
  category     = "terraform"
  workspace_id = module.domain_workspaces["${each.value.domain}"].workspace.id
  variable_list = {
    #---------------------------
    # Terraform Cloud Variables
    #---------------------------
    tfcorg = {
      description = "Terraform Cloud Organization."
      key         = "tfc_organization"
      value       = var.tfc_organization
    },
    tfcws = {
      description = "Domain Policies Workspace Name."
      key         = "domain_policies_workspace"
      value       = "${var.organization}_policies_domains"
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
    url = {
      description = "Intersight URL."
      key         = "endpoint"
      value       = var.endpoint
    },
    org = {
      description = "Intersight Organization."
      key         = "organization"
      value       = var.organization
    },
    secret = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    tags = {
      description = "Tags to be Associated with Objects Created in Intersight."
      hcl         = true
      key         = "tags"
      value       = var.tags
    },
    #---------------------------
    # UCS Domain Variables
    #---------------------------
    swflag = {
      description = "Setting this Flag to True will Assign Switches to Profile."
      key         = "assign_switches"
      value       = var.assign_switches
    },
    cluster = {
      description = "UCS Domain Profile Name."
      key         = "cluster_name"
      value       = each.value.domain
    },
    # var10 = {
    #   description = "Terraform Cloud HCL Block for Additional Variables."
    #   hcl         = true
    #   key         = "tfc_variables"
    #   value       = each.value.tfc_variables
    # },
  }
}


#__________________________________________________________
#
# Terraform Cloud Workspace - Domain Policies
#__________________________________________________________

module "domain_policies_workspace" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  auto_apply          = true
  description         = "Terraform Workspace for Organization ${var.organization} Domain Policies."
  global_remote_state = true
  name                = "${var.organization}_policies_domains"
  terraform_version   = var.terraform_version
  tfc_oauth_token     = var.tfc_oauth_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "modules/policies_domains"
}

output "domain_policies_workspace" {
  description = "Terraform Cloud UCS Domain Workspace ID and Name."
  value       = module.domain_policies_workspace
}


#__________________________________________________________
#
# Terraform Cloud Workspace Variables: policies_domains
#__________________________________________________________

module "domain_policies_variables" {
  source = "../../../terraform-tfe-modules/modules/tfc_variables"
  depends_on = [
    module.domain_policies_workspace
  ]
  category     = "terraform"
  workspace_id = module.domain_policies_workspace.workspace.id
  variable_list = {
    #---------------------------
    # Terraform Cloud Variables
    #---------------------------
    tfcorg = {
      description = "Terraform Cloud Organization."
      key         = "tfc_organization"
      value       = var.tfc_organization
    },
    tfcws = {
      description = "Domain Workspace Name."
      key         = "domain_workspace"
      value       = var.domain_workspace
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
    url = {
      description = "Intersight URL."
      key         = "endpoint"
      value       = var.endpoint
    },
    org = {
      description = "Intersight Organization."
      key         = "organization"
      value       = var.organization
    },
    secret = {
      description = "Intersight Secret Key."
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
    tags = {
      description = "Tags to be Associated with Objects Created in Intersight."
      hcl         = true
      key         = "tags"
      value       = var.tags
    },
    #---------------------------
    # Domain Policies Variables
    #---------------------------
    domflag = {
      description = "Flag to Assign Policies to Domain or not."
      key         = "assign_domain"
      value       = var.assign_domain
    },
    comm = {
      description = "SNMP Community to Assign to the SNMP Policy."
      key         = "snmp_community"
      sensitive   = true
      value       = var.snmp_community
    },
    trap = {
      description = "SNMP Trap Community to Assign to the SNMP Policy."
      key         = "trap_community"
      sensitive   = true
      value       = var.trap_community
    },
    # var10 = {
    #   description = "SNMP Trap Community to Assign to the SNMP Policy."
    #   key         = "snmp_users"
    #   sensitive   = true
    #   value       = var.snmp_users
    # },
  }
}

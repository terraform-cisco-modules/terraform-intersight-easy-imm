#__________________________________________________________
#
# Terraform Cloud Workspace - Domains
#__________________________________________________________

module "tfc_workspaces" {
  source              = "terraform-cisco-modules/modules/tfe//modules/tfc_workspace"
  for_each            = var.domain_list
  auto_apply          = true
  description         = "Terraform Workspace for Organization ${var.organization}, UCS Domain ${each.value}"
  global_remote_state = true
  name                = "${var.organization}_${each.value}"
  terraform_version   = var.terraform_version
  tfc_oath_token      = var.tfc_oath_token
  tfc_org_name        = var.tfc_organization
  vcs_repo            = var.vcs_repo
  working_directory   = "domain"
}

output "workspaces" {
  description = "Terraform Cloud Workspace ID and Name."
  value       = { for v in sort(keys(module.tfc_workspaces)) : v => module.tfc_workspaces[v] }
}


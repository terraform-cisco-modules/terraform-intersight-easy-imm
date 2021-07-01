#__________________________________________________________
#
# Terraform Cloud Workspaces
#__________________________________________________________

module "tfc_workspaces" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_workspaces"
  depends_on = [
    module.tfc_agent_pool
  ]
  tfc_oath_token = var.tfc_oath_token
  tfc_org_name   = var.tfc_organization
  workspace_list = {
    "global_vars" = {
      auto_apply          = true
      description         = "Global Variables Workspace."
      global_remote_state = true
      name                = "${var.cluster_name}_global_vars"
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_directory   = "global_vars"
    },
    "iks" = {
      auto_apply        = true
      description       = "Intersight Kubernetes Service Workspace."
      name              = "${var.cluster_name}_iks"
      terraform_version = var.terraform_version
      vcs_repo          = var.vcs_repo
      working_directory = "iks"
    },
    "kube" = {
      auto_apply          = true
      description         = "Intersight Kubernetes Service - kube_config Workspace."
      global_remote_state = true
      name                = "${var.cluster_name}_kube"
      terraform_version   = var.terraform_version
      vcs_repo            = var.vcs_repo
      working_directory   = "kube"
    },
    "iwo" = {
      auto_apply        = true
      agent_pool        = module.tfc_agent_pool.tfc_agent_pool
      description       = "Application Workspace - Intersight Workload Optimizer."
      execution_mode    = "agent"
      name              = "${var.cluster_name}_iwo"
      terraform_version = var.terraform_version
      vcs_repo          = var.vcs_repo
      working_directory = "iwo"
    },
    "app_hello" = {
      auto_apply        = true
      agent_pool        = module.tfc_agent_pool.tfc_agent_pool
      description       = "Application Workspace - Hello Kubernetes."
      execution_mode    = "agent"
      name              = "${var.cluster_name}_app_hello"
      terraform_version = var.terraform_version
      vcs_repo          = var.vcs_repo
      working_directory = "app_hello"
    },
  }
}

output "tfc_workspaces" {
  description = "Terraform Cloud Workspace ID(s)."
  value       = module.tfc_workspaces
}

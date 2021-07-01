#__________________________________________________________
#
# Terraform Cloud Workspace Variables: app_hello
#__________________________________________________________

module "tfc_variables_app_hello" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id.app_hello
  variable_list = [
    {
      description = "Terraform Cloud Organization."
      hcl         = false
      key         = "tfc_organization"
      sensitive   = false
      value       = var.tfc_organization
    },
    {
      description = "global_vars Workspace."
      hcl         = false
      key         = "ws_global_vars"
      sensitive   = false
      value       = "${var.cluster_name}_global_vars"
    },
    {
      description = "Intersight Kubernetes Service kube_config Workspace."
      hcl         = false
      key         = "ws_kube"
      sensitive   = false
      value       = "${var.cluster_name}_kube"
    },
  ]
}

output "app_hello_vars" {
  value = module.tfc_variables_app_hello.tfe_variable_id
}

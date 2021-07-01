#__________________________________________________________
#
# Terraform Cloud Workspace Variables: kube
#__________________________________________________________

module "tfc_variables_kube" {
  source = "terraform-cisco-modules/modules/tfe//modules/tfc_variables"
  depends_on = [
    module.tfc_workspaces
  ]
  category     = "terraform"
  workspace_id = module.tfc_workspaces.tfe_workspace_id.kube
  variable_list = [
    #---------------------------
    # Terraform Cloud Variables
    #---------------------------
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
    #---------------------------
    # Intersight Variables
    #---------------------------
    {
      description = "Intersight API Key."
      hcl         = false
      key         = "apikey"
      sensitive   = true
      value       = var.apikey
    },
    {
      description = "Intersight Secret Key."
      hcl         = false
      key         = "secretkey"
      sensitive   = true
      value       = var.secretkey
    },
  ]
}

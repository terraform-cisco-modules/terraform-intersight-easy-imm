#__________________________________________________________
#
# Get Outputs from the Global Variables Workspace
#__________________________________________________________

data "terraform_remote_state" "global" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.ws_global_vars
    }
  }
}


#__________________________________________________________
#
# Assign Global Attributes from global_vars Workspace
#__________________________________________________________

locals {
  # Intersight Provider Variables
  endpoint = yamldecode(data.terraform_remote_state.global.outputs.endpoint)
  # IKS Cluster Variable
  cluster_name = yamldecode(data.terraform_remote_state.global.outputs.cluster_name)
}


#______________________________________________
#
# Get kube_config from IKS Cluster
#______________________________________________

data "intersight_kubernetes_cluster" "kube_config" {
  name = local.cluster_name
}

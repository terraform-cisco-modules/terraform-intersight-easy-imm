#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

#__________________________________________________________
#
# Assign Global Attributes from global_vars Workspace
#__________________________________________________________

locals {
  # Intersight Organization Variables
  org_name = data.terraform_remote_state.global.outputs.organization
  org_moid = data.intersight_organization_organization.org_moid.results.0.moid

  # Intersight Provider Variables
  endpoint = data.terraform_remote_state.global.outputs.endpoint

  # Tags for Deployment
  tags = data.terraform_remote_state.global.outputs.tags
}

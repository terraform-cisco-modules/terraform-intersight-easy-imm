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
  org_name = var.organization
  org_moid = data.intersight_organization_organization.org_moid.results.0.moid

  # Intersight UCS Domain Variables
  domain_profile_a = data.terraform_remote_state.domain.outputs.domain_profile_a
  domain_profile_b = data.terraform_remote_state.domain.outputs.domain_profile_b

  # Tags for Deployment
  tags = var.tags
}


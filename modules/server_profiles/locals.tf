#__________________________________________________________
#
# Local Variables Section
#__________________________________________________________

locals {
  # Intersight Organization Variables
  organizations = var.organizations
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }

  # Intersight Provider Variables
  endpoint = var.endpoint
  # Tags for Deployment
  tags = var.tags

  #______________________________________________
  #
  # UCS Domain Variables
  #______________________________________________
  ucs_server_profile = {
    for k, v in var.ucs_server_profile : k => {
      action              = (v.action != null ? v.action : "No-op")
      assign_server       = (v.assign_server != null ? v.assign_server : false)
      description         = (v.description != null ? v.description : "")
      name                = (v.name != null ? v.name : "")
      operating_system    = (v.name != null ? v.name : "vmware")
      organization        = (v.organization != null ? v.organization : "default")
      policy_bucket       = (v.policy_bucket != null ? v.policy_bucket : [])
      src_template        = (v.src_template != null ? v.src_template : [])
      tags                = (v.tags != null ? v.tags : [])
      target_platform     = (v.target_platform != null ? v.target_platform : "FIAttached")
      type                = (v.type != null ? v.type : "instance")
      wait_for_completion = (v.wait_for_completion != null ? v.wait_for_completion : false)
    }
  }
}

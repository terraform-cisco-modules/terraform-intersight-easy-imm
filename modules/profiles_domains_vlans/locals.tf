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

  # UCS Domain Outputs
  vlan_policy = data.terraform_remote_state.domain.outputs.vlan_policy
  #______________________________________________
  #
  # Multicast Variables Locals
  #______________________________________________
  multicast_policy = {
    for k, v in var.multicast_policy : k => {
      description    = (v.description != null ? v.description : "")
      organization   = (v.organization != null ? v.organization : "default")
      querier_ip     = (v.querier_ip != null ? v.querier_ip : "")
      querier_state  = (v.querier_state != null ? v.querier_state : "Disabled")
      snooping_state = (v.snooping_state != null ? v.snooping_state : "Enabled")
      tags           = (v.tags != null ? v.tags : [])
    }
  }

  #______________________________________________
  #
  # VLAN Map Variables Locals
  #______________________________________________
  vlan_lists = {
    for k, v in var.vlan_lists : k => {
      multicast_policy = (v.multicast_policy != null ? v.multicast_policy : "default")
      vlan_native      = (v.vlan_native != null ? v.vlan_native : null)
      vlan_list        = (v.vlan_list != null ? v.vlan_list : null)
      vlan_policy      = (v.vlan_policy != null ? v.vlan_policy : null)
      vlan_prefix      = (v.vlan_prefix != null ? v.vlan_prefix : "")
    }
  }
}

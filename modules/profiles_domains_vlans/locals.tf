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
  profiles_ucs_domain = data.terraform_remote_state.domain.outputs.profiles_ucs_domain

  #______________________________________________
  #
  # Multicast Variables Locals
  #______________________________________________
  policies_multicast = {
    for k, v in var.policies_multicast : k => {
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
  # VLAN Policy Variables Locals
  #______________________________________________
  policies_vlan = {
    for k, v in var.policies_vlan : k => {
      auto_allow_on_uplinks = (v.auto_allow_on_uplinks != null ? v.auto_allow_on_uplinks : true)
      description           = (v.description != null ? v.description : "")
      multicast_policy      = (v.multicast_policy != null ? v.multicast_policy : null)
      organization          = (v.organization != null ? v.organization : "default")
      tags                  = (v.tags != null ? v.tags : [])
      vlan_list             = (v.vlan_list != null ? v.vlan_list : "")
      vlan_map              = (v.vlan_map != null ? v.vlan_map : "")
      vlan_native           = (v.vlan_native != null ? v.vlan_native : null)
      vlan_prefix           = (v.vlan_prefix != null ? v.vlan_prefix : v.organization)
    }
  }
}

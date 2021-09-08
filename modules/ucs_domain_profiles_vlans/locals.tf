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
  merge_all_moids = data.terraform_remote_state.domain.outputs.merge_all_moids

  #______________________________________________
  #
  # Multicast Variables Locals
  #______________________________________________
  multicast_policies = {
    for k, v in var.multicast_policies : k => {
      description             = v.description != null ? v.description : ""
      organization            = v.organization != null ? v.organization : "default"
      querier_ip_address      = v.querier_ip_address != null ? v.querier_ip_address : ""
      querier_ip_address_peer = v.querier_ip_address_peer != null ? v.querier_ip_address_peer : ""
      querier_state           = v.querier_state != null ? v.querier_state : "Disabled"
      snooping_state          = v.snooping_state != null ? v.snooping_state : "Enabled"
      tags                    = v.tags != null ? v.tags : []
    }
  }

  #__________________________________________________________
  #
  # VSAN Policy Section Locals
  #__________________________________________________________

  vlan_policies = {
    for k, v in var.vlan_policies : k => {
      description  = v.description != null ? v.description : ""
      organization = v.organization != null ? v.organization : "default"
      tags         = v.tags != null ? v.tags : []
      vlans        = v.vlans != null ? v.vlans : {}
    }
  }

  vlans = flatten([
    for key, value in var.vlan_policies : [
      for v in value.vlans : {
        auto_allow_on_uplinks = v.auto_allow_on_uplinks != null ? v.auto_allow_on_uplinks : true
        multicast_policy      = v.multicast_policy != null ? v.multicast_policy : 4
        name                  = v.name != null ? v.name : "vlan-${v.vlan_id}"
        native_vlan           = v.native_vlan != null ? v.native_vlan : false
        vlan_id               = v.vlan_id != null ? v.vlan_id : 4
        vlan_policy           = key
      }
    ]
  ])
}

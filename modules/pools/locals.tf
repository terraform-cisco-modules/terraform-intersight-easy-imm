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
  # Fibre-Channel Pools
  #______________________________________________
  fc_pools_map = {
    for k, v in var.fc_pools_map : k => {
      assignment_order = (v.assignment_order != null ? v.assignment_order : "default")
      description      = (v.description != null ? v.description : "")
      id_blocks        = (v.id_blocks != null ? v.id_blocks : [
        {
          from = "20:00:00:25:B5:0a:00:00"
          to   = "20:00:00:25:B5:0a:00:ff"
        }
      ])
      organization     = (v.organization != null ? v.organization : "default")
      pool_purpose     = (v.pool_purpose != null ? v.pool_purpose : "WWPN")
      tags             = (v.tags != null ? v.tags : [])
    }
  }
  #______________________________________________
  #
  # IP Pools
  #______________________________________________
  ip_pools_map = {
    for k, v in var.ip_pools_map : k => {
      assignment_order = (v.assignment_order != null ? v.assignment_order : "default")
      description      = (v.description != null ? v.description : "")
      dns_servers_v4   = (v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"])
      dns_servers_v6   = (v.dns_servers_v6 != null ? v.dns_servers_v6 : [])
      ipv4_block       = (v.ipv4_block != null ? v.ipv4_block : [])
      ipv4_config      = (v.ipv4_config != null ? v.ipv4_config : [])
      ipv6_block       = (v.ipv6_block != null ? v.ipv6_block : [])
      ipv6_config      = (v.ipv6_config != null ? v.ipv6_config : [])
      organization     = (v.organization != null ? v.organization : "default")
      tags             = (v.tags != null ? v.tags : [])
    }
  }
  #______________________________________________
  #
  # IQN Pools
  #______________________________________________
  iqn_pools_map = {
    for k, v in var.iqn_pools_map : k => {
      assignment_order  = (v.assignment_order != null ? v.assignment_order : "default")
      description       = (v.description != null ? v.description : "")
      iqn_prefix        = (v.iqn_prefix != null ? v.iqn_prefix : "iqn.2021-11.com.cisco")
      iqn_suffix_blocks = (v.iqn_suffix_blocks != null ? v.iqn_suffix_blocks : [])
      organization      = (v.organization != null ? v.organization : "default")
      tags              = (v.tags != null ? v.tags : [])
    }
  }
  #______________________________________________
  #
  # MAC Pools
  #______________________________________________
  mac_pools_map = {
    for k, v in var.mac_pools_map : k => {
      assignment_order  = (v.assignment_order != null ? v.assignment_order : "default")
      description       = (v.description != null ? v.description : "")
      mac_blocks        = (v.mac_blocks != null ? v.mac_blocks : [])
      organization      = (v.organization != null ? v.organization : "default")
      tags              = (v.tags != null ? v.tags : [])
    }
  }
  #______________________________________________
  #
  # UUID Pools
  #______________________________________________
  uuid_pools_map = {
    for k, v in var.uuid_pools_map : k => {
      assignment_order   = (v.assignment_order != null ? v.assignment_order : "default")
      description        = (v.description != null ? v.description : "")
      prefix             = (v.prefix != null ? v.prefix : "") # "123e4567-e89b-42d3"
      organization       = (v.organization != null ? v.organization : "default")
      tags               = (v.tags != null ? v.tags : [])
      uuid_suffix_blocks = (v.uuid_suffix_blocks != null ? v.uuid_suffix_blocks : []) # [ { from = "e456-1234e89b42aa", size = 32768 } ]
    }
  }
}
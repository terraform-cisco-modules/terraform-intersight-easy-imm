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
  # Tags for Deployment
  tags = var.tags

  ldap_policies = {
    for k, v in var.ldap_policies : k => {
      description = v.description != null ? v.description : ""
      base_settings = {
        base_dn = v.base_settings.base_dn
        domain  = v.base_settings.domain
        timeout = v.base_settings.timeout != null ? v.base_settings.timeout : 0
      }
      binding_parameters = {
        bind_dn     = v.binding_parameters.bind_dn != null ? v.binding_parameters.bind_dn : ""
        bind_method = v.binding_parameters.bind_method != null ? v.binding_parameters.bind_method : "LoginCredentials"
      }
      enable_encryption          = v.enable_encryption != null ? v.enable_encryption : false
      enable_group_authorization = v.enable_group_authorization != null ? v.enable_group_authorization : false
      enable_ldap                = v.enable_ldap != null ? v.enable_ldap : true
      ldap_from_dns              = v.ldap_from_dns != null ? v.ldap_from_dns : {}
      ldap_groups                = v.ldap_groups != null ? v.ldap_groups : {}
      ldap_servers               = v.ldap_servers != null ? v.ldap_servers : {}
      nested_group_search_depth  = v.nested_group_search_depth != null ? v.nested_group_search_depth : 128
      organization               = v.organization != null ? v.organization : "default"
      search_parameters = {
        attribute       = v.search_parameters.attribute != null ? v.search_parameters.attribute : "CiscoAvPair"
        filter          = v.search_parameters.filter != null ? v.search_parameters.filter : "samAccountName"
        group_attribute = v.search_parameters.group_attribute != null ? v.search_parameters.group_attribute : "memberOf"
      }
      tags                   = []
      user_search_precedence = v.user_search_precedence != null ? v.user_search_precedence : "LocalUserDb"
    }
  }

  ldap_server_loop = flatten([
    for k, v in var.ldap_policies : [
      for key, value in v.ldap_servers : {
        policy = k
        port   = value.port != null ? value.port : 389
        server = key
      }
    ]
  ])

  ldap_servers = {
    for k, v in local.ldap_server_loop : "${v.policy}_${v.server}" => v
  }

  ldap_group_loop = flatten([
    for k, v in var.ldap_policies : [
      for key, value in v.ldap_groups : {
        domain = v.base_settings.domain
        name   = key
        policy = k
        role   = value.role != null ? value.role : "admin"
      }
    ]
  ])

  ldap_groups = {
    for k, v in local.ldap_group_loop : "${v.policy}_${v.name}" => v
  }


}

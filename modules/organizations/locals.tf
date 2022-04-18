locals {
  organizations = {
    for k, v in var.organizations : k => {
      create_org      = v.create_org != null ? v.create_org : false
      description     = v.description != null ? v.description : ""
      groups          = v.groups != null ? v.groups : []
      resource_groups = v.resource_groups != null ? v.resource_groups : []
      roles           = v.roles != null ? v.roles : []
    }
  }

  groups_loop_1 = flatten([
    for key, value in local.organizations : [
      for k, v in value.groups : {
        create_org                      = value.create_org
        group_name_in_identity_provider = v.group_name_in_identity_provider
        identity_provider               = v.identity_provider != null ? v.identity_provider : "Cisco"
        name                            = v.name != null ? v.name : "default"
        organization                    = key
        roles                           = v.roles != null ? v.roles : []
      }
    ]
  ])
  groups = { for k, v in local.groups_loop_1 : "${v.organization}_${v.name}" => v }

  resource_groups_loop_1 = flatten([
    for key, value in local.organizations : [
      for k, v in value.resource_groups : {
        create_org   = value.create_org
        description  = v.description != null ? v.description : ""
        organization = key
        qualifier    = v.qualifier != null ? v.qualifier : "Allow-Selectors"
        selectors    = v.selectors != null ? v.selectors : []
      }
    ]
  ])
  resource_groups = { for k, v in local.resource_groups_loop_1 : "${v.organization}" => v }

  roles_loop_1 = flatten([
    for key, value in local.organizations : [
      for k, v in value.roles : {
        create_org   = value.create_org
        description  = v.description != null ? v.description : ""
        name         = v.name != null ? v.name : "default"
        organization = key
        privileges   = v.privileges
      }
    ]
  ])
  roles = { for k, v in local.roles_loop_1 : "${v.organization}_${v.name}" => v }

}

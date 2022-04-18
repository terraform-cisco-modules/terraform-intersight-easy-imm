#____________________________________________________________
#
# Intersight Organizations
# GUI Location: Settings > Settings > Organizations
#____________________________________________________________

resource "intersight_organization_organization" "organizations" {
  for_each    = { for k, v in local.organizations : k => v if v.create_org == true }
  description = each.value.description
  name        = each.key
}

#____________________________________________________________
#
# Intersight Resource Groups
# GUI Locations: Settings > Settings > Resource Groups
#____________________________________________________________

resource "intersight_resource_group" "resource_groups" {
  depends_on = [
    intersight_organization_organization.organizations
  ]
  for_each    = { for k, v in local.resource_groups : k => v if v.create_org == true }
  description = each.value.description
  name        = "${each.key}_rg"
  organizations {
    moid = length(regexall(
      true, each.value.create_org)
      ) > 0 ? intersight_organization_organization.organizations[each.key].moid : length(regexall(
      false, each.value.create_org)
    ) > 0 ? data.intersight_organization_organization.organizations[each.key].results[0].moid : ""
  }
  qualifier = each.value.qualifier
  dynamic "selectors" {
    for_each = toset(each.value.selectors)
    content {
      selector = selectors.value.selector
    }
  }
}

#____________________________________________________________
#
# Intersight Roles
# GUI Locations: Settings > Settings > Roles
#____________________________________________________________

resource "intersight_iam_permission" "roles" {
  for_each    = local.roles
  description = each.value.description
  name        = each.value.name
}

resource "intersight_iam_resource_roles" "roles" {
  depends_on = [
    intersight_iam_permission.roles
  ]
  for_each = local.roles
  permission {
    moid = intersight_iam_permission.roles[each.key].moid
  }
  resource {
    moid = length(regexall(
      true, each.value.create_org)
      ) > 0 ? intersight_organization_organization.organizations[each.value.organization].moid : length(regexall(
      false, each.value.create_org)
    ) > 0 ? data.intersight_organization_organization.organizations[each.value.organization].results[0].moid : ""
    object_type = "organization.Organization"
  }
  dynamic "roles" {
    for_each = toset(each.value.privileges)
    content {
      moid = data.intersight_iam_role.privileges.results[index(
        data.intersight_iam_role.privileges.results.*.name, "${roles.value}"
      )].moid
    }
  }
}

#____________________________________________________________
#
# Intersight User Groups
# GUI Locations: Settings > Settings > Groups
#____________________________________________________________

resource "intersight_iam_user_group" "groups" {
  depends_on = [
    data.intersight_iam_idp.identity_providers,
  ]
  for_each = local.groups
  name     = each.value.name
  idp {
    moid = data.intersight_iam_idp.identity_providers[each.value.identity_provider].results[0].moid
  }
  lifecycle {
    ignore_changes = [qualifier]
  }
  dynamic "permissions" {
    for_each = toset(each.value.roles)
    content {
      moid = intersight_iam_permission.roles["${each.value.organization}_${permissions.value}"].moid
    }
  }
}

resource "intersight_iam_qualifier" "iam_qualifiers" {
  depends_on = [
    intersight_iam_user_group.groups
  ]
  for_each = local.groups
  value    = [each.value.group_name_in_identity_provider]
  usergroup {
    moid = intersight_iam_user_group.groups[each.key].moid
  }
}


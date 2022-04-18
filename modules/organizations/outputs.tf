output "created_organizations" {
  value = {
    for k in sort(keys(intersight_organization_organization.organizations)
    ) : k => intersight_organization_organization.organizations[k].moid
  }
}

output "data_organizations" {
  value = {
    for k in sort(keys(data.intersight_organization_organization.organizations)
    ) : k => data.intersight_organization_organization.organizations[k].results[0].moid
  }
}

output "identity_providers" {
  value = {
    for k in sort(keys(data.intersight_iam_idp.identity_providers)
    ) : k => data.intersight_iam_idp.identity_providers[k].results[0].moid
  }
}

output "privileges" {
  value = sort([
    for k, v in data.intersight_iam_role.privileges.results : data.intersight_iam_role.privileges.results[k].name
  ])
}


#____________________________________________________________
#
# Intersight Data Sources
# GUI Locations:
# - Identity Providers: Settings > Settings > Single Sign-On
# - Organizations: Settings > Settings > Organizations
# - Resource Groups: Settings > Settings > Resource Groups
#____________________________________________________________

data "intersight_iam_role" "privileges" {
}

data "intersight_iam_idp" "identity_providers" {
  for_each = toset(var.identity_providers)
  name     = each.value
}

data "intersight_organization_organization" "organizations" {
  for_each = { for k, v in local.organizations : k => v if v.create_org == false }
  name     = each.key
}


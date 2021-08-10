#____________________________________________________________
#
# LDAP Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________

#______________________________________________
#
# LDAP Policy
#______________________________________________

module "ldap_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                     = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_policy"
  attribute                  = local.ldap_attribute
  base_dn                    = local.ldap_base_dn
  bind_dn                    = local.ldap_bind_dn
  bind_method                = local.ldap_bind_method
  description                = local.ldap_policy != "" ? "${local.ldap_policy} LDAP Policy." : "${local.org_name} LDAP Policy."
  domain                     = local.ldap_domain
  enable_encryption          = local.ldap_enable_encryption
  enable_dns                 = local.ldap_enable_dns
  enable_group_authorization = local.ldap_enable_group_authorization
  enabled                    = local.ldap_enabled
  filter                     = local.ldap_filter
  group_attribute            = local.ldap_group_attribute
  name                       = local.ldap_policy != "" ? local.ldap_policy : local.org_name
  nested_group_search_depth  = local.ldap_nested_group_search_depth
  nr_source                  = local.ldap_nr_source
  org_moid                   = local.org_moid
  password                   = local.ldap_password
  search_domain              = local.ldap_search_domain
  search_forest              = local.ldap_search_forest
  tags                       = var.tags
  timeout                    = local.ldap_timeout
  user_search_precedence     = local.ldap_user_search_precedence
}

#______________________________________________
#
# LDAP Provider
#______________________________________________

module "ldap_provider" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.ldap_policy
  ]
  for_each         = local.ldap_server
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_provider"
  ldap_policy_moid = module.ldap_policy.moid
  ldap_server      = each.value
}

#______________________________________________
#
# LDAP Groups
#______________________________________________

module "ldap_groups" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.ldap_policy
  ]
  for_each         = local.ldap_groups
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_ldap_group"
  group_role       = each.value.group_role
  ldap_group       = each.value.ldap_group
  ldap_policy_moid = module.ldap_policy.moid
}


#____________________________________________________________
#
# Local User Policy
# GUI Location: Policies > Create Policy
#____________________________________________________________


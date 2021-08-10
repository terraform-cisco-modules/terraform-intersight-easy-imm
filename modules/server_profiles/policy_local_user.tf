#______________________________________________
#
# Local User Policy
#______________________________________________

module "local_user_policy" {
  depends_on = [
    data.intersight_organization_organization.org_moid
  ]
  source                   = "terraform-cisco-modules/imm/intersight//modules/policies_local_user_policy"
  description              = local.local_user_policy != "" ? "${var.local_user_policy} Local User Policy." : "${local.org_name} Local User Policy."
  enable_password_expiry   = local.local_user_password_expiry
  enforce_strong_password  = local.local_user_enforce_strong_password
  force_send_password      = local.local_user_force_send_password
  grace_period             = local.local_user_grace_period
  name                     = local.local_user_policy != "" ? var.local_user_policy : local.org_name
  notification_period      = local.local_notification_period
  org_moid                 = local.org_moid
  password_expiry_duration = local.local_password_expiry_duration
  password_history         = local.local_password_history
  tags                     = var.tags
}


#______________________________________________
#
# Local Users
#______________________________________________

module "local_users" {
  depends_on = [
    data.intersight_organization_organization.org_moid,
    module.local_user
  ]
  for_each         = local.local_users
  source           = "terraform-cisco-modules/imm/intersight//modules/policies_local_user"
  org_moid         = local.org_moid
  user_enabled     = each.value.enabled
  user_password    = join(".", var, join("_", password_user, each.value.user_count))
  user_policy_moid = module.local_user.moid
  user_role        = each.value.role
  username         = each.value.username
}




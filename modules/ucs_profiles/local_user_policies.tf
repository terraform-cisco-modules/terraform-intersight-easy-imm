#_________________________________________________________________________
#
# Intersight Local User Policies Variables
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

variable "local_user_password_1" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_2" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_3" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_4" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_password_5" {
  default     = ""
  description = "Password to assign to a local user.  Sensitive Variables cannot be added to a for_each loop so these are added seperately."
  sensitive   = true
  type        = string
}

variable "local_user_policies" {
  default = {
    default = {
      description             = ""
      enforce_strong_password = true
      force_send_password     = false
      grace_period            = 0
      users = {
        default = {
          enabled  = true
          password = 1
          role     = "admin"
        }
      }
      notification_period      = 15
      organization             = "default"
      password_expiry          = false
      password_expiry_duration = 90
      password_history         = 5
      tags                     = []
    }
  }
  description = <<-EOT
  key - Name of the Local User Policy.
  * description - Description to Assign to the Policy.
  * force_send_password - User password will always be sent to endpoint device. If the option is not selected, then user password will be sent to endpoint device for new users and if user password is changed for existing users.
  * grace_period - Time period until when you can use the existing password, after it expires.
  * users - Map of users to add to the local user policy.
    - key - Username
    - enabled - Enables the user account on the endpoint.
    - password - This is a key to signify the variable "local_user_password_[key]" to be used.  i.e. 1 for variable "local_user_password_1".
    - role - The Role to Assign to the User.  Valid Options are {admin|readonly|user}.
  * notification_period - The duration after which the password will expire.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * password_expiry - Enables password expiry on the endpoint.
  * password_expiry_duration - Set time period for password expiration. Value should be greater than notification period and grace period.
  * password_history - Tracks password change history. Specifies in number of instances, that the new password was already used.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      description             = optional(string)
      enforce_strong_password = optional(bool)
      force_send_password     = optional(bool)
      grace_period            = optional(number)
      users = optional(map(object(
        {
          enabled  = optional(bool)
          password = optional(number)
          role     = optional(string)
        }
      )))
      notification_period      = optional(number)
      organization             = optional(string)
      password_expiry          = optional(bool)
      password_expiry_duration = optional(number)
      password_history         = optional(number)
      tags                     = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# Local User Policies
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

module "local_user_policies" {
  depends_on = [
    local.org_moids,
    module.ucs_server_profiles,
    module.ucs_server_profile_templates
  ]
  source                   = "terraform-cisco-modules/imm/intersight//modules/local_user_policies"
  for_each                 = local.local_user_policies
  description              = each.value.description != "" ? each.value.description : "${each.key} Local User Policy."
  enable_password_expiry   = each.value.password_expiry
  enforce_strong_password  = each.value.enforce_strong_password
  force_send_password      = each.value.force_send_password
  grace_period             = each.value.grace_period
  name                     = each.key
  notification_period      = each.value.notification_period
  org_moid                 = local.org_moids[each.value.organization].moid
  password_expiry_duration = each.value.password_expiry_duration
  password_history         = each.value.password_history
  tags                     = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = {
    for k, v in local.merged_server_moids : k => {
      moid        = v.moid
      object_type = v.object_type
    }
    if local.merged_server_moids[k].local_user_policy == each.key
  }
}


#_________________________________________________________________________
#
# Local Users
# GUI Location: Configure > Policies > Create Policy > Local User > Start
#_________________________________________________________________________

module "local_users" {
  depends_on = [
    local.org_moids,
    module.local_user_policies
  ]
  for_each         = local.local_users.users
  source           = "terraform-cisco-modules/imm/intersight//modules/local_user_add_users"
  org_moid         = local.org_moids[each.value.organization].moid
  user_enabled     = each.value.enabled
  user_password    = each.value.password == 1 ? var.local_user_password_1 : each.value.password == 2 ? var.local_user_password_1 : each.value.password == 3 ? var.local_user_password_1 : each.value.password == 4 ? var.local_user_password_1 : var.local_user_password_1
  user_policy_moid = module.local_user_policies[each.value.policy].moid
  user_role        = each.value.role
  username         = each.value.username
}

#______________________________________________
#
# Local User Policy Variables
#______________________________________________

local_user_policies = {
  "local_users" = {
    description              = "Local User Policy"
    enforce_strong_password  = true
    force_send_password      = false
    grace_period             = 0
    notification_period      = 15
    password_expiry          = false
    password_expiry_duration = 90
    password_history         = 5
    tags                     = []
    users                    = {}
  }
}

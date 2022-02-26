#______________________________________________
#
# Local User Policy Variables
#______________________________________________

local_user_policies = {
  "users" = {
    description             = ""
    enforce_strong_password = true
    force_send_password     = false
    grace_period            = 0
    users = {
      "admin" = {
        # enabled  = true
        # password = 1
        # role     = "admin"
      }
      "serverops" = {
        enabled  = true
        password = 2
        role     = "readonly"
      }
    }
    notification_period      = 15
    password_expiry          = false
    password_expiry_duration = 90
    password_history         = 5
    tags                     = []
  }
}

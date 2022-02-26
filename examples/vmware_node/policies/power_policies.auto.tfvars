#______________________________________________
#
# Power Policy Variables
#______________________________________________

power_policies = {
  "power_5108" = {
    description      = "5108 Power Policy."
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "AlwaysOff"
    tags             = []
  }
  "power_9508" = {
    description      = "X-Series Power Policy."
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "AlwaysOff"
    tags             = []
  }
  "power_server" = {
    description      = "Server Power Policy"
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "LastState"
    tags             = []
  }
}

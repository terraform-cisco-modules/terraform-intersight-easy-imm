#______________________________________________
#
# Power Policy Variables
#______________________________________________

power_policies = {
  "5108" = {
    description      = "5108 Power Policy."
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "AlwaysOff"
    tags             = []
  }
  "9508" = {
    description      = "X-Series Power Policy."
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "AlwaysOff"
    tags             = []
  }
  "Server" = {
    description      = "Server Power Policy"
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "Grid"
    power_restore    = "LastState"
    tags             = []
  }
  "UCS-DEMO2" = {
    description      = ""
    power_allocation = 0
    power_profiling  = "Enabled"
    power_redunancy  = "N+1"
    power_restore    = "LastState"
    tags             = []
  }
}

#______________________________________________
#
# Power Policy Variables
#______________________________________________

power_policies = {
  "#Organization#_power_5108" = {
    allocated_budget    = 0
    description         = "#Organization# 5108 Power Policy."
    organization        = "#Organization#"
    power_profiling     = "Enabled"
    power_restore_state = "AlwaysOff"
    redundancy_mode     = "Grid"
    tags                = []
  }
  "#Organization#_power_9508" = {
    allocated_budget    = 0
    description         = "#Organization# X-Series Power Policy."
    organization        = "#Organization#"
    power_profiling     = "Enabled"
    power_restore_state = "AlwaysOff"
    redundancy_mode     = "Grid"
    tags                = []
  }
  "#Organization#_power_server" = {
    allocated_budget    = 0
    description         = "#Organization# Server Power Policy"
    organization        = "#Organization#"
    power_profiling     = "Enabled"
    power_restore_state = "LastState"
    redundancy_mode     = "Grid"
    tags                = []
  }
}

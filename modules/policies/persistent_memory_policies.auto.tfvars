#______________________________________________
#
# Persistent Memory Policy Variables
#______________________________________________

persistent_memory_policies = {
  "Asgard_persistent_memory" = {
    description                  = ""
    goals_memory_percentage      = 0
    goals_persistent_memory_type = "app-direct"
    logical_namespaces = [
      {
        capacity         = 512
        mode             = "raw"
        name             = "profile_1"
        socket_id        = 1
        socket_memory_id = "Not Applicable"
      }
    ]
    management_mode   = "configured-from-intersight"
    organization      = "Asgard"
    retain_namespaces = true
    tags              = []
  }
}

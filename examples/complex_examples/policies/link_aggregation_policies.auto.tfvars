#______________________________________________
#
# Link Aggregation Policy Variables
#______________________________________________

link_aggregation_policies = {
  "linkagg" = {
    description        = ""
    lacp_rate          = "normal"
    suspend_individual = false
    tags               = []
  }
  "UCS-DEMO2" = {
    description        = ""
    lacp_rate          = "normal"
    suspend_individual = false
    tags               = []
  }
  "lacp_pol" = {
    description        = ""
    lacp_rate          = "fast"
    suspend_individual = true
    tags               = []
  }
}

#______________________________________________
#
# SNMP Policies
#______________________________________________

snmp_policies = {
  "UCS-DEMO2" = {
    access_community_string = ""
    community_access        = ""
    description             = ""
    enabled                 = false
    engine_input_id         = ""
    organization            = "UCS-DEMO2"
    port                    = 161
    system_contact          = "Parlab Team (parlab@cisco.com)"
    system_location         = ""
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    trap_destinations       = []
    users                   = []
  }
}
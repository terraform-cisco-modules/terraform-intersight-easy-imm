#______________________________________________
#
# Link Control Policy Variables
#______________________________________________

link_control_policies = {
  "Asgard_linkctrl" = {
    admin_state  = "Enabled"
    description  = ""
    mode         = "normal"
    organization = "Asgard"
    tags         = []
  }
  "UCS-DEMO2" = {
    admin_state  = "Disabled"
    description  = ""
    mode         = "normal"
    organization = "UCS-DEMO2"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
  "test" = {
    admin_state  = "Enabled"
    description  = ""
    mode         = "aggressive"
    organization = "UCS-DEMO2"
    tags = [
      {
        key   = "easyucs_origin",
        value = "convert",
      },
      {
        key   = "easyucs_version",
        value = "0.9.8",
      },
    ]
  }
}

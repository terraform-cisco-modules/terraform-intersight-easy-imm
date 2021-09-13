#______________________________________________
#
# SD Card Policy Variables
#______________________________________________

sd_card_policies = {
  "Asgard_sdcard_m5" = {
    description        = ""
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = true
    enable_os          = true
    enable_scu         = true
    organization       = "Asgard"
    tags               = []
  }
  "vSAN-RAW" = {
    description  = ""
    enable_os    = true
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

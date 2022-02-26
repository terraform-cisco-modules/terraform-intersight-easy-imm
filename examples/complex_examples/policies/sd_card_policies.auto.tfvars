#______________________________________________
#
# SD Card Policy Variables
#______________________________________________

sd_card_policies = {
  "sdcard_m5" = {
    description        = ""
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = true
    enable_os          = true
    enable_scu         = true
    tags               = []
  }
  "vSAN-RAW" = {
    description = ""
    enable_os   = true
    tags        = []
  }
}

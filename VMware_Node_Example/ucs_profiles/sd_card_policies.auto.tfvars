#______________________________________________
#
# SD Card Policy Variables
#______________________________________________

sd_card_policies = {
  "#Organization#_sdcard_m5" = {
    description        = "#Organization# Blade SD Card Policy"
    enable_diagnostics = false
    enable_drivers     = false
    enable_huu         = false
    enable_os          = true
    enable_scu         = false
    organization       = "#Organization#"
    tags               = []
  }
}

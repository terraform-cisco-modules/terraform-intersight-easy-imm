#______________________________________________
#
# Virtual Media Policy Variables
#______________________________________________

virtual_media_policies = {
  "usb" = {
    description                     = "USB vMedia Policy."
    enabled                         = true
    enable_low_power_usb            = true
    enable_virtual_media_encryption = false
    tags                            = []
    vmedia_mappings                 = []
  }
  "ESXI7.0" = {
    description                     = "ESXi7.0 vMedia Policy."
    enable_low_power_usb            = false
    enable_virtual_media_encryption = false
    tags                            = []
    vmedia_mounts = [
      {
        device_type = "cdd",
        hostname    = "http.example.com",
        name        = "ESXI7.0",
        protocol    = "http",
        remote_file = "customesxi.iso",
        remote_path = "/",
        username    = "root"
      },
    ]
  }
}

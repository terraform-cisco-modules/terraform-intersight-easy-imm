#______________________________________________
#
# Storage Policy Variables
#______________________________________________

storage_policies = {
  "CEPH-BOOT" = {
    description        = ""
    global_hot_spares  = ""
    unused_disks_state = "NoChange"
    drive_group = {
      CEPH-BOOT = {
        manual_drive_group = {
          "dg0" = {
            drive_array_spans = {
              "span_0" = {
                slots = "1,2"
              }
            }
          }
        }
        raid_level = "Raid1"
        virtual_drives = {
          "BOOT" = {
            access_policy       = "Default"
            boot_drive          = false
            disk_cache          = "Default"
            expand_to_available = true
            read_policy         = "ReadAhead"
            size                = 0
            strip_size          = 64
            write_policy        = "WriteBackGoodBbu"
          }
        }
      },
    }
    m2_configuration                = {}
    single_drive_raid_configuration = {}
    tags                            = []
  }
}

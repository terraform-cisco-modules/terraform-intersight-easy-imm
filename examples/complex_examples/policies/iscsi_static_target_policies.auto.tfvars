#______________________________________________
#
# iSCSI Static Target Policy Variables
#______________________________________________

iscsi_static_target_policies = {
  "ESXI-OCB-POC_ISCSI-BOOT-A_1" = {
    description = ""
    ip_address  = "192.168.31.20"
    port        = 3260
    lun = [
      {
        bootable = true
        lun_id   = 0
      }
    ]
    target_name = "iqn.2010-01.com.solidfire:nb6q.ucs-boot-01.58"
    tags        = []
  }
  "ESXI-OCB-POC_ISCSI-BOOT-B_1" = {
    description = ""
    ip_address  = "192.168.31.20"
    port        = 3260
    lun = [
      {
        bootable = true
        lun_id   = 0
      }
    ]
    target_name = "iqn.2010-01.com.solidfire:nb6q.ucs-boot-01.58"
    tags        = []
  }
  "ESXI-VCF-WLD_ETH2-BOOT-iSCSI_1" = {
    description = ""
    ip_address  = "192.168.31.20"
    port        = 3260
    lun = [
      {
        bootable = true
        lun_id   = 0
      }
    ]
    target_name = "iqn.2010-01.com.solidfire:nb6q.ucs-boot-01.58"
    tags        = []
  }
  "ESXI-VCF-WLD_ETH3-BOOT-iSCSI_1" = {
    description = ""
    ip_address  = "192.168.31.20"
    port        = 3260
    lun = [
      {
        bootable = true
        lun_id   = 0
      }
    ]
    target_name = "iqn.2010-01.com.solidfire:nb6q.ucs-boot-01.58"
    tags        = []
  }
}

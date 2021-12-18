#______________________________________________
#
# UCS Server Profiles
#______________________________________________

ucs_server_profiles = {
  "aaa" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "aaa_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = "aaa_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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
  "esxi1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-OCB-POC"
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
  "esxi3" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "ISCSI"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "esxi3_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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
  "esxi8" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-ISCSI-AUTO"
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
  "ESXIVCF1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
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
  "ESXIVCF2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
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
  "ESXIVCF3" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
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
  "ESXIVCF4" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
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
  "ESXIWLD1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
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
  "ESXIWLD2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
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
  "ESXIWLD3" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
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
  "ipvtest" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "ipvtest"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "ipvtest_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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
  "test1" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "test1_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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
  "TEST-PLACEMENT" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "TEST-PLACEMENT_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = "TEST-PLACEMENT_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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
  "TEST-PLACEMENT-TEMPL-1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "TEST-PLACEMENT-TEMPLATE"
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
  "TEST-PLACEMENT-TEMPL-2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "TEST-PLACEMENT-TEMPLATE"
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
  "UPDATE" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_order_policy             = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = ""
    local_user_policy             = ""
    organization                  = "UCS-DEMO2"
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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

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
    san_connectivity_policy       = "aaa_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
  }
  "esxi1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-OCB-POC"
    tags                        = []
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
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
  }
  "esxi8" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-ISCSI-AUTO"
    tags                        = []
  }
  "ESXIVCF1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
    tags                        = []
  }
  "ESXIVCF2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
    tags                        = []
  }
  "ESXIVCF3" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
    tags                        = []
  }
  "ESXIVCF4" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD"
    tags                        = []
  }
  "ESXIWLD1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
    tags                        = []
  }
  "ESXIWLD2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
    tags                        = []
  }
  "ESXIWLD3" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "ESXI-VCF-WLD-FC"
    tags                        = []
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
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
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
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
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
    san_connectivity_policy       = "TEST-PLACEMENT_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
  }
  "TEST-PLACEMENT-TEMPL-1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "TEST-PLACEMENT-TEMPLATE"
    tags                        = []
  }
  "TEST-PLACEMENT-TEMPL-2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "TEST-PLACEMENT-TEMPLATE"
    tags                        = []
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
    san_connectivity_policy       = ""
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FIAttached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
    tags                          = []
  }
}

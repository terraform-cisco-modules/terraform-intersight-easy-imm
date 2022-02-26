#______________________________________________
#
# UCS Server Profiles
#______________________________________________

ucs_server_profiles = {
  "#server_profile1#" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = "Virtualization"
    boot_order_policy             = "M2"
    certificate_management_policy = ""
    description                   = "Server Profile."
    imc_access_policy             = "imc_access"
    ipmi_over_lan_policy          = "ipmi"
    lan_connectivity_policy       = "Virtualization"
    local_user_policy             = "local_users"
    san_connectivity_policy       = "Virtualzation"
    sd_card_policy                = ""
    serial_over_lan_policy        = "sol"
    snmp_policy                   = "snmp"
    storage_policy                = "storage"
    target_platform               = "FI-Attached"
    syslog_policy                 = "syslog"
    virtual_kvm_policy            = "vkvm"
    virtual_media_policy          = "ESXI7.0"
    tags                          = []
  }
  "#server_profile2#" = {
    action                      = "No-op"
    assign_server               = false
    description                 = "Server Profile - From Template."
    serial_number               = ""
    target_platform             = "FIAttached"
    ucs_server_profile_template = "Virtual_Template"
    tags                        = []
  }
}

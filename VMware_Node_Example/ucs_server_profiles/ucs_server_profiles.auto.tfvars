#______________________________________________
#
# UCS Server Profiles
#______________________________________________

ucs_server_profiles = {
  "esxi01" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = "#Organization#_Virtualization"
    boot_order_policy             = "#Organization#_M2"
    certificate_management_policy = ""
    description                   = "#Organization# esxi01 Server Profile."
    imc_access_policy             = "#Organization#_imc_access"
    ipmi_over_lan_policy          = "#Organization#_ipmi"
    lan_connectivity_policy       = "#Organization#_Virtualization"
    local_user_policy             = "#Organization#_local_users"
    organization                  = "#Organization#"
    san_connectivity_policy       = "#Organization#_Virtualzation"
    sd_card_policy                = ""
    serial_over_lan_policy        = "#Organization#_sol"
    snmp_policy                   = "#Organization#_snmp"
    storage_policy                = "#Organization#_storage"
    target_platform               = "FI-Attached"
    syslog_policy                 = "#Organization#_syslog"
    virtual_kvm_policy            = "#Organization#_vkvm"
    virtual_media_policy          = "#Organization#_ESXI7.0"
    tags                          = []
  }
  "esxi02" = {
    action                      = "No-op"
    assign_server               = false
    description                 = "#Organization# esxi02 Server Profile - From Template."
    organization                = "#Organization#"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "#Organization#_Virtual_Template"
    tags                        = []
  }
}

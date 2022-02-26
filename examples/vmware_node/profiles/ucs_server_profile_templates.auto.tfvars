#______________________________________________
#
# UCS Server Profile Template Variables
#______________________________________________

ucs_server_profile_templates = {
  "#template_name#" = {
    bios_policy                   = "Virtualization"
    boot_order_policy             = "M2"
    certificate_management_policy = ""
    description                   = "Virtual Host Template"
    imc_access_policy             = "imc_access"
    ipmi_over_lan_policy          = "ipmi"
    lan_connectivity_policy       = "Virtualization"
    local_user_policy             = "local_users"
    san_connectivity_policy       = "Virtualzation"
    sd_card_policy                = ""
    serial_over_lan_policy        = "sol"
    snmp_policy                   = "snmp"
    storage_policy                = "storage"
    target_platform               = "FIAttached"
    syslog_policy                 = "syslog"
    virtual_kvm_policy            = "vkvm"
    virtual_media_policy          = "ESXI7.0"
    tags                          = []
  }
}

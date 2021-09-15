#______________________________________________
#
# LDAP Policy Variables
#______________________________________________

ldap_policies = {
  "Asgard_ldap" = {
    description                     = ""
    ldap_attribute                  = "CiscoAvPair"
    ldap_base_dn                    = "dc=rich,dc=ciscolabs,dc=com"
    ldap_bind_dn                    = ""
    ldap_bind_method                = "LoginCredentials"
    ldap_domain                     = "rich.ciscolabs.com"
    ldap_enable_dns                 = false
    ldap_enable_encryption          = false
    ldap_enable_group_authorization = false
    ldap_enabled                    = true
    ldap_filter                     = "samAccountName"
    ldap_group_attribute            = ""
    ldap_groups = {
      "Lab_Admin" = {
        group_role = "admin"
      }
    }
    ldap_nested_group_search_depth = 128
    ldap_nr_source                 = "Extracted"
    ldap_search_domain             = ""
    ldap_search_forest             = ""
    ldap_servers = {
      "ad1" = {
        ldap_port   = 389
        ldap_server = "ad1.rich.ciscolabs.com"
      }
      "ad2" = {
        ldap_port   = 389
        ldap_server = "ad2.rich.ciscolabs.com"
      }
    }
    ldap_timeout                = 0
    ldap_user_search_precedence = "LocalUserDb"
    organization                = "Asgard"
    tags                        = []
  }
}

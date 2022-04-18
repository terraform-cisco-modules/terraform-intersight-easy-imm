identity_providers = ["Okta"]
organizations = {
  "Pod01" = {
    create_org = false
    groups = [
      {
        group_name_in_identity_provider = "iac101"
        identity_provider               = "Okta"
        name                            = "iac101"
        roles                           = ["Pod01_admin"]
      }
    ]
    roles = [
      {
        description = "Organization Pod01 Administrator Role."
        name        = "Pod01_admin"
        privileges  = ["Server Administrator", "UCS Domain Administrator"]
      }
    ]
  }
  "Pod02" = {
    create_org = true
    groups = [
      {
        group_name_in_identity_provider = "iac102"
        identity_provider               = "Okta"
        name                            = "iac102"
        roles                           = ["Pod02_admin"]
      }
    ]
    resource_groups = [
      {
        qualifier = "Allow-Selectors"
      }
    ]
    roles = [
      {
        description = "Organization Pod02 Administrator Role."
        name        = "Pod02_admin"
        privileges  = ["Server Administrator", "UCS Domain Administrator"]
      },
      {
        description = "Organization Pod02 Read-Only Role."
        name        = "Pod02_read"
        privileges  = ["Read-Only"]
      }
    ]
  }
}

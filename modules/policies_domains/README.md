# Intersight Management Mode Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

Run the plan from the Terraform cloud Workspace.

### SNMP User Variables

* auth_password:    Leave this as var.snmp_auth_password
* auth_type:        Either "MD5" or "SHA".
* name:             Name of the SNMP User
* privacy_password: Leave this as var.snmp_privacy_password
* privacy_type:     Privacy type will always be "AES".
* security_level:   Either "AuthPriv" or "AuthNoPriv".

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

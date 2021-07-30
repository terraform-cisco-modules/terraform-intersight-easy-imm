# Workspace and Variable Creation

## VERY IMPORTANT NOTE: The Terraform Cloud provider stores terraform state in plain text.  Do not remove the .gitignore that is protecting you from uploading the state files to a public repository in this base directory.  The rest of the modules don't have this same risk

## Obtain tokens and keys

Follow the base repository instructions to obtain values for the following variables:

### Terraform Cloud Variables

* terraform_cloud_token

  instructions: <https://www.terraform.io/docs/cloud/users-teams-organizations/api-tokens.html>

* tfc_oath_token

  instructions: <https://www.terraform.io/docs/cloud/vcs/index.html>

* tfc_organization (TFCB Organization Name)
* tfc_email (Must be an Email Assigned to the TFCB Account)
* agent_pool (The Name of the Agent Pool in the TFCB Account)
* vcs_repo (The Name of your Version Control Repository. i.e. CiscoDevNet/intersight-tfb-iks)

### Intersight Variables

* apikey
* secretkey

  instructions: <https://community.cisco.com/t5/data-center-documents/intersight-api-overview/ta-p/3651994>

### Import the Variables into your Environment before Running the Terraform Cloud Provider module(s) in this directory

Modify the terraform.tfvars file to the unique attributes of your environment

Once finished with the modification commit the changes to your reposotiry.

The Following examples are for a Linux based Operating System.  Note that the TF_VAR_ prefix is used as a notification to the terraform engine that the environment variable will be consumed by terraform.

* Terraform Cloud Variables

```bash
export TF_VAR_terraform_cloud_token="your_cloud_token"
export TF_VAR_tfc_oauth_token="your_oath_token"
```

* Intersight apikey and secretkey

```bash
export TF_VAR_apikey="your_api_key"
export TF_VAR_secretkey=`../../../../intersight_secretkey.txt`
```

### SNMP Secure Variables

Use the following environment variables based on your deployment for SNMP Settings

* SNMP User Attributes

```bash
export TF_VAR_snmp_user_1_auth_password="your_password"
export TF_VAR_snmp_user_1_privacy_password="your_password"
export TF_VAR_snmp_user_2_auth_password="your_password"
export TF_VAR_snmp_user_2_privacy_password="your_password"
```

* SNMP Communities

```bash
export TF_VAR_snmp_community="your_community"
export TF_VAR_trap_community="your_community"
```

### Execute the Terraform Plan

Once all Variables have been imported into your environment, run the plan in the tfe folder:

* Execute the Plan

```bash
terraform plan -out=main.plan
terraform apply main.plan
```

When run, this module will Create the Terraform Cloud Workspace(s) and Assign the Variables to the workspace(s).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.25.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_workspace_pools"></a> [workspace\_pools](#module\_workspace\_pools) | terraform-cisco-modules/modules/tfe//modules/tfc_workspace | n/a |
| <a name="module_workspace_pools_variables"></a> [workspace\_pools\_variables](#module\_workspace\_pools\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |
| <a name="module_workspaces_domain"></a> [workspaces\_domain](#module\_workspaces\_domain) | terraform-cisco-modules/modules/tfe//modules/tfc_workspace | n/a |
| <a name="module_workspaces_domain_variables"></a> [workspaces\_domain\_variables](#module\_workspaces\_domain\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |
| <a name="module_workspaces_domain_vlans"></a> [workspaces\_domain\_vlans](#module\_workspaces\_domain\_vlans) | terraform-cisco-modules/modules/tfe//modules/tfc_workspace | n/a |
| <a name="module_workspaces_domain_vlans_variables"></a> [workspaces\_domain\_vlans\_variables](#module\_workspaces\_domain\_vlans\_variables) | terraform-cisco-modules/modules/tfe//modules/tfc_variables | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_assign_domain"></a> [assign\_domain](#input\_assign\_domain) | Flag to Assign Policies to Domain or not. | `bool` | `false` | no |
| <a name="input_assign_switches"></a> [assign\_switches](#input\_assign\_switches) | Setting this Flag to True will Assign Switches to Profile. | `bool` | `false` | no |
| <a name="input_configure_fibre_channel"></a> [configure\_fibre\_channel](#input\_configure\_fibre\_channel) | Flag to Specify if Fibre-Channel should be configured. | `bool` | `false` | no |
| <a name="input_configure_snmp"></a> [configure\_snmp](#input\_configure\_snmp) | Flag to Specify if the SNMP Policy should be configured. | `bool` | `false` | no |
| <a name="input_configure_snmp_type"></a> [configure\_snmp\_type](#input\_configure\_snmp\_type) | When configuring SNMP, should the script use snmp communities or users.  Options are {snmp\_community\|snmp\_1\_user\|snmp\_2\_users}. | `string` | `"snmp_community"` | no |
| <a name="input_configure_syslog"></a> [configure\_syslog](#input\_configure\_syslog) | Flag to Specify if the Syslog Policy should be configured. | `bool` | `false` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_fc_pools_create"></a> [fc\_pools\_create](#input\_fc\_pools\_create) | Set this to True if you want to Create a Fibre-Channel Pool. | `bool` | `false` | no |
| <a name="input_fc_pools_map"></a> [fc\_pools\_map](#input\_fc\_pools\_map) | Intersight Fibre-Channel Pool Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_fc | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      id_blocks        = optional(list(map(string)))<br>      organization     = optional(string)<br>      pool_purpose     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "id_blocks": [<br>      {<br>        "from": "20:00:00:25:B5:0a:00:00",<br>        "to": "20:00:00:25:B5:0a:00:ff"<br>      }<br>    ],<br>    "organization": "default",<br>    "pool_purpose": "WWPN",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_ip_pools_create"></a> [ip\_pools\_create](#input\_ip\_pools\_create) | Set this to True if you want to Create an IP Pool. | `bool` | `false` | no |
| <a name="input_ip_pools_map"></a> [ip\_pools\_map](#input\_ip\_pools\_map) | Intersight IP Pool Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_ip | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      dns_servers_v4   = optional(set(string))<br>      dns_servers_v6   = optional(set(string))<br>      ipv4_block       = optional(list(map(string)))<br>      ipv4_config      = optional(list(map(string)))<br>      ipv6_block       = optional(list(map(string)))<br>      ipv6_config      = optional(list(map(string)))<br>      organization     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "dns_servers_v4": [<br>      "208.67.220.220",<br>      "208.67.222.222"<br>    ],<br>    "dns_servers_v6": [],<br>    "ipv4_block": [],<br>    "ipv4_config": [],<br>    "ipv6_block": [],<br>    "ipv6_config": [],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_iqn_pools_create"></a> [iqn\_pools\_create](#input\_iqn\_pools\_create) | Set this to True if you want to Create an IQN Pool. | `bool` | `false` | no |
| <a name="input_iqn_pools_map"></a> [iqn\_pools\_map](#input\_iqn\_pools\_map) | Intersight IQN Pool Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_iqn | <pre>map(object(<br>    {<br>      assignment_order  = optional(string)<br>      description       = optional(string)<br>      iqn_prefix        = optional(string)<br>      iqn_suffix_blocks = optional(list(map(string)))<br>      organization      = optional(string)<br>      tags              = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "iqn_prefix": "iqn.2021-11.com.cisco",<br>    "iqn_suffix_blocks": [<br>      {<br>        "pool_size": 255,<br>        "starting_iqn": 1,<br>        "suffix": "ucs-host"<br>      }<br>    ],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_mac_pools_create"></a> [mac\_pools\_create](#input\_mac\_pools\_create) | Set this to True if you want to Create an MAC Pool. | `bool` | `false` | no |
| <a name="input_mac_pools_map"></a> [mac\_pools\_map](#input\_mac\_pools\_map) | Intersight MAC Pool Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_mac | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      mac_blocks       = optional(list(map(string)))<br>      organization     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "mac_blocks": [<br>      {<br>        "from": "00:25:B5:0a:00:00",<br>        "to": "00:25:B5:0a:00:ff"<br>      }<br>    ],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_snmp_community"></a> [snmp\_community](#input\_snmp\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_snmp_trap_community"></a> [snmp\_trap\_community](#input\_snmp\_trap\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_snmp_user_1_auth_password"></a> [snmp\_user\_1\_auth\_password](#input\_snmp\_user\_1\_auth\_password) | Authorization password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_1_privacy_password"></a> [snmp\_user\_1\_privacy\_password](#input\_snmp\_user\_1\_privacy\_password) | Privacy password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_2_auth_password"></a> [snmp\_user\_2\_auth\_password](#input\_snmp\_user\_2\_auth\_password) | Authorization password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_2_privacy_password"></a> [snmp\_user\_2\_privacy\_password](#input\_snmp\_user\_2\_privacy\_password) | Privacy password for the user. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Key/Value Pairs to Assign as Attributes to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | Token to Authenticate to the Terraform Cloud. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform Target Version. | `string` | `"1.0.3"` | no |
| <a name="input_tfc_oauth_token"></a> [tfc\_oauth\_token](#input\_tfc\_oauth\_token) | Terraform Cloud OAuth Token for VCS\_Repo Integration. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_ucs_domain_profile"></a> [ucs\_domain\_profile](#input\_ucs\_domain\_profile) | Intersight UCS Domain Profile Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to these sources:<br>* https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/domain_profile_cluster<br>* https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/domain_profile_switch | <pre>map(object(<br>    {<br>      domain_action                      = optional(string)<br>      domain_description                 = optional(string)<br>      domain_descr_fi_a                  = optional(string)<br>      domain_descr_fi_b                  = optional(string)<br>      domain_policy_bucket               = optional(list(map(string)))<br>      domain_serial_a                    = optional(string)<br>      domain_serial_b                    = optional(string)<br>      dns_description                    = optional(string)<br>      dns_dynamic                        = optional(bool)<br>      dns_ipv6_enable                    = optional(bool)<br>      dns_servers_v4                     = optional(list(string))<br>      dns_servers_v6                     = optional(list(string))<br>      dns_update_domain                  = optional(string)<br>      flow_control_description           = optional(string)<br>      flow_control_mode                  = optional(string)<br>      flow_control_receive               = optional(string)<br>      flow_control_send                  = optional(string)<br>      link_agg_description               = optional(string)<br>      link_agg_lacp_rate                 = optional(string)<br>      link_agg_suspend_individual        = optional(bool)<br>      link_ctrl_description              = optional(string)<br>      link_ctrl_udld_admin_state         = optional(string)<br>      link_ctrl_udld_mode                = optional(string)<br>      multicast_description              = optional(string)<br>      multicast_querier_ip               = optional(string)<br>      multicast_querier_state            = optional(string)<br>      multicast_snooping_state           = optional(string)<br>      ntp_description                    = optional(string)<br>      ntp_servers                        = optional(list(string))<br>      ntp_timezone                       = optional(string)<br>      organization                       = optional(string)<br>      port_policy_a_description          = optional(string)<br>      port_policy_b_description          = optional(string)<br>      ports_device_model                 = optional(string)<br>      ports_fc_ports                     = optional(list(string))<br>      ports_fc_slot_id                   = optional(number)<br>      ports_lan_pc_breakoutswport        = optional(number)<br>      ports_lan_pc_ports                 = optional(list(string))<br>      ports_lan_pc_speed                 = optional(string)<br>      ports_lan_pc_slot_id               = optional(number)<br>      ports_san_fill_pattern             = optional(string)<br>      ports_san_pc_breakoutswport        = optional(number)<br>      ports_san_pc_ports                 = optional(list(string))<br>      ports_san_pc_speed                 = optional(string)<br>      ports_san_pc_slot_id               = optional(number)<br>      ports_servers                      = optional(string)<br>      qos_best_effort_admin_state        = optional(string)<br>      qos_best_effort_bandwidth          = optional(number)<br>      qos_best_effort_mtu                = optional(number)<br>      qos_best_effort_multicast_optimize = optional(bool)<br>      qos_best_effort_weight             = optional(number)<br>      qos_bronze_admin_state             = optional(string)<br>      qos_bronze_bandwidth               = optional(number)<br>      qos_bronze_cos                     = optional(number)<br>      qos_bronze_mtu                     = optional(number)<br>      qos_bronze_multicast_optimize      = optional(bool)<br>      qos_bronze_packet_drop             = optional(bool)<br>      qos_bronze_weight                  = optional(number)<br>      qos_description                    = optional(string)<br>      qos_fc_bandwidth                   = optional(number)<br>      qos_fc_weight                      = optional(number)<br>      qos_gold_admin_state               = optional(string)<br>      qos_gold_bandwidth                 = optional(number)<br>      qos_gold_cos                       = optional(number)<br>      qos_gold_mtu                       = optional(number)<br>      qos_gold_multicast_optimize        = optional(bool)<br>      qos_gold_packet_drop               = optional(bool)<br>      qos_gold_weight                    = optional(number)<br>      qos_platinum_admin_state           = optional(string)<br>      qos_platinum_bandwidth             = optional(number)<br>      qos_platinum_cos                   = optional(number)<br>      qos_platinum_mtu                   = optional(number)<br>      qos_platinum_multicast_optimize    = optional(bool)<br>      qos_platinum_packet_drop           = optional(bool)<br>      qos_platinum_weight                = optional(number)<br>      qos_silver_admin_state             = optional(string)<br>      qos_silver_bandwidth               = optional(number)<br>      qos_silver_cos                     = optional(number)<br>      qos_silver_mtu                     = optional(number)<br>      qos_silver_multicast_optimize      = optional(bool)<br>      qos_silver_packet_drop             = optional(bool)<br>      qos_silver_weight                  = optional(number)<br>      snmp_description                   = optional(string)<br>      snmp_system_contact                = optional(string)<br>      snmp_system_location               = optional(string)<br>      snmp_trap_destinations             = optional(list(map(string)))<br>      snmp_user_1_auth_type              = optional(string)<br>      snmp_user_1_name                   = optional(string)<br>      snmp_user_1_security_level         = optional(string)<br>      snmp_user_2_auth_type              = optional(string)<br>      snmp_user_2_name                   = optional(string)<br>      snmp_user_2_security_level         = optional(string)<br>      sw_ctrl_description                = optional(string)<br>      sw_ctrl_mac_aging_option           = optional(string)<br>      sw_ctrl_mac_aging_time             = optional(number)<br>      sw_ctrl_udld_message_interval      = optional(number)<br>      sw_ctrl_udld_recovery_action       = optional(string)<br>      sw_ctrl_vlan_optimization          = optional(bool)<br>      syslog_description                 = optional(string)<br>      syslog_destinations                = optional(list(map(string)))<br>      syslog_severity                    = optional(string)<br>      tags                               = optional(list(map(string)))<br>      vlan_description                   = optional(string)<br>      vlan_native                        = optional(number)<br>      vlan_list                          = optional(string)<br>      vsan_a_description                 = optional(string)<br>      vsan_b_description                 = optional(string)<br>      vsan_enable_trunking               = optional(bool)<br>      vsan_fabric_a                      = optional(number)<br>      vsan_fabric_a_fcoe                 = optional(string)<br>      vsan_fabric_b                      = optional(number)<br>      vsan_fabric_b_fcoe                 = optional(string)<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "dns_description": "",<br>    "dns_dynamic": false,<br>    "dns_ipv6_enable": false,<br>    "dns_servers_v4": [<br>      "208.67.220.220",<br>      "208.67.222.222"<br>    ],<br>    "dns_servers_v6": [],<br>    "dns_update_domain": "",<br>    "domain_action": "No-op",<br>    "domain_descr_fi_a": "",<br>    "domain_descr_fi_b": "",<br>    "domain_description": "",<br>    "domain_policy_bucket": [],<br>    "domain_serial_a": "",<br>    "domain_serial_b": "",<br>    "flow_control_description": "",<br>    "flow_control_mode": "auto",<br>    "flow_control_receive": "Disabled",<br>    "flow_control_send": "Disabled",<br>    "link_agg_description": "",<br>    "link_agg_lacp_rate": "normal",<br>    "link_agg_suspend_individual": false,<br>    "link_ctrl_description": "",<br>    "link_ctrl_udld_admin_state": "Enabled",<br>    "link_ctrl_udld_mode": "normal",<br>    "multicast_description": "",<br>    "multicast_querier_ip": "",<br>    "multicast_querier_state": "Disabled",<br>    "multicast_snooping_state": "Enabled",<br>    "ntp_description": "",<br>    "ntp_servers": [<br>      "time-a-g.nist.gov",<br>      "time-b-g.nist.gov"<br>    ],<br>    "ntp_timezone": "Etc/GMT",<br>    "organization": "default",<br>    "port_policy_a_description": "",<br>    "port_policy_b_description": "",<br>    "ports_device_model": "UCS-FI-6454",<br>    "ports_fc_ports": [<br>      1,<br>      4<br>    ],<br>    "ports_fc_slot_id": 1,<br>    "ports_lan_pc_breakoutswport": 0,<br>    "ports_lan_pc_ports": [<br>      49,<br>      50<br>    ],<br>    "ports_lan_pc_slot_id": 1,<br>    "ports_lan_pc_speed": "Auto",<br>    "ports_san_fill_pattern": "Arbff",<br>    "ports_san_pc_breakoutswport": 0,<br>    "ports_san_pc_ports": [<br>      1,<br>      2<br>    ],<br>    "ports_san_pc_slot_id": 1,<br>    "ports_san_pc_speed": "16Gbps",<br>    "ports_servers": "5-18",<br>    "qos_best_effort_admin_state": "Enabled",<br>    "qos_best_effort_bandwidth": 5,<br>    "qos_best_effort_mtu": 9216,<br>    "qos_best_effort_multicast_optimize": false,<br>    "qos_best_effort_weight": 1,<br>    "qos_bronze_admin_state": "Enabled",<br>    "qos_bronze_bandwidth": 5,<br>    "qos_bronze_cos": 1,<br>    "qos_bronze_mtu": 9216,<br>    "qos_bronze_multicast_optimize": false,<br>    "qos_bronze_packet_drop": true,<br>    "qos_bronze_weight": 1,<br>    "qos_description": "",<br>    "qos_fc_bandwidth": 39,<br>    "qos_fc_weight": 6,<br>    "qos_gold_admin_state": "Enabled",<br>    "qos_gold_bandwidth": 23,<br>    "qos_gold_cos": 4,<br>    "qos_gold_mtu": 9216,<br>    "qos_gold_multicast_optimize": false,<br>    "qos_gold_packet_drop": true,<br>    "qos_gold_weight": 4,<br>    "qos_platinum_admin_state": "Enabled",<br>    "qos_platinum_bandwidth": 23,<br>    "qos_platinum_cos": 5,<br>    "qos_platinum_mtu": 9216,<br>    "qos_platinum_multicast_optimize": false,<br>    "qos_platinum_packet_drop": false,<br>    "qos_platinum_weight": 4,<br>    "qos_silver_admin_state": "Enabled",<br>    "qos_silver_bandwidth": 5,<br>    "qos_silver_cos": 2,<br>    "qos_silver_mtu": 9216,<br>    "qos_silver_multicast_optimize": false,<br>    "qos_silver_packet_drop": true,<br>    "qos_silver_weight": 1,<br>    "snmp_description": "",<br>    "snmp_system_contact": "",<br>    "snmp_system_location": "",<br>    "snmp_trap_destinations": [],<br>    "snmp_user_1_auth_type": "SHA",<br>    "snmp_user_1_name": "snmp_user_1",<br>    "snmp_user_1_security_level": "AuthPriv",<br>    "snmp_user_2_auth_type": "SHA",<br>    "snmp_user_2_name": "snmp_user_2",<br>    "snmp_user_2_security_level": "AuthPriv",<br>    "sw_ctrl_description": "",<br>    "sw_ctrl_mac_aging_option": "Default",<br>    "sw_ctrl_mac_aging_time": 14500,<br>    "sw_ctrl_udld_message_interval": 15,<br>    "sw_ctrl_udld_recovery_action": "reset",<br>    "sw_ctrl_vlan_optimization": true,<br>    "syslog_description": "",<br>    "syslog_destinations": [],<br>    "syslog_severity": "warning",<br>    "tags": [],<br>    "vlan_description": "",<br>    "vlan_list": "2-3",<br>    "vlan_native": 1,<br>    "vsan_a_description": "",<br>    "vsan_b_description": "",<br>    "vsan_enable_trunking": false,<br>    "vsan_fabric_a": 100,<br>    "vsan_fabric_a_fcoe": "",<br>    "vsan_fabric_b": 200,<br>    "vsan_fabric_b_fcoe": ""<br>  }<br>}</pre> | no |
| <a name="input_uuid_pools_create"></a> [uuid\_pools\_create](#input\_uuid\_pools\_create) | Set this to True if you want to Create an MAC Pool. | `bool` | `false` | no |
| <a name="input_uuid_pools_map"></a> [uuid\_pools\_map](#input\_uuid\_pools\_map) | Intersight UUID Pool Variable Map.<br>1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ <br>2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_uuid | <pre>map(object(<br>    {<br>      assignment_order   = optional(string)<br>      description        = optional(string)<br>      organization       = optional(string)<br>      prefix             = optional(string)<br>      tags               = optional(list(map(string)))<br>      uuid_suffix_blocks = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "organization": "default",<br>    "prefix": "000025B5-0000-0000",<br>    "tags": [],<br>    "uuid_suffix_blocks": [<br>      {<br>        "from": "0000-000000000000",<br>        "size": 32768<br>      }<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Version Control System Repository. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_pools"></a> [workspace\_pools](#output\_workspace\_pools) | Terraform Cloud Intersight Pools Workspace ID and Name. |
| <a name="output_workspaces_domain"></a> [workspaces\_domain](#output\_workspaces\_domain) | Terraform Cloud UCS Domain Workspace IDs and Names. |
| <a name="output_workspaces_domain_vlans"></a> [workspaces\_domain\_vlans](#output\_workspaces\_domain\_vlans) | Terraform Cloud UCS Domain VLANs Workspace IDs and Names. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

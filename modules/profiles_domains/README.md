# Intersight UCS Domain Profiles Deployment Module

## Use this module to create UCS Domain Profiles in Intersight

## Usage

```hcl
module "profiles_domains" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/profiles_domains"

  # omitted...
}
```

This module will create UCS Domain Profiles in Intersight.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.12 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns"></a> [dns](#module\_dns) | terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity | n/a |
| <a name="module_flow_control"></a> [flow\_control](#module\_flow\_control) | terraform-cisco-modules/imm/intersight//modules/domain_flow_control | n/a |
| <a name="module_lan_uplink_port_channel_a"></a> [lan\_uplink\_port\_channel\_a](#module\_lan\_uplink\_port\_channel\_a) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel | n/a |
| <a name="module_lan_uplink_port_channel_b"></a> [lan\_uplink\_port\_channel\_b](#module\_lan\_uplink\_port\_channel\_b) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel | n/a |
| <a name="module_link_aggregation"></a> [link\_aggregation](#module\_link\_aggregation) | terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation | n/a |
| <a name="module_link_control"></a> [link\_control](#module\_link\_control) | terraform-cisco-modules/imm/intersight//modules/domain_link_control | n/a |
| <a name="module_ntp"></a> [ntp](#module\_ntp) | terraform-cisco-modules/imm/intersight//modules/policies_ntp | n/a |
| <a name="module_port_mode_a"></a> [port\_mode\_a](#module\_port\_mode\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_mode | n/a |
| <a name="module_port_mode_b"></a> [port\_mode\_b](#module\_port\_mode\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_mode | n/a |
| <a name="module_port_policy_a"></a> [port\_policy\_a](#module\_port\_policy\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_policy | n/a |
| <a name="module_port_policy_b"></a> [port\_policy\_b](#module\_port\_policy\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_policy | n/a |
| <a name="module_san_uplink_port_channel_a"></a> [san\_uplink\_port\_channel\_a](#module\_san\_uplink\_port\_channel\_a) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel | n/a |
| <a name="module_san_uplink_port_channel_b"></a> [san\_uplink\_port\_channel\_b](#module\_san\_uplink\_port\_channel\_b) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel | n/a |
| <a name="module_server_ports_a"></a> [server\_ports\_a](#module\_server\_ports\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_server | n/a |
| <a name="module_server_ports_b"></a> [server\_ports\_b](#module\_server\_ports\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_server | n/a |
| <a name="module_snmp_1_user"></a> [snmp\_1\_user](#module\_snmp\_1\_user) | terraform-cisco-modules/imm/intersight//modules/policies_snmp_1_user | n/a |
| <a name="module_snmp_2_users"></a> [snmp\_2\_users](#module\_snmp\_2\_users) | terraform-cisco-modules/imm/intersight//modules/policies_snmp_2_users | n/a |
| <a name="module_snmp_community"></a> [snmp\_community](#module\_snmp\_community) | terraform-cisco-modules/imm/intersight//modules/policies_snmp | n/a |
| <a name="module_switch_control"></a> [switch\_control](#module\_switch\_control) | terraform-cisco-modules/imm/intersight//modules/domain_switch_control | n/a |
| <a name="module_syslog"></a> [syslog](#module\_syslog) | terraform-cisco-modules/imm/intersight//modules/policies_syslog | n/a |
| <a name="module_system_qos_1"></a> [system\_qos\_1](#module\_system\_qos\_1) | terraform-cisco-modules/imm/intersight//modules/domain_system_qos | n/a |
| <a name="module_system_qos_2"></a> [system\_qos\_2](#module\_system\_qos\_2) | terraform-cisco-modules/imm/intersight//modules/domain_system_qos | n/a |
| <a name="module_ucs_domain_profile"></a> [ucs\_domain\_profile](#module\_ucs\_domain\_profile) | terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster | n/a |
| <a name="module_ucs_domain_profile_a"></a> [ucs\_domain\_profile\_a](#module\_ucs\_domain\_profile\_a) | terraform-cisco-modules/imm/intersight//modules/domain_profile_switch | n/a |
| <a name="module_ucs_domain_profile_b"></a> [ucs\_domain\_profile\_b](#module\_ucs\_domain\_profile\_b) | terraform-cisco-modules/imm/intersight//modules/domain_profile_switch | n/a |
| <a name="module_vlan_policy"></a> [vlan\_policy](#module\_vlan\_policy) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy | n/a |
| <a name="module_vsan_a"></a> [vsan\_a](#module\_vsan\_a) | terraform-cisco-modules/imm/intersight//modules/domain_vsan | n/a |
| <a name="module_vsan_b"></a> [vsan\_b](#module\_vsan\_b) | terraform-cisco-modules/imm/intersight//modules/domain_vsan | n/a |
| <a name="module_vsan_policy_a"></a> [vsan\_policy\_a](#module\_vsan\_policy\_a) | terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy | n/a |
| <a name="module_vsan_policy_b"></a> [vsan\_policy\_b](#module\_vsan\_policy\_b) | terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_network_element_summary.fi_a](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/network_element_summary) | data source |
| [intersight_network_element_summary.fi_b](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/network_element_summary) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"[\"default\"]"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_snmp_community"></a> [snmp\_community](#input\_snmp\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_snmp_trap_community"></a> [snmp\_trap\_community](#input\_snmp\_trap\_community) | The default SNMPv1, SNMPv2c community name or SNMPv3 username to include on any trap messages sent to the SNMP host. The name can be 18 characters long. | `string` | `""` | no |
| <a name="input_snmp_user_1_auth_password"></a> [snmp\_user\_1\_auth\_password](#input\_snmp\_user\_1\_auth\_password) | Authorization password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_1_privacy_password"></a> [snmp\_user\_1\_privacy\_password](#input\_snmp\_user\_1\_privacy\_password) | Privacy password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_2_auth_password"></a> [snmp\_user\_2\_auth\_password](#input\_snmp\_user\_2\_auth\_password) | Authorization password for the user. | `string` | `""` | no |
| <a name="input_snmp_user_2_privacy_password"></a> [snmp\_user\_2\_privacy\_password](#input\_snmp\_user\_2\_privacy\_password) | Privacy password for the user. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_ucs_domain_profile"></a> [ucs\_domain\_profile](#input\_ucs\_domain\_profile) | Please Refer to the ucs\_domain\_profile variable information in the tfe module.  In the domains module the variable is accepted as a string from terraform cloud in the terraform.auto.tfvars and extracted using locals. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assign_switches"></a> [assign\_switches](#output\_assign\_switches) | moid of the UCS Domain Profiles. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Intersight URL. |
| <a name="output_org_moids"></a> [org\_moids](#output\_org\_moids) | n/a |
| <a name="output_ucs_domain_profile"></a> [ucs\_domain\_profile](#output\_ucs\_domain\_profile) | moid of the UCS Domain Profiles. |
| <a name="output_ucs_domain_profile_a"></a> [ucs\_domain\_profile\_a](#output\_ucs\_domain\_profile\_a) | UCS Domain Profile - Fabric Interconnect A moids. |
| <a name="output_ucs_domain_profile_a_hardware"></a> [ucs\_domain\_profile\_a\_hardware](#output\_ucs\_domain\_profile\_a\_hardware) | Fabric Interconnect A Hardware Information. |
| <a name="output_ucs_domain_profile_b"></a> [ucs\_domain\_profile\_b](#output\_ucs\_domain\_profile\_b) | UCS Domain Profile - Fabric Interconnect B moids. |
| <a name="output_ucs_domain_profile_b_hardware"></a> [ucs\_domain\_profile\_b\_hardware](#output\_ucs\_domain\_profile\_b\_hardware) | Fabric Interconnect B Hardware Information. |
| <a name="output_vlan_policy"></a> [vlan\_policy](#output\_vlan\_policy) | moid of the UCS Domain VLAN Policies. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

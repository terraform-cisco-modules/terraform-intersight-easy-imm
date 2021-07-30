# Intersight Management Mode Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

Run the plan from the Terraform cloud Workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | 1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.11 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dns"></a> [dns](#module\_dns) | terraform-cisco-modules/imm/intersight//modules/policies_network_connectivity | n/a |
| <a name="module_domain_profile"></a> [domain\_profile](#module\_domain\_profile) | terraform-cisco-modules/imm/intersight//modules/domain_profile_cluster | n/a |
| <a name="module_domain_profile_a"></a> [domain\_profile\_a](#module\_domain\_profile\_a) | terraform-cisco-modules/imm/intersight//modules/domain_profile_switch | n/a |
| <a name="module_domain_profile_b"></a> [domain\_profile\_b](#module\_domain\_profile\_b) | terraform-cisco-modules/imm/intersight//modules/domain_profile_switch | n/a |
| <a name="module_flow_control"></a> [flow\_control](#module\_flow\_control) | terraform-cisco-modules/imm/intersight//modules/domain_flow_control | n/a |
| <a name="module_lan_uplink_port_channel_a"></a> [lan\_uplink\_port\_channel\_a](#module\_lan\_uplink\_port\_channel\_a) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel | n/a |
| <a name="module_lan_uplink_port_channel_b"></a> [lan\_uplink\_port\_channel\_b](#module\_lan\_uplink\_port\_channel\_b) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_lan_port_channel | n/a |
| <a name="module_link_aggregation"></a> [link\_aggregation](#module\_link\_aggregation) | terraform-cisco-modules/imm/intersight//modules/domain_link_aggregation | n/a |
| <a name="module_link_control"></a> [link\_control](#module\_link\_control) | terraform-cisco-modules/imm/intersight//modules/domain_link_control | n/a |
| <a name="module_multicast"></a> [multicast](#module\_multicast) | terraform-cisco-modules/imm/intersight//modules/domain_multicast | n/a |
| <a name="module_native_vlan"></a> [native\_vlan](#module\_native\_vlan) | ../../../terraform-intersight-imm/modules/domain_vlan | n/a |
| <a name="module_ntp"></a> [ntp](#module\_ntp) | terraform-cisco-modules/imm/intersight//modules/policies_ntp | n/a |
| <a name="module_port_mode_a"></a> [port\_mode\_a](#module\_port\_mode\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_mode | n/a |
| <a name="module_port_mode_b"></a> [port\_mode\_b](#module\_port\_mode\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_mode | n/a |
| <a name="module_port_policy_a"></a> [port\_policy\_a](#module\_port\_policy\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_policy | n/a |
| <a name="module_port_policy_b"></a> [port\_policy\_b](#module\_port\_policy\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_policy | n/a |
| <a name="module_san_uplink_port_channel_a"></a> [san\_uplink\_port\_channel\_a](#module\_san\_uplink\_port\_channel\_a) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel | n/a |
| <a name="module_san_uplink_port_channel_b"></a> [san\_uplink\_port\_channel\_b](#module\_san\_uplink\_port\_channel\_b) | terraform-cisco-modules/imm/intersight//modules/domain_uplink_san_port_channel | n/a |
| <a name="module_server_ports_a"></a> [server\_ports\_a](#module\_server\_ports\_a) | terraform-cisco-modules/imm/intersight//modules/domain_port_server | n/a |
| <a name="module_server_ports_b"></a> [server\_ports\_b](#module\_server\_ports\_b) | terraform-cisco-modules/imm/intersight//modules/domain_port_server | n/a |
| <a name="module_switch_control"></a> [switch\_control](#module\_switch\_control) | terraform-cisco-modules/imm/intersight//modules/domain_switch_control | n/a |
| <a name="module_system_qos_example"></a> [system\_qos\_example](#module\_system\_qos\_example) | ../../../terraform-intersight-imm/modules/domain_system_qos | n/a |
| <a name="module_vlan_list"></a> [vlan\_list](#module\_vlan\_list) | ../../../terraform-intersight-imm/modules/domain_vlan_list | n/a |
| <a name="module_vlan_policy"></a> [vlan\_policy](#module\_vlan\_policy) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy | n/a |
| <a name="module_vsan_a"></a> [vsan\_a](#module\_vsan\_a) | terraform-cisco-modules/imm/intersight//modules/domain_vsan | n/a |
| <a name="module_vsan_b"></a> [vsan\_b](#module\_vsan\_b) | terraform-cisco-modules/imm/intersight//modules/domain_vsan | n/a |
| <a name="module_vsan_policy_a"></a> [vsan\_policy\_a](#module\_vsan\_policy\_a) | terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy | n/a |
| <a name="module_vsan_policy_b"></a> [vsan\_policy\_b](#module\_vsan\_policy\_b) | terraform-cisco-modules/imm/intersight//modules/domain_vsan_policy | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_network_element_summary.fabric_interconnect_a](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.11/docs/data-sources/network_element_summary) | data source |
| [intersight_network_element_summary.fabric_interconnect_b](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.11/docs/data-sources/network_element_summary) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/1.0.11/docs/data-sources/organization_organization) | data source |
| [terraform_remote_state.global](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_profile"></a> [domain\_profile](#output\_domain\_profile) | moid of the IP Pool |
| <a name="output_model_a"></a> [model\_a](#output\_model\_a) | n/a |
| <a name="output_model_b"></a> [model\_b](#output\_model\_b) | n/a |
| <a name="output_moid_a"></a> [moid\_a](#output\_moid\_a) | n/a |
| <a name="output_moid_b"></a> [moid\_b](#output\_moid\_b) | n/a |
| <a name="output_serial_a"></a> [serial\_a](#output\_serial\_a) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

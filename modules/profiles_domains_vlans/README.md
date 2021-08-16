# Intersight UCS VLAN Policy Deployment Module

## Use this module to Assign VLANs to a VLAN Policy in Intersight

## Usage

```hcl
module "profiles_domains_vlans" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/profiles_domains_vlans"

  # omitted...
}
```

This module will Create a Multicast Policy and assign it to VLANs in a VLAN policy.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.12 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_policies_multicast"></a> [policies\_multicast](#module\_policies\_multicast) | terraform-cisco-modules/imm/intersight//modules/domain_multicast | n/a |
| <a name="module_policies_vlan"></a> [policies\_vlan](#module\_policies\_vlan) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_policy | n/a |
| <a name="module_policies_vlan_list"></a> [policies\_vlan\_list](#module\_policies\_vlan\_list) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_list | n/a |
| <a name="module_policies_vlan_map"></a> [policies\_vlan\_map](#module\_policies\_vlan\_map) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_map | n/a |
| <a name="module_policies_vlan_native"></a> [policies\_vlan\_native](#module\_policies\_vlan\_native) | terraform-cisco-modules/imm/intersight//modules/domain_vlan | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [terraform_remote_state.domain](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_policies_multicast"></a> [policies\_multicast](#input\_policies\_multicast) | key - Name of the Multicast Policy.<br>* description - Description to Assign to the Policy.<br>* organization - Name of the Intersight Organization to assign this Policy to.<br>  - https://intersight.com/an/settings/organizations/<br>* querier\_ip - IP Address of the IGMP Querier to Assign to the VLAN through this Policy.<br>* querier\_state - Administrative state of the IGMP Querier for the VLANs Assigned to this Policy.  Options are:<br>  - Disabled - (Default)<br>  - Enabled<br>* snooping\_state - Administrative State for Snooping for the VLANs Assigned to this Policy.<br>  - Disabled<br>  - Enabled - (Default)<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Policy. | <pre>map(object(<br>    {<br>      description    = optional(string)<br>      organization   = optional(string)<br>      querier_ip     = optional(string)<br>      querier_state  = optional(string)<br>      snooping_state = optional(string)<br>      tags           = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "description": "",<br>    "organization": "default",<br>    "querier_ip": "",<br>    "querier_state": "Disabled",<br>    "snooping_state": "Enabled",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_policies_vlan"></a> [policies\_vlan](#input\_policies\_vlan) | key - Name of the VLAN Policy.<br>* auto\_allow\_on\_uplinks =<br>* description - Description to Assign to the Policy.<br>* multicast\_policy - Name of the Multicast Policy to Assign to the VLAN Group.<br>* organization - Name of the Intersight Organization to assign this Policy to.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Policy.<br>* vlan\_list - List of VLANs to assign to the VLAN Policy.  The VLAN list will use the vlan\_prefix-vl{vlan\_id} as the name of the vlan.<br>* vlan\_map - This VLAN Map should contain key/value pairs of prefix and vlan\_id.  In Example:<br>vlan\_map = [<br>  {<br>    prefix  = "test"<br>    vlan\_id = 123<br>  },<br>  {<br>    prefix  = "test"<br>    vlan\_id = 124<br>  }<br>]<br>This will be configured as test-vl0123 and test-vl0124 in intersight.<br>* vlan\_native - The Native VLAN to assign to the policy.<br>* vlan\_prefix - Prefix to Assign to the VLANs in the VLAN Map. | <pre>map(object(<br>    {<br>      auto_allow_on_uplinks = optional(bool)<br>      description           = optional(string)<br>      multicast_policy      = string<br>      organization          = optional(string)<br>      tags                  = optional(list(map(string)))<br>      vlan_list             = optional(string)<br>      vlan_map              = optional(list(map(string)))<br>      vlan_native           = optional(number)<br>      vlan_prefix           = optional(string)<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "auto_allow_on_uplinks": true,<br>    "description": "",<br>    "multicast_policy": "",<br>    "organization": "default",<br>    "tags": [],<br>    "vlan_list": null,<br>    "vlan_map": [],<br>    "vlan_native": null,<br>    "vlan_prefix": "{organization}"<br>  }<br>}</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Key/Value Pairs to Assign as Attributes to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_ws_domain"></a> [ws\_domain](#input\_ws\_domain) | Name of the domain workspace. | `string` | `"Kubernetes_Policies"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

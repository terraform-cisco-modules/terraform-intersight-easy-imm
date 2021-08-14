# profiles_domains_vlans - Intersight UCS Domain Profiles Deployment Module

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
| <a name="module_multicast_policy"></a> [multicast\_policy](#module\_multicast\_policy) | terraform-cisco-modules/imm/intersight//modules/domain_multicast | n/a |
| <a name="module_vlan_policy"></a> [vlan\_policy](#module\_vlan\_policy) | terraform-cisco-modules/imm/intersight//modules/domain_vlan_list | n/a |
| <a name="module_vlan_policy_native"></a> [vlan\_policy\_native](#module\_vlan\_policy\_native) | terraform-cisco-modules/imm/intersight//modules/domain_vlan | n/a |

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
| <a name="input_multicast_policy"></a> [multicast\_policy](#input\_multicast\_policy) | key - Name of the Power Policy.<br>* description - Description to Assign to the Policy.<br>* organization - Name of the Intersight Organization to assign this Policy to.<br>  - https://intersight.com/an/settings/organizations/<br>* querier\_ip - IP Address of the IGMP Querier to Assign to the VLAN through this Policy.<br>* querier\_state - Administrative state of the IGMP Querier for the VLANs Assigned to this Policy.  Options are:<br>  - Disabled - (Default)<br>  - Enabled<br>* snooping\_state - Administrative State for Snooping for the VLANs Assigned to this Policy.<br>  - Disabled<br>  - Enabled - (Default)<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Policy. | <pre>map(object(<br>    {<br>      description    = optional(string)<br>      organization   = optional(string)<br>      querier_ip     = optional(string)<br>      querier_state  = optional(string)<br>      snooping_state = optional(string)<br>      tags           = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "description": "",<br>    "organization": "default",<br>    "querier_ip": "",<br>    "querier_state": "Disabled",<br>    "snooping_state": "Enabled",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Key/Value Pairs to Assign as Attributes to the Policy. | `list(map(string))` | `[]` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_vlan_lists"></a> [vlan\_lists](#input\_vlan\_lists) | key - Name of the Power Policy.<br>* multicast\_policy - Name of the Multicast Policy to Assign to the VLAN Group.<br>* vlan\_list - List of VLANs to assign to the VLAN Policy.<br>* vlan\_native - The Native VLAN to assign to the policy.<br>* vlan\_policy - Name of the VLAN Policy<br>* vlan\_prefix - Prefix to Assign to the VLANs in the VLAN Map. | <pre>map(object(<br>    {<br>      multicast_policy = string<br>      vlan_list        = string<br>      vlan_native      = optional(number)<br>      vlan_policy      = string<br>      vlan_prefix      = optional(string)<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "multicast_policy": "",<br>    "vlan_list": null,<br>    "vlan_native": null,<br>    "vlan_policy": null,<br>    "vlan_prefix": ""<br>  }<br>}</pre> | no |
| <a name="input_ws_domain"></a> [ws\_domain](#input\_ws\_domain) | Name of the domain workspace. | `string` | `"Kubernetes_Policies"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

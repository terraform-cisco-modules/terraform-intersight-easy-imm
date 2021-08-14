# pools - Intersight Management Mode IP Pool Deployment Module

## Use this module to create IMM Domain Profiles in Intersight

## Usage

```hcl
module "pools" {

  source = "terraform-cisco-modules/easy-imm/intersight//modules/pools"

  # omitted...
}
```

This module will create Pool resources in Intersight.  These pools can be assigned to Policies and Profiles.  

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.11 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fc_pools"></a> [fc\_pools](#module\_fc\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_fc | n/a |
| <a name="module_ip_pools"></a> [ip\_pools](#module\_ip\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_ip | n/a |
| <a name="module_iqn_pools"></a> [iqn\_pools](#module\_iqn\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_iqn | n/a |
| <a name="module_mac_pools"></a> [mac\_pools](#module\_mac\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_mac | n/a |
| <a name="module_uuid_pools"></a> [uuid\_pools](#module\_uuid\_pools) | terraform-cisco-modules/imm/intersight//modules/pools_uuid | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_fc_pools"></a> [fc\_pools](#input\_fc\_pools) | key - Name of the Fibre-Channel Pool.<br>* Assignment order decides the order in which the next identifier is allocated.<br>  - default - Assignment order is decided by the system - Default value.<br>  - sequential - Identifiers are assigned in a sequential order.<br>* description - Description to Assign to the Pool.<br>* id\_blocks - Map of Addresses to Assign to the Pool.<br>  - from - staring WWxN Address.  Default is "20:00:00:25:B5:0a:00:00".<br>  - to - ending WWxN Address.  Default is "20:00:00:25:B5:0a:00:ff".<br>* pool\_purpose - What type of Fiber-Channel Pool is this.  Options are:<br>  - WWNN<br>  - WWPN - (Default).<br>* organization - Name of the Intersight Organization to assign this pool to.  Default is default.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Pool. | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      id_blocks        = optional(list(map(string)))<br>      organization     = optional(string)<br>      pool_purpose     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "id_blocks": [<br>      {<br>        "from": "20:00:00:25:B5:0a:00:00",<br>        "to": "20:00:00:25:B5:0a:00:ff"<br>      }<br>    ],<br>    "organization": "default",<br>    "pool_purpose": "WWPN",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_ip_pools"></a> [ip\_pools](#input\_ip\_pools) | key - Name of the IP Pool.<br>* Assignment order decides the order in which the next identifier is allocated.<br>  - default - (Default) Assignment order is decided by the system.<br>  - sequential - Identifiers are assigned in a sequential order.<br>* description - Description to Assign to the Pool.<br>* dns\_server\_v4 - IPv4 DNS Servers to assign to the IP Pool.  Default is ["208.67.220.220", "208.67.222.222"].<br>* dns\_server\_v6 - IPv6 DNS Servers to assign to the IP Pool.<br>* ipv4\_block - Map of Addresses to Assign to the Pool.<br>  - pool\_size - Size of the IPv4 Address Block.<br>  - starting\_ip - Starting IPv4 Address.<br>* ipv4\_config - IPv4 Configuration to assign to the ipv4\_blocks.<br>  - gateway - Gateway to assign to the pool.<br>  - netmask - Netmask to assign to the pool.<br>* ipv6\_block - Map of Addresses to Assign to the Pool.<br>  - pool\_size - Size of the IPv6 Address Block.<br>  - starting\_ip - Starting IPv6 Address.<br>* ipv6\_config - IPv4 Configuration to assign to the ipv4\_blocks.<br>  - gateway - Gateway to assign to the pool.<br>  - netmask - Netmask to assign to the pool.<br>* organization - Name of the Intersight Organization to assign this pool to.  Default is default.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Pool. | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      dns_servers_v4   = optional(set(string))<br>      dns_servers_v6   = optional(set(string))<br>      ipv4_block       = optional(list(map(string)))<br>      ipv4_config      = optional(list(map(string)))<br>      ipv6_block       = optional(list(map(string)))<br>      ipv6_config      = optional(list(map(string)))<br>      organization     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "dns_servers_v4": [<br>      "208.67.220.220",<br>      "208.67.222.222"<br>    ],<br>    "dns_servers_v6": [],<br>    "ipv4_block": [],<br>    "ipv4_config": [],<br>    "ipv6_block": [],<br>    "ipv6_config": [],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_iqn_pools"></a> [iqn\_pools](#input\_iqn\_pools) | key - Name of the IQN Pool.<br>* Assignment order decides the order in which the next identifier is allocated.<br>  - default - (Default) Assignment order is decided by the system.<br>  - sequential - Identifiers are assigned in a sequential order.<br>* description - Description to Assign to the Pool.<br>* iqn\_prefix - The prefix for IQN blocks created for this pool.  The default is "iqn.2021-11.com.cisco".<br>* iqn\_suffix\_blocks - Map of Addresses to Assign to the Pool.<br>  - pool\_size - staring WWxN Address.  Default is 255.<br>  - starting\_iqn - ending WWxN Address.  Default is 01.<br>  - suffix - Suffix to assign to the IQN Pool.  Default is "ucs-host".<br>* pool\_purpose - What type of Fiber-Channel Pool is this.  Options are:<br>  - WWNN<br>  - WWPN -(Default).<br>* organization - Name of the Intersight Organization to assign this pool to.  Default is default.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Pool. | <pre>map(object(<br>    {<br>      assignment_order  = optional(string)<br>      description       = optional(string)<br>      iqn_prefix        = optional(string)<br>      iqn_suffix_blocks = optional(list(map(string)))<br>      organization      = optional(string)<br>      tags              = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "iqn_prefix": "iqn.2021-11.com.cisco",<br>    "iqn_suffix_blocks": [<br>      {<br>        "pool_size": 255,<br>        "starting_iqn": 1,<br>        "suffix": "ucs-host"<br>      }<br>    ],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_mac_pools"></a> [mac\_pools](#input\_mac\_pools) | key - Name of the MAC Pool.<br>* Assignment order decides the order in which the next identifier is allocated.<br>  - default - (Default) Assignment order is decided by the system.<br>  - sequential - Identifiers are assigned in a sequential order.<br>* description - Description to Assign to the Pool.<br>* mac\_blocks - Map of Addresses to Assign to the Pool.<br>  - from - staring MAC Address.  Default is "00:25:B5:0a:00:00".<br>  - to - ending MAC Address.  Default is "00:25:B5:0a:00:ff".<br>* organization - Name of the Intersight Organization to assign this pool to.  Default is default.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Pool. | <pre>map(object(<br>    {<br>      assignment_order = optional(string)<br>      description      = optional(string)<br>      mac_blocks       = optional(list(map(string)))<br>      organization     = optional(string)<br>      tags             = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "mac_blocks": [<br>      {<br>        "from": "00:25:B5:0a:00:00",<br>        "to": "00:25:B5:0a:00:ff"<br>      }<br>    ],<br>    "organization": "default",<br>    "tags": []<br>  }<br>}</pre> | no |
| <a name="input_organizations"></a> [organizations](#input\_organizations) | Intersight Organization Names to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `list(map(string))` | `[]` | no |
| <a name="input_uuid_pools"></a> [uuid\_pools](#input\_uuid\_pools) | key - Name of the UUID Pool.<br>* Assignment order decides the order in which the next identifier is allocated.<br>  - default - (Default) Assignment order is decided by the system.<br>  - sequential - Identifiers are assigned in a sequential order.<br>* description - Description to Assign to the Pool.<br>* prefix - Prefix to assign to the UUID Pool..  The default is "000025B5-0000-0000".<br>* uuid\_suffix\_blocks - Map of Addresses to Assign to the Pool.<br>  - from - Starting UUID Address.  Default is "0000-000000000000".<br>  - size - Size of UUID Pool.  Default is "32768".<br>* organization - Name of the Intersight Organization to assign this pool to.  Default is default.<br>  - https://intersight.com/an/settings/organizations/<br>* tags - List of Key/Value Pairs to Assign as Attributes to the Pool. | <pre>map(object(<br>    {<br>      assignment_order   = optional(string)<br>      description        = optional(string)<br>      organization       = optional(string)<br>      prefix             = optional(string)<br>      tags               = optional(list(map(string)))<br>      uuid_suffix_blocks = optional(list(map(string)))<br>    }<br>  ))</pre> | <pre>{<br>  "default": {<br>    "assignment_order": "default",<br>    "description": "",<br>    "organization": "default",<br>    "prefix": "000025B5-0000-0000",<br>    "tags": [],<br>    "uuid_suffix_blocks": [<br>      {<br>        "from": "0000-000000000000",<br>        "size": 32768<br>      }<br>    ]<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fc_pools"></a> [fc\_pools](#output\_fc\_pools) | moid of the Fibre-Channel Pools. |
| <a name="output_ip_pools"></a> [ip\_pools](#output\_ip\_pools) | moid of the IP Pools. |
| <a name="output_iqn_pools"></a> [iqn\_pools](#output\_iqn\_pools) | moid of the IQN Pools. |
| <a name="output_mac_pools"></a> [mac\_pools](#output\_mac\_pools) | moid of the MAC Pools. |
| <a name="output_uuid_pools"></a> [uuid\_pools](#output\_uuid\_pools) | moid of the UUID Pools. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Global Variables Workspace

## Use this module to create Global Variales consumed by the IKS workspaces

Run the plan from the Terraform cloud workspace for the Given Workspace.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons_list"></a> [addons\_list](#input\_addons\_list) | List of Add-ons for Intersight Kubernetes Service.  Add-ons Options are {ccp-monitor\|kubernetes-dashboard}. | `list(string)` | `[]` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Intersight Kubernetes Service Cluster Name. | `string` | `"iks"` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of DNS Server(s) for Kubernetes System Configuration Policy and IP Pool. | `list(string)` | <pre>[<br>  "10.200.0.100"<br>]</pre> | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain Name for Kubernetes Sysconfig Policy. | `string` | `"demo.intra"` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_ip_pool"></a> [ip\_pool](#input\_ip\_pool) | Intersight Kubernetes Service IP Pool.  Default name is {cluster\_name}\_ip\_pool | `string` | `""` | no |
| <a name="input_ip_pool_from"></a> [ip\_pool\_from](#input\_ip\_pool\_from) | IP Pool Starting IP last Octet.  The var.network\_prefix will be combined with ip\_pool\_from for the Starting Address. | `string` | `"20"` | no |
| <a name="input_ip_pool_gateway"></a> [ip\_pool\_gateway](#input\_ip\_pool\_gateway) | IP Pool Gateway last Octet.  The var.network\_prefix will be combined with ip\_pool\_gateway for the Gateway Address. | `string` | `"254"` | no |
| <a name="input_ip_pool_netmask"></a> [ip\_pool\_netmask](#input\_ip\_pool\_netmask) | IP Pool Netmask. | `string` | `"255.255.255.0"` | no |
| <a name="input_ip_pool_size"></a> [ip\_pool\_size](#input\_ip\_pool\_size) | IP Pool Block Size. | `string` | `"30"` | no |
| <a name="input_k8s_addon_policy"></a> [k8s\_addon\_policy](#input\_k8s\_addon\_policy) | Kubernetes Runtime Policy Name.  Default name is {cluster\_name}-runtime. | `string` | `""` | no |
| <a name="input_k8s_runtime_policy"></a> [k8s\_runtime\_policy](#input\_k8s\_runtime\_policy) | Kubernetes Runtime Policy Name.  Default name is {cluster\_name}-runtime. | `string` | `""` | no |
| <a name="input_k8s_trusted_registry"></a> [k8s\_trusted\_registry](#input\_k8s\_trusted\_registry) | Kubernetes Trusted Registry Policy Name.  Default name is {cluster\_name}-registry. | `string` | `""` | no |
| <a name="input_k8s_version_policy"></a> [k8s\_version\_policy](#input\_k8s\_version\_policy) | Kubernetes Version Policy Name.  Default name is {cluster\_name}-k8s-version. | `string` | `""` | no |
| <a name="input_k8s_vm_infra_policy"></a> [k8s\_vm\_infra\_policy](#input\_k8s\_vm\_infra\_policy) | Kubernetes Virtual Machine Infrastructure Configuration Policy.  Default name is {cluster\_name}-vm-infra-config. | `string` | `""` | no |
| <a name="input_k8s_vm_network_policy"></a> [k8s\_vm\_network\_policy](#input\_k8s\_vm\_network\_policy) | Kubernetes Network/System Configuration Policy (CIDR, dns, ntp, etc.).  Default name is {cluster\_name}-sysconfig. | `string` | `""` | no |
| <a name="input_network_prefix"></a> [network\_prefix](#input\_network\_prefix) | Network Prefix to Assign to DNS/NTP Servers & vCenter Target default values. | `string` | `"10.200.0"` | no |
| <a name="input_ntp_servers"></a> [ntp\_servers](#input\_ntp\_servers) | List of NTP Server for Kubernetes System Configuration Policy.  If undefined then the dns\_servers will be used. | `list(string)` | `[]` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization. | `string` | `"default"` | no |
| <a name="input_proxy_http_hostname"></a> [proxy\_http\_hostname](#input\_proxy\_http\_hostname) | HTTP Proxy Server Name or IP Address. | `string` | `""` | no |
| <a name="input_proxy_http_username"></a> [proxy\_http\_username](#input\_proxy\_http\_username) | HTTP Proxy Username. | `string` | `""` | no |
| <a name="input_proxy_https_hostname"></a> [proxy\_https\_hostname](#input\_proxy\_https\_hostname) | HTTPS Proxy Server Name or IP Address. | `string` | `""` | no |
| <a name="input_proxy_https_username"></a> [proxy\_https\_username](#input\_proxy\_https\_username) | HTTPS Proxy Username. | `string` | `""` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Timezone for Kubernetes Sysconfig Policy. | `string` | `"America/New_York"` | no |
| <a name="input_vsphere_target"></a> [vsphere\_target](#input\_vsphere\_target) | vSphere Server registered as a Target in Intersight.  The default, 210, only works if this is for the DevNet Sandbox. | `string` | `"210"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_addons_list"></a> [addons\_list](#output\_addons\_list) | List of Add-ons for Policy Creation. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Intersight Kubernetes Service Cluster Name. |
| <a name="output_dns_servers"></a> [dns\_servers](#output\_dns\_servers) | List of DNS Server(s) for Kubernetes System Configuration Policy and IP Pool. |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Domain Name. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Intersight URL. |
| <a name="output_ip_pool"></a> [ip\_pool](#output\_ip\_pool) | IP Pool Policy Name. |
| <a name="output_ip_pool_from"></a> [ip\_pool\_from](#output\_ip\_pool\_from) | IP Pool Starting IP Value. |
| <a name="output_ip_pool_gateway"></a> [ip\_pool\_gateway](#output\_ip\_pool\_gateway) | IP Pool Gateway Value. |
| <a name="output_ip_pool_netmask"></a> [ip\_pool\_netmask](#output\_ip\_pool\_netmask) | IP Pool Netmask Value. |
| <a name="output_ip_pool_size"></a> [ip\_pool\_size](#output\_ip\_pool\_size) | IP Pool Block Size. |
| <a name="output_k8s_addon_policy"></a> [k8s\_addon\_policy](#output\_k8s\_addon\_policy) | Kubernetes Trusted Registry Policy Name. |
| <a name="output_k8s_runtime_policy"></a> [k8s\_runtime\_policy](#output\_k8s\_runtime\_policy) | Kubernetes Trusted Registry Policy Name. |
| <a name="output_k8s_trusted_registry"></a> [k8s\_trusted\_registry](#output\_k8s\_trusted\_registry) | Kubernetes Trusted Registry Policy Name. |
| <a name="output_k8s_version_policy"></a> [k8s\_version\_policy](#output\_k8s\_version\_policy) | Kubernetes Version Policy Name. |
| <a name="output_k8s_vm_infra_policy"></a> [k8s\_vm\_infra\_policy](#output\_k8s\_vm\_infra\_policy) | Kubernetes VM Infrastructure Policy Name. |
| <a name="output_k8s_vm_network_policy"></a> [k8s\_vm\_network\_policy](#output\_k8s\_vm\_network\_policy) | Kubernetes VM Network Policy Name. |
| <a name="output_ntp_servers"></a> [ntp\_servers](#output\_ntp\_servers) | List of NTP Server for Kubernetes System Configuration Policy.  If undefined then the dns\_servers will be used. |
| <a name="output_organization"></a> [organization](#output\_organization) | Intersight Organization Name. |
| <a name="output_proxy_http_hostname"></a> [proxy\_http\_hostname](#output\_proxy\_http\_hostname) | HTTP Proxy Server Name or IP Address. |
| <a name="output_proxy_http_username"></a> [proxy\_http\_username](#output\_proxy\_http\_username) | HTTP Proxy Username. |
| <a name="output_proxy_https_hostname"></a> [proxy\_https\_hostname](#output\_proxy\_https\_hostname) | HTTPS Proxy Server Name or IP Address.  If Left blank, and proxy\_http\_hostname is defined, it will be copied to here. |
| <a name="output_proxy_https_username"></a> [proxy\_https\_username](#output\_proxy\_https\_username) | HTTPS Proxy Username. |
| <a name="output_timezone"></a> [timezone](#output\_timezone) | Timezone. |
| <a name="output_vsphere_target"></a> [vsphere\_target](#output\_vsphere\_target) | vSphere Target. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

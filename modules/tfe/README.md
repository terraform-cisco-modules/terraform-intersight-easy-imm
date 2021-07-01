# Workspace and Variable Creation

## VERY IMPORTANT NOTE: This provider stores terraform state in plain text.  Do not remove the .gitignore that is protecting you from uploading the state files

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

### When assigning the vSphere Password - It Must match the password used to register the Target in Intersight

* vsphere_password

### Generate SSH Key

* ssh_key (Note this must be a ecdsa key type)

  instructions: <https://www.ssh.com/academy/ssh/keygen>

### Import the Variables into your Environment before Running the Terraform Cloud Provider module(s) in this directory

The Following examples are for a Linux based Operating System.  Note that the TF_VAR_ prefix is used as a notification to the terraform engine that the environment variable will be consumed by terraform.

* Terraform Cloud Variables

```bash
export TF_VAR_terraform_cloud_token="your_cloud_token"
export TF_VAR_tfc_oath_token="your_oath_token"
export TF_VAR_tfc_email="your_email"
export TF_VAR_agent_pool="your_agent_pool_name"
export TF_VAR_vcs_repo="your_vcs_repo"
```

* Intersight Variables

```bash
export TF_VAR_apikey="your_api_key"
export TF_VAR_secretkey="your_secret_key"
```

* Global Variables
  Refer to explanation below on the purpose of the network_prefix variable

```bash
export TF_VAR_network_prefix="10.200.0"
```

* vSphere Variables

```bash
export TF_VAR_vsphere_password="your_vshpere_password"
```

* Kubernetes Cluster Variables

```bash
export TF_VAR_ssh_key="your_ssh_key"
```

* Kubernetes Cluster Add-ons Variables

If you want to add both Add-ons that are supported today {ccp-monitor|kubernetes-dashboard} use the following list:

```bash
export TF_VAR_addons_list="[\"ccp-monitor\", \"kubernetes-dashboard\"]"
```

You can also just include one or the other add-ons.

## Optional Variables

Below are additional variables that have been assigned default values already.  Confirm anything that needs to change for your environment.  The default values are shown below.

* Terraform Cloud Default Variables

```bash
export TF_VAR_tfc_organization="CiscoDevNet"
export TF_VAR_terraform_version="1.0.0"
```

* Intersight Default Variables

```bash
export TF_VAR_organization="default"
```

* Kubernetes Cluster and Policies Default Variables

    To help simplify the number of variables that are required, the following manipulation rules have been added to the global_vars.

    network_prefix function ip_pool_gateway, ip_pool_from, and vsphere_target:

    The default value is shown below.  For Example with vsphere_target showing the IPv4 last octet of 210.

    This is combined with the network_prefix to become 10.200.0.210.  

    This combine function works with the following variables:

    ip_pool_gateway

    ip_pool_from

    vsphere_target

    Secondary Note: dns_servers will also be assigned to ntp_servers if you don't assign anything to ntp_servers.

```bash
export TF_VAR_domain_name="demo.intra"
export TF_VAR_dns_servers="[\"10.200.0.100\"]"
export TF_VAR_ntp_servers="[]"
export TF_VAR_ip_pool_gateway="254"
export TF_VAR_ip_pool_from="20"
export TF_VAR_k8s_pod_cidr="100.65.0.0/16"
export TF_VAR_k8s_service_cidr="100.64.0.0/16"
export TF_VAR_k8s_k8s_version="1.19.5"
export TF_VAR_root_ca_registries="[]"
export TF_VAR_unsigned_registries="[]"
```

* Kubernetes Runtime Optional Variables

```bash
export TF_VAR_docker_no_proxy="[]"
export TF_VAR_proxy_http_hostname=""
export TF_VAR_proxy_http_password=""
export TF_VAR_proxy_http_port="8080"
export TF_VAR_proxy_http_protocol="http"
export TF_VAR_proxy_http_username=""
export TF_VAR_proxy_https_hostname=""
export TF_VAR_proxy_https_password=""
export TF_VAR_proxy_https_port="8443"
export TF_VAR_proxy_https_username=""
```

Note: The proxy_http_hostname will be cloned to the proxy_https_hostname if left blank, when configuring runtime policies.

Note: The proxy_http_username will be cloned to the proxy_https_username if left blank, when configuring runtime policies.

* Kubernetes Cluster Optional Variables

```bash
export TF_VAR_tags="[]"
export TF_VAR_action="Deploy"
export TF_VAR_cluster_name="iks"
export TF_VAR_load_balancers="3"
export TF_VAR_ssh_user="iksadmin"
export TF_VAR_master_instance_type="small"
export TF_VAR_master_desired_size="1"
export TF_VAR_master_max_size="1"
export TF_VAR_worker_instance_type="small"
export TF_VAR_worker_desired_size="0"
export TF_VAR_worker_max_size="1"
```

* vSphere Optional Variables

  Note: The same rules above apply to the vsphere_target address.  But you can use dns or IPv4 values when modifying.

```bash
export TF_VAR_vsphere_target="210"
export TF_VAR_vsphere_cluster="hx-demo"
export TF_VAR_vsphere_datastore="hx-demo-ds1"
export TF_VAR_vsphere_portgroup="[\"Management\"]"
export TF_VAR_vsphere_resource_pool=""
```

For the Cluster tags; below is an example key/value format.

```bash
export TF_VAR_tags="[ { key = \"Terraform\", value = \"Module\" }, { key = \"Owner\", value = \"CiscoDevNet\" } ]"
```

Once all Variables have been imported into your environment, run the plan in the tfe folder:

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
| <a name="module_tfc_agent_pool"></a> [tfc\_agent\_pool](#module\_tfc\_agent\_pool) | ../../terraform-cloud/modules/tfc_agent_pool | n/a |
| <a name="module_tfc_variables_app_hello"></a> [tfc\_variables\_app\_hello](#module\_tfc\_variables\_app\_hello) | ../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_apps"></a> [tfc\_variables\_apps](#module\_tfc\_variables\_apps) | ../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_global"></a> [tfc\_variables\_global](#module\_tfc\_variables\_global) | ../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_iks"></a> [tfc\_variables\_iks](#module\_tfc\_variables\_iks) | ../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_variables_kube"></a> [tfc\_variables\_kube](#module\_tfc\_variables\_kube) | ../../terraform-cloud/modules/tfc_variables | n/a |
| <a name="module_tfc_workspaces"></a> [tfc\_workspaces](#module\_tfc\_workspaces) | ../../terraform-cloud/modules/tfc_workspaces | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action"></a> [action](#input\_action) | Action to perform on the Intersight Kubernetes Cluster.  Options are {Deploy\|Ready\|Unassign}. | `string` | `"Deploy"` | no |
| <a name="input_addons_list"></a> [addons\_list](#input\_addons\_list) | List of Add-ons to be added to Cluster. | `string` | `"[]"` | no |
| <a name="input_agent_pool"></a> [agent\_pool](#input\_agent\_pool) | Terraform Cloud Agent Pool. | `string` | n/a | yes |
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Intersight Kubernetes Service Cluster Name. | `string` | `"iks"` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Primary DNS Server for Kubernetes Sysconfig Policy. | `string` | `"[\"10.200.0.100\"]"` | no |
| <a name="input_docker_no_proxy"></a> [docker\_no\_proxy](#input\_docker\_no\_proxy) | Docker no proxy list, when using internet proxy.  Default is no list. | `string` | `"[]"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain Name for Kubernetes Sysconfig Policy. | `string` | `"demo.intra"` | no |
| <a name="input_ip_pool_from"></a> [ip\_pool\_from](#input\_ip\_pool\_from) | IP Pool Starting IP last Octet.  The var.network\_prefix will be combined with ip\_pool\_from for the Gateway Address. | `string` | `"20"` | no |
| <a name="input_ip_pool_gateway"></a> [ip\_pool\_gateway](#input\_ip\_pool\_gateway) | IP Pool Gateway last Octet.  The var.network\_prefix will be combined with ip\_pool\_gateway for the Gateway Address. | `string` | `"254"` | no |
| <a name="input_k8s_pod_cidr"></a> [k8s\_pod\_cidr](#input\_k8s\_pod\_cidr) | Pod CIDR Block to be used to assign Pod IP Addresses. | `string` | `"100.65.0.0/16"` | no |
| <a name="input_k8s_service_cidr"></a> [k8s\_service\_cidr](#input\_k8s\_service\_cidr) | Service CIDR Block used to assign Cluster Service IP Addresses. | `string` | `"100.64.0.0/16"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Kubernetes Version to Deploy. | `string` | `"1.19.5"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | Intersight Kubernetes Load Balancer count. | `string` | `3` | no |
| <a name="input_master_desired_size"></a> [master\_desired\_size](#input\_master\_desired\_size) | K8S Master Desired Cluster Size. | `string` | `1` | no |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | K8S Master Virtual Machine Instance Type.  Options are {small\|medium\|large}. | `string` | `"small"` | no |
| <a name="input_master_max_size"></a> [master\_max\_size](#input\_master\_max\_size) | K8S Master Maximum Cluster Size. | `string` | `1` | no |
| <a name="input_network_prefix"></a> [network\_prefix](#input\_network\_prefix) | IP Pool Gateway last Octet.  The var.network\_prefix will be combined with ip\_pool\_gateway for the Gateway Address. | `string` | `"10.200.0"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name. | `string` | `"default"` | no |
| <a name="input_proxy_http_hostname"></a> [proxy\_http\_hostname](#input\_proxy\_http\_hostname) | HTTP Proxy Server Name or IP Address. | `string` | `""` | no |
| <a name="input_proxy_http_password"></a> [proxy\_http\_password](#input\_proxy\_http\_password) | Password for the HTTP Proxy Server, If required. | `string` | `""` | no |
| <a name="input_proxy_http_port"></a> [proxy\_http\_port](#input\_proxy\_http\_port) | Proxy HTTP Port. | `string` | `"8080"` | no |
| <a name="input_proxy_http_protocol"></a> [proxy\_http\_protocol](#input\_proxy\_http\_protocol) | Proxy HTTP Protocol. | `string` | `"http"` | no |
| <a name="input_proxy_http_username"></a> [proxy\_http\_username](#input\_proxy\_http\_username) | HTTP Proxy Username. | `string` | `""` | no |
| <a name="input_proxy_https_hostname"></a> [proxy\_https\_hostname](#input\_proxy\_https\_hostname) | HTTPS Proxy Server Name or IP Address. | `string` | `""` | no |
| <a name="input_proxy_https_password"></a> [proxy\_https\_password](#input\_proxy\_https\_password) | Password for the HTTPS Proxy Server, If required. | `string` | `""` | no |
| <a name="input_proxy_https_port"></a> [proxy\_https\_port](#input\_proxy\_https\_port) | Proxy HTTP Port. | `string` | `"8443"` | no |
| <a name="input_proxy_https_protocol"></a> [proxy\_https\_protocol](#input\_proxy\_https\_protocol) | Proxy HTTP Protocol. | `string` | `"https"` | no |
| <a name="input_proxy_https_username"></a> [proxy\_https\_username](#input\_proxy\_https\_username) | HTTPS Proxy Username. | `string` | `""` | no |
| <a name="input_root_ca_registries"></a> [root\_ca\_registries](#input\_root\_ca\_registries) | List of root CA Signed Registries. | `string` | `"[]"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Intersight Kubernetes Service Cluster SSH Public Key. | `string` | n/a | yes |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Intersight Kubernetes Service Cluster Default User. | `string` | `"iksadmin"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be Associated with Objects Created in Intersight. | `string` | `"[]"` | no |
| <a name="input_terraform_cloud_token"></a> [terraform\_cloud\_token](#input\_terraform\_cloud\_token) | Token to Authenticate to the Terraform Cloud. | `string` | n/a | yes |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Terraform Target Version. | `string` | `"1.0.0"` | no |
| <a name="input_tfc_oath_token"></a> [tfc\_oath\_token](#input\_tfc\_oath\_token) | Terraform Cloud OAuth Token for VCS\_Repo Integration. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | Terraform Cloud Organization Name. | `string` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Timezone for Kubernetes Sysconfig Policy. | `string` | `"America/New_York"` | no |
| <a name="input_unsigned_registries"></a> [unsigned\_registries](#input\_unsigned\_registries) | List of unsigned registries to be supported. | `string` | `"[]"` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Version Control System Repository. | `string` | n/a | yes |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | vSphere Cluster to assign the K8S Cluster Deployment. | `string` | `"hx-demo"` | no |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | vSphere Datastore to assign the K8S Cluster Deployment. | `string` | `"hx-demo-ds1"` | no |
| <a name="input_vsphere_password"></a> [vsphere\_password](#input\_vsphere\_password) | vSphere Password.  Note: this is the password of the Credentials used to register the vSphere Target. | `string` | n/a | yes |
| <a name="input_vsphere_portgroup"></a> [vsphere\_portgroup](#input\_vsphere\_portgroup) | vSphere Port Group to assign the K8S Cluster Deployment. | `string` | `"[Management]"` | no |
| <a name="input_vsphere_resource_pool"></a> [vsphere\_resource\_pool](#input\_vsphere\_resource\_pool) | vSphere Resource Pool to assign the K8S Cluster Deployment. | `string` | `""` | no |
| <a name="input_vsphere_target"></a> [vsphere\_target](#input\_vsphere\_target) | vSphere Server registered as a Target in Intersight.  The default, 210, only works if this is for the DevNet Sandbox. | `string` | `"210"` | no |
| <a name="input_worker_desired_size"></a> [worker\_desired\_size](#input\_worker\_desired\_size) | K8S Worker Desired Cluster Size. | `string` | `1` | no |
| <a name="input_worker_instance_type"></a> [worker\_instance\_type](#input\_worker\_instance\_type) | K8S Worker Virtual Machine Instance Type.  Options are {small\|medium\|large}. | `string` | `"small"` | no |
| <a name="input_worker_max_size"></a> [worker\_max\_size](#input\_worker\_max\_size) | K8S Worker Maximum Cluster Size. | `string` | `4` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfc_agent_pool"></a> [tfc\_agent\_pool](#output\_tfc\_agent\_pool) | Terraform Cloud Agent Pool ID. |
| <a name="output_tfc_workspaces"></a> [tfc\_workspaces](#output\_tfc\_workspaces) | Terraform Cloud Workspace ID(s). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Configuring IKS cluster with Cisco Intersight Service for HashiCorp Terraform on vSphere Infrastructure

## Contents

* Use Cases
* Pre-requisites and Guidelines
* Create TFCB Workspaces using the TFE Provider
* Execute Plans in Terraform Cloud Workspaces
* Provision IP Pools, Kubernetes Policies, and an IKS Cluster with TFCB
* Import the IKS Cluster kube_config into a TFCB Workspace
* Deploy IWO Performance Collector App using Helm
* Deploy the sample "Hello IKS" App using Helm
* Try with a Cisco DevNet Sandbox

### Use Cases

* As a Cloud Admin, Build Workspaces in TFCB to support Infrastructure as Code Provisioning.
* As a Cloud Admin, use TFCB to provision IP Pools, Kubernetes Policies, and an IKS Cluster on vSphere Infrastructure to be leveraged by DevOps Teams.
* As a Cloud Admin, use IST, ((Intersight Service for HashiCorp Terraform), to deploy IWO (Intersight Workload Optimizer) Collector to collect app and infrastructure insights.
* As an App Developer, use IST to deploy a sample "Hello IKS" Application.

![alt text](https://github.com/prathjan/images/blob/main/iksnew.png?raw=true)

### Pre-requisites and Guidelines

1. Sign up for a user account on Intersight.com. You will need at least one Advantage Tier license as well as a Intersight Workload Optimizer license to complete this use case. Log in to intersight.com and generate API/Secret Keys.  Both licensing requirements can utilize the available demo licensing if you don't have the subscription levels.

2. Sign up for a TFCB (Terraform for Cloud Business) at <https://app.terraform.io/>. Log in and generate the User API Key. You will need this when you create the TF Cloud Target in Intersight.  If not a paid version, you will need to enable the trial account.

3. Clone this repository to your own VCS Repository for the VCS Integration with Terraform Cloud.

4. Integrate your VCS Repository into the TFCB Orgnization following these instructions: <https://www.terraform.io/docs/cloud/vcs/index.html>.  Be sure to copy the OAth Token which you will use later on for Workspace provisioning.

5. You will need access to a vSphere infrastructure.  You will use this to install the Intersight Assist Appliance and provision the Kubernetes (IKS) Cluster.

6. You will log into your Intersight account and create the following targets. Please refer to Intersight docs for details on how to create these Targets:

  Intersight Assist - This will provide on-premise proxy communication services. i.e. vSphere and Kubernetes.
  
  vSphere Target - Requires Intersight Assist Appliance.  
  
  TFC Cloud (This requires a Terraform for Cloud Business Account and at least 1 Advantage Tier License in Intersight)
  
  TFC Cloud Agent - After Claiming the TFCB Target, provising a Terraform Agent.  Be sure to add the following Managed Hosts/Networks:

    network for vsphere host i.e. 198.18.0.0/24
    network for Kubernetes Pod IP Range, i.e 198.18.1.0/24 (CIDR Ranges are not required)
    github-releases.githubusercontent.com
    github.com
    prathjan.github.io

### Create TFCB Workspaces using the TFE Provider

1. Follow the instructions in the "tfe" folder of this repository to provision the TFCB Workspaces.

### Execute Plans in Terraform Cloud Workspaces

1. Open the Workspace "{cluster_name}_global_vars" in TFCB and queue a plan manually. This will populate the global variables that will be used by the other TFCB workspaces.

2. You will execute the Runs in the workspaces in this order:

    * {cluster_name}_iks - See section below on "Provision IKS Policies and IP Pools with TFCB"

    * {cluster_name}_kube - See section below on "Provision a IKS Cluster with TFCB"

    * {cluster_name}_iwo - See section below on "Deploy IWO collector using Helm"

    * {cluster_name}_app_hello - See section below on "Deploy a sample "Hello IKS" App using Helm"

### Provision IP Pools, Kubernetes Policies, and an IKS Cluster with TFCB

![alt text](https://github.com/prathjan/images/blob/main/prof.png?raw=true)

### Get the Cluster kube_config

Currently due to order of operations in Intersight you must use a seperate task after Cluster creation to download the kube_config.  the {cluster_name}_kube Workspace will be used to accomplish this.

Once you have confirmed in Intersight that the cluster has been fully provisioned run the plan in the {cluster_name}_kube workspace.

Download the cluster kube_config from from the workspace and run a couple of kubectl commands to verify an operational cluster:

    kubectl get nodes

    kubectl get pods --all-namespaces

### Deploy IWO Performance Collector App using Helm

If you don't have Intersight Workload Optimizer licensing tied to your Intersight Instance you can skip this section.

As a Cloud Admin it is imperative to be able to have insights into the infrastructure. The workspace "{cluster_name}_iwo" provides an example helm chart provisioning process to add the iwo collector pod to the deployed cluster.

Open "{cluster_name}_iwo" and Queue a plan manually.

Once successful, the collector is installed into your Kubernetes cluster and requires you to claim it as target in Intersight->Target. You will use the following steps to get the Device ID and Code:

Download kube_config for the {cluster_name} from Intersight or your {cluster_name}_kube workspace.

Execute:

    kubectl <path_to_kubeconfig> port-forward <collector_pod_id> 9110

Execute this to get the Device ID:

    curl -s http://localhost:9110/DeviceIdentifiers

Execute this to get the Claim Code:

    curl -s http://localhost:9110/SecurityTokens

Once successful, open the Optimizer in Intersight and view insights for the App just deployed:

Note: This can take approximately 30 minutes to begin to see the cluster in IWO.

![alt text](https://github.com/prathjan/images/blob/main/insights.png?raw=true)

### Deploy the sample "Hello IKS" App using Helm

What use is a cluster without an Application? The workspace "{cluster_name}_app_hello" accounts for this.

Open "{cluster_name}_app_hello" and Queue a plan manually.

Once successful, access the app with the loadbalancer IP:

    kubectl get svc --all-namespaces

or

    kubectl get ingress

Open URL in a browser window : <https://LB_IP>

You should see this:

![alt text](https://github.com/prathjan/images/blob/main/helloiks.png?raw=true)

### De-provisioning

There is a three step process to decomission the lab.

1. Go into the IKS workspace and change the variable "action" from "Deploy" to "Delete" and Queue a Plan.  Monitor in Intersight for the Completed deletion of the cluster deployment. Workspace > Variables > "action": edit.  Then "Queue plan manually".

2. Run a Destroy Infrastrucutre Plan on the {cluster_name}_iks workspace to delete the Kubernetes Policies from Intersight.  Workspace > Settings > Destruction and Deletion > "Queue destroy plan".  Wait for the Completion of the Destroy Apply.

3. Back on your machine where you have downloaded the tfe folder and ran the plan to build the workspaces run the command:

      terraform destroy

### Try with a Cisco DevNet Sandbox

A sandbox covering a lot of the above concepts can be found here:

<https://devnetsandbox.cisco.com/RM/Diagram/Index/daad55dd-45f1-46c6-a1b4-7339b318c970?diagramType=Topology>

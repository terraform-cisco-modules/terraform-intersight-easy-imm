#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

# agent_pool        = "Richfield_Agents"
# terraform_version = "1.0.3"
# tfc_email         = "tyscott@cisco.com"
# tfc_organization = "Cisco-Richfield-Lab"
# vcs_repo         = "scotttyso/terraform-intersight-easy-imm"
/*
  We highly recommend that for the terraform_cloud_token you use an environment variable for input:
  - export TF_VAR_terraform_cloud_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# terraform_cloud_token = "value"
/*
  We highly recommend that for the tfc_oath_token you use an environment variable for input; Like:
  - export TF_VAR_tfc_oath_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# tfc_oath_token = "value"


#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

# endpoint     = "https://intersight.com"
organizations = ["Asgard"]

# secretkey    = "../../../../intersight.secret"
/*
  To export the Secret Key via an Environment Variable the format is as follows (Note: they are not quotation marks, but escape characters):
  - export TF_VAR_secretkey=`cat ../../intersight.secret`
  Either way will work in this case as we are not posting the contents of the file here.
*/
/*
  We highly recommend that for the apikey you use an environment variable for input:
  - export TF_VAR_apikey="abcdefghijklmnopqrstuvwxyz.0123456789"
*/
# apikey = "value"

#__________________________________________________________
#
# Kubernetes Policy Variables
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-easy-imm" }, { key = "Owner", value = "tyscott" }]

#______________________________________________
#
# Fibre-Channel Pool Variables
#______________________________________________

fc_pools = {
  Asgard_wwpn_pool_a = {
    assignment_order = "sequential"
    organization     = "Asgard"
    # id_blocks = [] # Accepting the Default Values
  }
  Asgard_wwpn_pool_b = {
    assignment_order = "sequential"
    organization     = "Asgard"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0b:00:00"
        to   = "20:00:00:25:B5:0b:00:ff"
      }
    ]
  }
  Asgard_wwnn_pool = {
    assignment_order = "sequential"
    organization     = "Asgard"
    pool_purpose     = "WWNN"
    id_blocks = [
      {
        from = "20:00:00:25:B5:0c:00:00"
        to   = "20:00:00:25:B5:0c:00:ff"
      }
    ]
  }
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

ip_pools = {
  Asgard_ip_pool_1 = {
    assignment_order = "sequential"
    dns_servers_v4   = ["10.101.128.15", "10.101.128.16"]
    ipv4_block = [
      {
        pool_size   = 32
        starting_ip = "10.92.110.96"
      },
      {
        pool_size   = 31
        starting_ip = "10.92.110.128"
      }
    ]
    ipv4_config = [
      {
        gateway = "10.92.110.1"
        netmask = "255.255.255.0"
      }
    ]
    organization = "Asgard"
    tags         = []
  }
}


#______________________________________________
#
# IQN Pool Variables
#______________________________________________

iqn_pools = {}


#______________________________________________
#
# MAC Pool Variables
#______________________________________________

mac_pools = {
  Asgard_mac_pool_a = {
    assignment_order = "sequential"
    organization     = "Asgard"
    # mac_blocks = [] # Accepting Default MAC Block
  }
  Asgard_mac_pool_b = {
    assignment_order = "sequential"
    organization     = "Asgard"
    mac_blocks = [
      {
        from = "00:25:B5:0b:00:00"
        to   = "00:25:B5:0b:00:ff"
      }
    ]
  }
}


#______________________________________________
#
# UUID Pool Variables
#______________________________________________

uuid_pools = {
  Asgard_uuid_pool = {
    assignment_order = "sequential"
    organization     = "Asgard"
    # prefix           = "" # Accepting Default Value
    # uuid_suffix_blocks = [] # Accepting Default Values
  }
}

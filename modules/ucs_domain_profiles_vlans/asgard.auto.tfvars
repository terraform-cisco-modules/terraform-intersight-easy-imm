#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

tfc_organization = "Cisco-Richfield-Lab"
ws_domain        = "Asgard_domain_profiles"

#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

# endpoint     = "https://intersight.com"
organizations = ["Asgard", "UCS-DEMO2"]
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
# UCS Domain VLAN Variables
#______________________________________________

# policies_multicast = {
#   "Asgard_multicast" = {
#     description    = ""
#     organization   = "Asgard"
#     querier_ip     = ""
#     querier_state  = "Disabled"
#     snooping_state = "Enabled"
#     tags           = []
#   }
# }
#
# policies_vlan = {
#   "Asgard_vlangroup_1" = {
#     auto_allow_on_uplinks = true
#     description           = ""
#     multicast_policy      = "Asgard_multicast"
#     organization          = "Asgard"
#     vlan_list             = "101-199,201-299,1100-1299,1700-1799"
#     vlan_native           = 1
#     vlan_prefix           = "asgard"
#     vlan_map = [
#       {
#         prefix  = "mgmt"
#         vlan_id = 10
#       },
#       {
#         prefix  = "storage"
#         vlan_id = 20
#       }
#     ]
#   }
# }

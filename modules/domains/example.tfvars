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
# UCS Domain Profile Variables
#______________________________________________

assign_switches         = false
assign_domain           = false
configure_fibre_channel = true
configure_snmp          = true
configure_syslog        = true


ucs_domain_profile = {
  asgard-ucs = {
    assign_switches        = false
    config_fibre_channel   = true
    domain_action          = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    domain_serial_a        = "FDO23360Y8U"
    domain_serial_b        = "FDO23360XWU"
    dns_servers_v4         = ["10.101.128.15", "10.101.128.16"]
    ntp_servers            = ["10.101.128.15", "10.101.128.16"]
    ntp_timezone           = "America/New_York"
    organization           = "Asgard"
    ports_device_model     = "UCS-FI-64108"
    ports_lan_pc_ports     = [97, 99]
    ports_lan_pc_speed     = "Auto"
    ports_san_fill_pattern = "Arbff"
    ports_san_pc_ports     = [1, 3]
    ports_san_pc_speed     = "32Gbps"
    ports_servers          = "5-12"
    snmp_configure         = true
    snmp_config_type       = "snmp_1_user"
    snmp_system_contact    = "Richfield Lab Admins: rich-lab@cisco.com"
    snmp_system_location   = "Richfield Ohio: Room 143, Rack 143D."
    snmp_trap_destinations = [
      {
        community    = ""
        destination  = "lnx1.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      },
      {
        community    = ""
        destination  = "lnx2.rich.ciscolabs.com"
        enabled      = true
        port         = 162
        snmp_version = "V3"
        type         = "Trap"
        user         = "richuser"
      }
    ]
    snmp_user_1_auth_type      = "SHA"
    snmp_user_1_name           = "richuser"
    snmp_user_1_security_level = "AuthPriv"
    syslog_configure           = true
    syslog_description         = ""
    syslog_destinations = [
      {
        enabled      = true
        hostname     = "lnx1.rich.ciscolabs.com"
        port         = 514
        protocol     = "udp"
        min_severity = "warning"
      },
      {
        enabled      = true
        hostname     = "lnx2.rich.ciscolabs.com"
        port         = 514
        protocol     = "udp"
        min_severity = "warning"
      }
    ]
    tags                 = []
    vlan_description     = ""
    vlan_native          = 1
    vlan_list            = "101-199,201-299,1100-1299,1700-1799"
    vsan_a_description   = ""
    vsan_b_description   = ""
    vsan_enable_trunking = false
    vsan_fabric_a        = 100
    vsan_fabric_a_fcoe   = ""
    vsan_fabric_b        = 200
    vsan_fabric_b_fcoe   = ""
  }
}



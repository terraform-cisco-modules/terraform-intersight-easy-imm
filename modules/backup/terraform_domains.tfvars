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

ucs_domain_templates = {
  Asgard_base = {
    fc_ports                      = [1, 4]
    fc_slot_id                    = 1
    organization                  = "Asgard"
    policies_network_connectivity = "Asgard_sw_dns"
    policies_ntp                  = "Asgard_sw_ntp"
    policies_snmp                 = "Asgard_sw_snmp"
    policies_switch_control       = "Asgard_swctrl"
    policies_syslog               = "Asgard_sw_syslog"
    policies_system_qos           = "Asgard_sytemqos"
    policies_vlan                 = "Asgard_vlangroup_1cd"
    san_fill_pattern              = "Arbff"
    san_pc_breakoutswport         = 0
    san_pc_ports                  = [1, 3]
    san_pc_slot_id                = 1
    san_pc_speed                  = "16Gbps"
    vsan_a                        = 100
    vsan_a_description            = ""
    vsan_a_fcoe                   = null
    vsan_b                        = 200
    vsan_b_description            = ""
    vsan_b_fcoe                   = null
    vsan_enable_trunking          = false
    vsan_prefix                   = ""
  }
}

ucs_domain_profiles = {
  asgard-ucs = {
    assign_switches     = true
    action              = "No-op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    device_model        = "UCS-FI-64108"
    domain_description  = ""
    domain_descr_fi_a   = ""
    domain_descr_fi_b   = ""
    domain_serial_a     = "FDO23360Y8U"
    domain_serial_b     = "FDO23360XWU"
    port_policy_descr_a = ""
    port_policy_descr_b = ""
    server_ports        = "5-18"
    src_template        = "Asgard_base"
    tags                = []
  }
}


#______________________________________________
#
# LAN Port Channel Policies
#______________________________________________

policies_port_channel_lan = {
  "asgard-ucs-pc97" = {
    lan_pc_breakoutswport     = 0
    lan_pc_ports              = [97, 99]
    lan_pc_slot_id            = 1
    lan_pc_speed              = "Auto"
    policies_flow_control     = "Asgard_flowctrl"
    policies_link_aggregation = "Asgard_linkagg"
    policies_link_control     = "Asgard_linkctrl"
    tags                      = []
    ucs_domain_profile        = "asgard-ucs"
  }
}


#______________________________________________
#
# SNMP Policies
#______________________________________________

policies_snmp = {
  "Asgard_sw_snmp" = {
    description                = ""
    enabled                    = true
    organization               = "Asgard"
    snmp_access                = "Full"
    snmp_engine_id             = ""
    snmp_port                  = 161
    snmp_user_1_auth_type      = "SHA"
    snmp_user_1_name           = "richuser"
    snmp_user_1_security_level = "AuthPriv"
    snmp_user_2_auth_type      = "SHA"
    snmp_user_2_name           = ""
    snmp_user_2_security_level = "AuthPriv"
    system_contact             = "Richfield Lab Admins: rich-lab@cisco.com"
    system_location            = "Richfield Ohio: Room 143, Rack 143D."
    tags                       = []
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
  }
}

#______________________________________________
#
# Switch Control Policies
#______________________________________________

policies_switch_control = {
  "Asgard_swctrl" = {
    description           = ""
    mac_aging_option      = "Default"
    mac_aging_time        = 14500
    organization          = "Asgard"
    tags                  = []
    udld_message_interval = 15
    udld_recovery_action  = "reset"
    vlan_optimization     = true
  }
}


#______________________________________________
#
# Syslog Policies
#______________________________________________

policies_syslog = {
  "Asgard_sw_syslog" = {
    description        = ""
    local_min_severity = "warning"
    organization       = "Asgard"
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
    tags = []
  }
}


#______________________________________________
#
# System QoS Policies
#______________________________________________

policies_system_qos = {
  "Asgard_sytemqos" = {
    best_effort_admin_state        = "Enabled"
    best_effort_bandwidth          = 5
    best_effort_mtu                = 9216
    best_effort_multicast_optimize = false
    best_effort_weight             = 1
    bronze_admin_state             = "Enabled"
    bronze_bandwidth               = 5
    bronze_cos                     = 1
    bronze_mtu                     = 9216
    bronze_multicast_optimize      = false
    bronze_packet_drop             = true
    bronze_weight                  = 1
    description                    = ""
    fc_bandwidth                   = 39
    fc_weight                      = 6
    gold_admin_state               = "Enabled"
    gold_bandwidth                 = 23
    gold_cos                       = 4
    gold_mtu                       = 9216
    gold_multicast_optimize        = false
    gold_packet_drop               = true
    gold_weight                    = 4
    organization                   = "Asgard"
    platinum_admin_state           = "Enabled"
    platinum_bandwidth             = 23
    platinum_cos                   = 5
    platinum_mtu                   = 9216
    platinum_multicast_optimize    = false
    platinum_packet_drop           = false
    platinum_weight                = 4
    silver_admin_state             = "Enabled"
    silver_bandwidth               = 5
    silver_cos                     = 2
    silver_mtu                     = 9216
    silver_multicast_optimize      = false
    silver_packet_drop             = true
    silver_weight                  = 1
    tags                           = []
  }
}

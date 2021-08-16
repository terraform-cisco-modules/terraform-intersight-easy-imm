#_________________________________________________________________________
#
# Intersight System QoS Policies Variables
# GUI Location: Configure > Policy > Create Policy > System QoS > Start
#_________________________________________________________________________

variable "policies_system_qos" {
  default = {
    default = {
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
      organization                   = "default"
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
  description = <<-EOT
  key - Name of the System QoS Policy.
  * best_effort_admin_state - Administrative state for this QoS class.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * best_effort_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 5.
  * best_effort_mtu - Maximum transmission unit (MTU) is the largest size packet or frame,that can be sent in a packet- or frame-based network such as the Internet.  Range is 1500-9216.  Default is 9216.
  * best_effort_multicast_optimize - If enabled, this QoS class will be optimized to send multiple packets..  Default is false.
  * best_effort_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 1.
  * bronze_admin_state - Administrative state for this QoS class.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * bronze_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 5.
  * bronze_cos - Class of service received by the traffic tagged with this QoS.  Default is 1.
  * bronze_mtu - Maximum transmission unit (MTU) is the largest size packet or frame,that can be sent in a packet- or frame-based network such as the Internet.  Range is 1500-9216.  Default is 9216.
  * bronze_multicast_optimize - If enabled, this QoS class will be optimized to send multiple packets..  Default is false.
  * bronze_packet_drop - If enabled, this QoS class will allow packet drops within an acceptable limit.  Default is true.
  * bronze_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 1.
  * description - Description to Assign to the Policy.
  * fc_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 39.
  * fc_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 6.
  * gold_admin_state - Administrative state for this QoS class.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * gold_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 23.
  * gold_cos - Class of service received by the traffic tagged with this QoS.  Default is 4.
  * gold_mtu - Maximum transmission unit (MTU) is the largest size packet or frame,that can be sent in a packet- or frame-based network such as the Internet.  Range is 1500-9216.  Default is 9216.
  * gold_multicast_optimize - If enabled, this QoS class will be optimized to send multiple packets..  Default is false.
  * gold_packet_drop - If enabled, this QoS class will allow packet drops within an acceptable limit.  Default is true.
  * gold_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 4.
  * organization - Name of the Intersight Organization to assign this Policy to.
    - https://intersight.com/an/settings/organizations/
  * platinum_admin_state - Administrative state for this QoS class.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * platinum_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 23.
  * platinum_cos - Class of service received by the traffic tagged with this QoS.  Default is 5.
  * platinum_mtu - Maximum transmission unit (MTU) is the largest size packet or frame,that can be sent in a packet- or frame-based network such as the Internet.  Range is 1500-9216.  Default is 9216.
  * platinum_multicast_optimize - If enabled, this QoS class will be optimized to send multiple packets..  Default is false.
  * platinum_packet_drop - If enabled, this QoS class will allow packet drops within an acceptable limit.  Default is false.
  * platinum_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 4.
  * silver_admin_state - Administrative state for this QoS class.
    - Disabled - Admin configured Disabled State.
    - Enabled - (Default) Admin configured Enabled State.
  * silver_bandwidth - Percentage of bandwidth received by the traffic tagged with this QoS.  Default is 5.
  * silver_cos - Class of service received by the traffic tagged with this QoS.  Default is 2.
  * silver_mtu - Maximum transmission unit (MTU) is the largest size packet or frame,that can be sent in a packet- or frame-based network such as the Internet.  Range is 1500-9216.  Default is 9216.
  * silver_multicast_optimize - If enabled, this QoS class will be optimized to send multiple packets..  Default is false.
  * silver_packet_drop - If enabled, this QoS class will allow packet drops within an acceptable limit.  Default is true.
  * silver_weight - The weight of the QoS Class controls the distribution of bandwidth between QoS Classes,with the same priority after the Guarantees for the QoS Classes are reached.  Default is 1.
  * tags - List of Key/Value Pairs to Assign as Attributes to the Policy.
  EOT
  type = map(object(
    {
      best_effort_admin_state        = optional(string)
      best_effort_bandwidth          = optional(number)
      best_effort_mtu                = optional(number)
      best_effort_multicast_optimize = optional(bool)
      best_effort_weight             = optional(number)
      bronze_admin_state             = optional(string)
      bronze_bandwidth               = optional(number)
      bronze_cos                     = optional(number)
      bronze_mtu                     = optional(number)
      bronze_multicast_optimize      = optional(bool)
      bronze_packet_drop             = optional(bool)
      bronze_weight                  = optional(number)
      description                    = optional(string)
      fc_bandwidth                   = optional(number)
      fc_weight                      = optional(number)
      gold_admin_state               = optional(string)
      gold_bandwidth                 = optional(number)
      gold_cos                       = optional(number)
      gold_mtu                       = optional(number)
      gold_multicast_optimize        = optional(bool)
      gold_packet_drop               = optional(bool)
      gold_weight                    = optional(number)
      organization                   = optional(string)
      platinum_admin_state           = optional(string)
      platinum_bandwidth             = optional(number)
      platinum_cos                   = optional(number)
      platinum_mtu                   = optional(number)
      platinum_multicast_optimize    = optional(bool)
      platinum_packet_drop           = optional(bool)
      platinum_weight                = optional(number)
      silver_admin_state             = optional(string)
      silver_bandwidth               = optional(number)
      silver_cos                     = optional(number)
      silver_mtu                     = optional(number)
      silver_multicast_optimize      = optional(bool)
      silver_packet_drop             = optional(bool)
      silver_weight                  = optional(number)
      tags                           = optional(list(map(string)))
    }
  ))
}


#_________________________________________________________________________
#
# System QoS Policies
# GUI Location: Configure > Policy > Create Policy > System QoS > Start
#_________________________________________________________________________

module "policies_system_qos_1" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  for_each    = local.policies_system_qos
  description = each.value.description != "" ? each.value.description : "${each.key} System QoS Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  profiles = flatten([
    for s in sort(keys(local.ucs_domain_profiles)) :
    [module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid]
    if local.ucs_domain_profiles[s].profile.policies_system_qos == each.key
  ])
  classes = []
}

module "policies_system_qos_2" {
  depends_on = [
    local.org_moids,
    module.ucs_domain_profiles_a,
    module.ucs_domain_profiles_b
  ]
  source      = "terraform-cisco-modules/imm/intersight//modules/domain_system_qos"
  for_each    = local.policies_system_qos
  description = each.value.description != "" ? each.value.description : "${each.key} System QoS Policy."
  name        = each.key
  org_moid    = local.org_moids[each.value.organization].moid
  tags        = length(each.value.tags) > 0 ? each.value.tags : local.tags
  # profiles = flatten([
  #   for s in sort(keys(local.ucs_domain_profiles)) :
  #   [module.ucs_domain_profiles_a[s].moid, module.ucs_domain_profiles_b[s].moid]
  #   if local.ucs_domain_profiles[s].policies_system_qos == each.key
  # ])
  classes = [
    {
      admin_state        = each.value.bronze_admin_state
      bandwidth_percent  = each.value.bronze_bandwidth
      cos                = each.value.bronze_cos
      mtu                = each.value.bronze_mtu
      multicast_optimize = each.value.bronze_multicast_optimize
      name               = "Bronze"
      packet_drop        = each.value.bronze_packet_drop
      weight             = each.value.bronze_weight
    },
    {
      admin_state        = each.value.silver_admin_state
      bandwidth_percent  = each.value.silver_bandwidth
      cos                = each.value.silver_cos
      mtu                = each.value.silver_mtu
      multicast_optimize = each.value.silver_multicast_optimize
      name               = "Silver"
      packet_drop        = each.value.silver_packet_drop
      weight             = each.value.silver_weight
    },
    {
      admin_state        = each.value.gold_admin_state
      bandwidth_percent  = each.value.gold_bandwidth
      cos                = each.value.gold_cos
      mtu                = each.value.gold_mtu
      multicast_optimize = each.value.gold_multicast_optimize
      name               = "Gold"
      packet_drop        = each.value.gold_packet_drop
      weight             = each.value.gold_weight
    },
    {
      admin_state        = each.value.platinum_admin_state
      bandwidth_percent  = each.value.platinum_bandwidth
      cos                = each.value.platinum_cos
      mtu                = each.value.platinum_mtu
      multicast_optimize = each.value.platinum_multicast_optimize
      name               = "Platinum"
      packet_drop        = each.value.platinum_packet_drop
      weight             = each.value.platinum_weight
    },
    {
      admin_state        = each.value.best_effort_admin_state
      bandwidth_percent  = each.value.best_effort_bandwidth
      cos                = 255
      mtu                = each.value.best_effort_mtu
      multicast_optimize = each.value.best_effort_multicast_optimize
      name               = "Best Effort"
      packet_drop        = null
      weight             = each.value.best_effort_weight
    },
    {
      admin_state        = "Enabled"
      bandwidth_percent  = each.value.fc_bandwidth
      cos                = 3
      mtu                = 2240
      multicast_optimize = null
      name               = "FC"
      packet_drop        = false
      weight             = each.value.fc_weight
    },
  ]
}

#______________________________________________
#
# Fibre-Channel Pool Variables
#______________________________________________

variable "fc_pools_create" {
  default     = false
  description = "Set this to True if you want to Create a Fibre-Channel Pool."
  type        = bool
}

variable "fc_pools_map" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      organization     = "default"
      pool_purpose     = "WWPN" # WWPN or WWNN
      tags             = []
      id_blocks = [
        {
          from = "20:00:00:25:B5:0a:00:00"
          to   = "20:00:00:25:B5:0a:00:ff"
        }
      ]
    }
  }
  description = "Intersight Fibre-Channel Pool Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_fc"
  type = map(object(
    {
      assignment_order = optional(string)
      description      = optional(string)
      id_blocks        = optional(list(map(string)))
      organization     = optional(string)
      pool_purpose     = optional(string)
      tags             = optional(list(map(string)))
    }
  ))
}


#______________________________________________
#
# IP Pool Variables
#______________________________________________

variable "ip_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an IP Pool."
  type        = bool
}

variable "ip_pools_map" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      dns_servers_v4   = ["208.67.220.220", "208.67.222.222"]
      dns_servers_v6   = []
      ipv4_block       = [] # [ { pool_size = 31, starting_ip = "198.18.1.32" } ]
      ipv4_config      = [] # [ { gateway = "198.18.1.1", netmask = "255.255.255.0" } ]
      ipv6_block       = [] # [ { pool_size = 31, starting_ip = "2001:002:1::32" } ]
      ipv6_config      = [] # [ { gateway = "2001:002:1::1", prefix = 64 } ]
      organization     = "default"
      tags             = []
    }
  }
  description = "Intersight IP Pool Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_ip"
  type = map(object(
    {
      assignment_order = optional(string)
      description      = optional(string)
      dns_servers_v4   = optional(set(string))
      dns_servers_v6   = optional(set(string))
      ipv4_block       = optional(list(map(string)))
      ipv4_config      = optional(list(map(string)))
      ipv6_block       = optional(list(map(string)))
      ipv6_config      = optional(list(map(string)))
      organization     = optional(string)
      tags             = optional(list(map(string)))
    }
  ))
}


#______________________________________________
#
# IQN Pool Variables
#______________________________________________

variable "iqn_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an IQN Pool."
  type        = bool
}

variable "iqn_pools_map" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      iqn_prefix       = "iqn.2021-11.com.cisco"
      organization     = "default"
      tags             = []
      iqn_suffix_blocks = [
        {
          pool_size    = 255
          starting_iqn = 01
          suffix       = "ucs-host"
        }
      ]
    }
  }
  description = "Intersight IQN Pool Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_iqn"
  type = map(object(
    {
      assignment_order  = optional(string)
      description       = optional(string)
      iqn_prefix        = optional(string)
      iqn_suffix_blocks = optional(list(map(string)))
      organization      = optional(string)
      tags              = optional(list(map(string)))
    }
  ))
}


#______________________________________________
#
# MAC Pool Variables
#______________________________________________

variable "mac_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an MAC Pool."
  type        = bool
}

variable "mac_pools_map" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      organization     = "default"
      tags             = []
      mac_blocks = [
        {
          from = "00:25:B5:0a:00:00"
          to   = "00:25:B5:0a:00:ff"
        }
      ]
    }
  }
  description = "Intersight MAC Pool Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_mac"
  type = map(object(
    {
      assignment_order = optional(string)
      description      = optional(string)
      mac_blocks       = optional(list(map(string)))
      organization     = optional(string)
      tags             = optional(list(map(string)))
    }
  ))
}


#______________________________________________
#
# UUID Pool Variables
#______________________________________________

variable "uuid_pools_create" {
  default     = false
  description = "Set this to True if you want to Create an MAC Pool."
  type        = bool
}

variable "uuid_pools_map" {
  default = {
    default = { # The Pool Name will be {each.key}.  In this case it would be default if left like this.
      assignment_order = "default"
      description      = ""
      organization     = "default"
      prefix           = "000025B5-0000-0000"
      tags             = []
      uuid_suffix_blocks = [
        {
          from = "0000-000000000000"
          size = 32768
        }
      ]
    }
  }
  description = "Intersight UUID Pool Variable Map.\r\n1. organization - Name of the Intersight Organization to assign this pool to.  https://intersight.com/an/settings/organizations/ \r\n2. For the remainder of the option documentation refer to the source here: https://github.com/terraform-cisco-modules/terraform-intersight-imm/tree/master/modules/pools_uuid"
  type = map(object(
    {
      assignment_order   = optional(string)
      description        = optional(string)
      organization       = optional(string)
      prefix             = optional(string)
      tags               = optional(list(map(string)))
      uuid_suffix_blocks = optional(list(map(string)))
    }
  ))
}

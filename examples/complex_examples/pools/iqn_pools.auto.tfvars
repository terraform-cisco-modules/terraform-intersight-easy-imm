#______________________________________________
#
# IQN Pools
#______________________________________________

iqn_pools = {
  "IQN-Pool" = {
    assignment_order = "default"
    prefix           = "iqn.2010-11.com.flexpod"
    iqn_suffix_blocks = [
      {
        from   = "1"
        suffix = "aa13-6332-host"
        size   = "16"
      }
    ]
    tags = []
  }
  "ocb-poc" = {
    assignment_order = "default"
    prefix           = "iqn.2020.local.ocb-poc"
    iqn_suffix_blocks = [
      {
        from   = "1"
        suffix = "esxi"
        size   = "50"
      }
    ]
    tags = []
  }
}

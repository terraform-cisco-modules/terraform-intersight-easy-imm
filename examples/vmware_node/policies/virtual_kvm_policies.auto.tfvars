#______________________________________________
#
# Virtual KVM Policy Variables
#______________________________________________

virtual_kvm_policies = {
  "#Organization#_vkvm" = {
    description               = ""
    enable_local_server_video = true
    enable_video_encryption   = false
    enable_virtual_kvm        = true
    maximum_sessions          = 4
    organization              = "#Organization#"
    remote_port               = 2068
    tags                      = []
  }
}



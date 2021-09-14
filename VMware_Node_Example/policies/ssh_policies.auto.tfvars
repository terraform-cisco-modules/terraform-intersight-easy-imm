#______________________________________________
#
# SSH Policy Variables
#______________________________________________

ssh_policies = {
  "#Organization#_ssh" = {
    description  = ""
    enabled      = true
    organization = "#Organization#"
    ssh_port     = 22
    tags         = []
    timeout      = 1800
  }
}


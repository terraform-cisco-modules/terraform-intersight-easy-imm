#______________________________________________
#
# SMTP Policy Variables
#______________________________________________

smtp_policies = {
  "Asgard_smtp" = {
    description     = ""
    enabled         = true
    min_severity    = "critical"
    organization    = "Asgard"
    sender_email    = "rich-lab@cisco.com"
    smtp_port       = 25
    smtp_recipients = ["rich-lab@cisco.com"]
    smtp_server     = "smtp-ext.cisco.com"
    tags            = []
  }
}


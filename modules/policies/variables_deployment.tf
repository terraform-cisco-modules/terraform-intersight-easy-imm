#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}


#______________________________________________
#
# Deployment Variables
#______________________________________________

variable "Cluster_ID" {
  default     = "0"
  description = "A single digit Cluster Identifier between 0 and 256 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
}

variable "Organization_ID" {
  default     = "0"
  description = "A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
  validation {
    condition = (
      var.Organization_ID == "0" ||
      var.Organization_ID == "1" ||
      var.Organization_ID == "2" ||
      var.Organization_ID == "3" ||
      var.Organization_ID == "4" ||
      var.Organization_ID == "5" ||
      var.Organization_ID == "6" ||
      var.Organization_ID == "7" ||
      var.Organization_ID == "8" ||
      var.Organization_ID == "9" ||
      var.Organization_ID == "A" ||
      var.Organization_ID == "B" ||
      var.Organization_ID == "C" ||
      var.Organization_ID == "D" ||
      var.Organization_ID == "E" ||
      var.Organization_ID == "F" ||
      var.Organization_ID == "a" ||
      var.Organization_ID == "b" ||
      var.Organization_ID == "c" ||
      var.Organization_ID == "d" ||
      var.Organization_ID == "e" ||
      var.Organization_ID == "f"
    )
    error_message = "Organization_ID Must be a single digit value in Hex between 0 and F."
  }
}

variable "Site_ID" {
  default     = "0"
  description = "A single digit site identifier between 0 and 15 in Hex. (0-9, A, B, C, D, E, F)."
  type        = string
  validation {
    condition = (
      var.Site_ID == "0" ||
      var.Site_ID == "1" ||
      var.Site_ID == "2" ||
      var.Site_ID == "3" ||
      var.Site_ID == "4" ||
      var.Site_ID == "5" ||
      var.Site_ID == "6" ||
      var.Site_ID == "7" ||
      var.Site_ID == "8" ||
      var.Site_ID == "9" ||
      var.Site_ID == "A" ||
      var.Site_ID == "B" ||
      var.Site_ID == "C" ||
      var.Site_ID == "D" ||
      var.Site_ID == "E" ||
      var.Site_ID == "F" ||
      var.Site_ID == "a" ||
      var.Site_ID == "b" ||
      var.Site_ID == "c" ||
      var.Site_ID == "d" ||
      var.Site_ID == "e" ||
      var.Site_ID == "f"
    )
    error_message = "Site_ID Must be a single digit value in Hex between 0 and F."
  }
}
output "Site_ID" {
  description = "Site Identifier."
  value       = var.Site_ID
}




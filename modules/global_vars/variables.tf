#__________________________________________________________
#
# Intersight Provider Variables
#__________________________________________________________

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}
output "endpoint" {
  description = "Intersight URL."
  value       = var.endpoint
}

#__________________________________________________________
#
# Intersight Organization Variables
#__________________________________________________________

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name."
  type        = string
}
output "organization" {
  description = "Intersight Organization Name."
  value       = var.organization
}

#______________________________________________
#
# Intersight Tag Variables
#______________________________________________

variable "tags" {
  default     = []
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  type        = list(map(string))
}
output "tags" {
  description = "List of Key/Value Pairs to Assign as Attributes to the Policy."
  value       = var.tags
}

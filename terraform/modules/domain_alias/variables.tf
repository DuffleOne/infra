variable "domain" {
  description = "The domain name"
  type        = string
}

variable "domain_key" {
  description = "Domain key"
  type        = string
  default     = ""
}

variable "email" {
  description = "Does this domain receive email?"
  type        = bool
  default     = true
}

variable "keybase_verification" {
  description = "Keybae verification key"
  type        = string
  default     = ""
}

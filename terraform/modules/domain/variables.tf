variable "domain" {
  description = "The domain name"
  type        = string
}

variable "domain_key" {
  description = "Domain key"
  type        = string
  default     = null
}

variable "email" {
  description = "Does this domain receive email?"
  type        = bool
  default     = true
}

variable "keybase_verification" {
  description = "Keybase verification key"
  type        = string
  default     = null
}

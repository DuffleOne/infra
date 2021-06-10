variable "domain" {
  description = "The domain name"
  type        = string
}

variable "has_domain_key" {
  description = "Is this domain registered in Google, does it have a domain key?"
  type        = bool
  default     = true
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

variable "keybase" {
  description = "Is the domain registered on Keybase?"
  type        = bool
  default     = false
}

variable "keybase_verification" {
  description = "Keybase verification key"
  type        = string
  default     = ""
}

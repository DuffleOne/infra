variable "domain" {
  description = "The domain name"
  type        = string
}

variable "has_domain_key" {
  description = "Has domain key (google)?"
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
  description = "Keybae verification key"
  type        = string
  default     = ""
}

variable "domain" {
  description = "The domain name"
  type        = string
}

variable "domain_key" {
  description = "Domain key"
  type        = string
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

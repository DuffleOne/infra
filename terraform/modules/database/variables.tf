variable "name" {
  description = "The name of the user and database"
  type        = string
}

variable "cluster_id" {
  description = "The cluster ID for the DB"
  type        = string
}

variable "enable_pool" {
  description = "Should the DB connection have a connection pool?"
  type        = bool
  default     = false
}

variable "pool_size" {
  description = "How big should the pool size be?"
  type        = number
  default     = 0
}

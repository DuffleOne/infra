resource "digitalocean_database_db" "this" {
  cluster_id = var.cluster_id
  name       = var.name
}

resource "digitalocean_database_user" "this" {
  cluster_id = var.cluster_id
  name       = var.name
}

resource "digitalocean_database_connection_pool" "this" {
  count = var.enable_pool ? 1 : 0

  cluster_id = var.cluster_id
  name       = "${var.name}-pool"
  mode       = "transaction"
  size       = var.pool_size
  db_name    = var.name
  user       = var.name
}

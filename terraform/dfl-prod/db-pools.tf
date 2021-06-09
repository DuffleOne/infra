resource "digitalocean_database_connection_pool" "tfl-default" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "tfl-default"
  mode       = "transaction"
  size       = 11
  db_name    = "tflgame"
  user       = "tflgame"
}

resource "digitalocean_database_connection_pool" "wiki" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "wiki"
  mode       = "transaction"
  size       = 5
  db_name    = "wiki"
  user       = "wiki"
}

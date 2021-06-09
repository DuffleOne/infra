resource "digitalocean_database_user" "auth" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "auth"
}

resource "digitalocean_database_user" "cachet" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "cachet"
}

resource "digitalocean_database_user" "dflimg" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "dflimg"
}

resource "digitalocean_database_user" "tflgame" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "tflgame"
}

resource "digitalocean_database_user" "wiki" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "wiki"
}

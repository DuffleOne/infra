resource "digitalocean_database_cluster" "main-db" {
  name       = "db-postgresql-lon1-17763"
  engine     = "pg"
  version    = "13"
  size       = "db-s-1vcpu-1gb"
  region     = "lon1"
  node_count = 1

  maintenance_window {
    day  = "saturday"
    hour = "03:00:00"
  }
}

resource "digitalocean_database_firewall" "main-fw" {
  cluster_id = digitalocean_database_cluster.main-db.id

  rule {
    type  = "ip_addr"
    value = "217.38.231.160/28"
  }

  rule {
    type  = "ip_addr"
    value = "46.101.93.46"
  }

  rule {
    type  = "ip_addr"
    value = "178.62.120.225"
  }
}

resource "digitalocean_database_db" "auth" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "auth"
}

resource "digitalocean_database_db" "cachet" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "cachet"
}

resource "digitalocean_database_db" "dflimg" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "dflimg"
}

resource "digitalocean_database_db" "tflgame" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "tflgame"
}

resource "digitalocean_database_db" "wiki" {
  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "wiki"
}

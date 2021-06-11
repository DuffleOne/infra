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

  dynamic "rule" {
    for_each = data.terraform_remote_state.cuv_do_prod.outputs.ipv4_addresses
    content {
      type  = "ip_addr"
      value = rule.value
    }
  }
}

module "db_auth" {
  source = "../modules/database"

  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "auth"
}

module "db_cachet" {
  source = "../modules/database"

  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "cachet"
}

module "db_dflimg" {
  source = "../modules/database"

  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "dflimg"
}

module "db_tflgame" {
  source = "../modules/database"

  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "tflgame"
  pool_size  = 11
}

module "db_wiki" {
  source = "../modules/database"

  cluster_id = digitalocean_database_cluster.main-db.id
  name       = "wiki"
  pool_size  = 5
}

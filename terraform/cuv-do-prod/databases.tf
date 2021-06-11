resource "digitalocean_database_cluster" "dflmn_redis" {
  name       = "db-redis-lon1-75276"
  engine     = "redis"
  version    = "6"
  size       = "db-s-1vcpu-1gb"
  region     = "lon1"
  node_count = 1

  maintenance_window {
    day  = "saturday"
    hour = "03:00:00"
  }
}

resource "digitalocean_database_firewall" "dflmn_redis" {
  cluster_id = digitalocean_database_cluster.dflmn_redis.id

  rule {
    type  = "ip_addr"
    value = "217.38.231.160/28"
  }

  rule {
    type  = "k8s"
    value = digitalocean_kubernetes_cluster.dflmn.id
  }
}

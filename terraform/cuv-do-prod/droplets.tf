data "digitalocean_droplets" "dflmn_k8s_nodes" {
  filter {
    key      = "tags"
    values   = ["k8s:${digitalocean_kubernetes_cluster.dflmn.id}"]
    match_by = "exact"
  }
}

output "ipv4_addresses" {
  value = data.digitalocean_droplets.dflmn_k8s_nodes.droplets.*.ipv4_address
}

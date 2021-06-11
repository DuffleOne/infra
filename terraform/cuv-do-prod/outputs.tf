output "ipv4_addresses" {
  value = data.digitalocean_droplets.dflmn_k8s_nodes.droplets.*.ipv4_address
}

output "ipv4_addresses" {
  value = data.digitalocean_droplets.dflmn_k8s_nodes.droplets.*.ipv4_address
}

output "loadbalancer_ip" {
  value = data.digitalocean_loadbalancer.k8s_lb.ip
}

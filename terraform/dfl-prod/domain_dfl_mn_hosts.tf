// Internal
resource "cloudflare_record" "dflmn_int_containers" {
  zone_id = module.dfl_mn.zone_id
  name    = "containers.int"
  type    = "A"
  value   = "192.168.254.110"
}

resource "cloudflare_record" "dflmn_int_galactus" {
  zone_id = module.dfl_mn.zone_id
  name    = "galactus.int"
  type    = "A"
  value   = "192.168.254.5"
}

resource "cloudflare_record" "dflmn_int_wireguard" {
  zone_id = module.dfl_mn.zone_id
  name    = "wireguard.int"
  type    = "A"
  value   = "192.168.254.22"
}

// External
resource "cloudflare_record" "dflmn_ext_containers" {
  zone_id = module.dfl_mn.zone_id
  name    = "containers.ext"
  type    = "A"
  value   = "217.38.231.169"
}

resource "cloudflare_record" "dflmn_ext_galactus" {
  zone_id = module.dfl_mn.zone_id
  name    = "galactus.ext"
  type    = "A"
  value   = "217.38.231.169"
}

resource "cloudflare_record" "dflmn_ext_wireguard" {
  zone_id = module.dfl_mn.zone_id
  name    = "wireguard.ext"
  type    = "A"
  value   = "217.38.231.169"
}

resource "cloudflare_record" "dflmn_k_kubernetes" {
  zone_id = module.dfl_mn.zone_id
  name    = "doproxy.k"
  type    = "A"
  value   = data.terraform_remote_state.cuv_do_prod.outputs.loadbalancer_ip
}

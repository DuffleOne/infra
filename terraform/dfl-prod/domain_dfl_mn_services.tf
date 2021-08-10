// Internal
resource "cloudflare_record" "dflmn_svc_bazarr" {
  zone_id = module.dfl_mn.zone_id
  name    = "bazarr.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_deluge" {
  zone_id = module.dfl_mn.zone_id
  name    = "deluge.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_duplicati" {
  zone_id = module.dfl_mn.zone_id
  name    = "duplicati.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_jackett" {
  zone_id = module.dfl_mn.zone_id
  name    = "jackett.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_overseerr" {
  zone_id = module.dfl_mn.zone_id
  name    = "overseerr.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_radarr" {
  zone_id = module.dfl_mn.zone_id
  name    = "radarr.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_sonarr" {
  zone_id = module.dfl_mn.zone_id
  name    = "sonarr.i"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

// External
resource "cloudflare_record" "dflmn_svc_dash" {
  zone_id = module.dfl_mn.zone_id
  name    = "dash"
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_draw" {
  zone_id = module.dfl_mn.zone_id
  name    = "draw"
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_status" {
  zone_id = module.dfl_mn.zone_id
  name    = "status"
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
}

resource "cloudflare_record" "dflmn_svc_wg" {
  zone_id = module.dfl_mn.zone_id
  name    = "wg"
  type    = "CNAME"
  value   = "wireguard.ext.dfl.mn"
}

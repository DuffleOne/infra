module "georgeflix_uk" {
  source = "../modules/domain"

  domain     = "georgeflix.uk"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw9uQ00gCmDmfYAlSVecQ+SaCNFEhSFcnjrS1hWH3OZvq3MSf7tuyqpHI2mLagsKY12tVLOJWX9mFAZkN77dT59A1GskdHKeUllnYkG6jh0AUD9TIizKMvaTwnwm175NerFKmBK67P6LyzdxyoHsflFGdVcwZOyBRzSR5dGk5vgo5LMGNxSmyWFoOe7IxKHO8C77M0eJ7J85mReN/l367UG7S6vusTfgF8+cDv78acq7QKWhlERggX2S8pHVRZ2Irp6Tdsv3qaC6Uaiy8Kdgy57+rILFyFR4GDA1gMFWPrSAAcBQjFCllOwyrwy6PJqOo3oLETDm2bLMg8OJIvrOxrQIDAQAB"
}

resource "cloudflare_record" "georgeflix_root" {
  zone_id = module.georgeflix_uk.zone_id
  name    = module.georgeflix_uk.domain
  type    = "CNAME"
  value   = "georgeflix.uk.s3-website-eu-west-1.amazonaws.com"
  proxied = true
}

resource "cloudflare_record" "georgeflix_plex" {
  zone_id = module.georgeflix_uk.zone_id
  name    = "plex"
  type    = "CNAME"
  value   = "galactus.ext.dfl.mn"
}

resource "cloudflare_record" "georgeflix_requests" {
  zone_id = module.georgeflix_uk.zone_id
  name    = "requests"
  type    = "CNAME"
  value   = "containers.ext.dfl.mn"
}

resource "cloudflare_record" "georgeflix_sync" {
  zone_id = module.georgeflix_uk.zone_id
  name    = "sync"
  type    = "CNAME"
  value   = "doproxy.k.dfl.mn"
}

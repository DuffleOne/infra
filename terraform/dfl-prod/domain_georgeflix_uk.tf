module "georgeflix_uk" {
  source = "../modules/domain"

  domain     = "georgeflix.uk"
  domain_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw9uQ00gCmDmfYAlSVecQ+SaCNFEhSFcnjrS1hWH3OZvq3MSf7tuyqpHI2mLagsKY12tVLOJWX9mFAZkN77dT59A1GskdHKeUllnYkG6jh0AUD9TIizKMvaTwnwm175NerFKmBK67P6LyzdxyoHsflFGdVcwZOyBRzSR5dGk5vgo5LMGNxSmyWFoOe7IxKHO8C77M0eJ7J85mReN/l367UG7S6vusTfgF8+cDv78acq7QKWhlERggX2S8pHVRZ2Irp6Tdsv3qaC6Uaiy8Kdgy57+rILFyFR4GDA1gMFWPrSAAcBQjFCllOwyrwy6PJqOo3oLETDm2bLMg8OJIvrOxrQIDAQAB"
}

resource "cloudflare_record" "root" {
  zone_id = module.georgeflix_uk.zone_id
  name    = module.georgeflix_uk.domain
  type    = "A"
  value   = "1.2.3.4"
  proxied = true
}

resource "cloudflare_page_rule" "redirect_home" {
  zone_id  = module.georgeflix_uk.zone_id
  target   = "*${module.georgeflix_uk.domain}/*"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://lauraflix.uk/$2"
      status_code = 301
    }
  }
}

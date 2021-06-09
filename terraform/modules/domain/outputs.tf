output "zone_id" {
  value = cloudflare_zone.this.id
}

output "domain" {
  value = cloudflare_zone.this.zone
}

provider "cloudflare" {
    email = "${vars.cloudflare_email}"
    token = "${vars.cloudflare_token}"
    version = "~> 1.0"
}

resource "cloudflare_record" "vlucas_root" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "89.208.243.146"
    type = "A"
}

resource "cloudflare_record" "vlucas_www" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

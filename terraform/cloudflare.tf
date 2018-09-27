provider "cloudflare" {
    email = "${vars.cloudflare_email}"
    token = "${vars.cloudflare_token}"
    version = "~> 1.0"
}

# A Records
resource "cloudflare_record" "vlucas_root" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "89.208.243.146"
    type = "A"
}

resource "cloudflare_record" "vlucas_home" {
    domain = "${var.cloudflare_domain}"
    name = "home"
    value = "119.40.104.70"
    type = "A"
}

#CNAME Records
resource "cloudflare_record" "vlucas_www" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_gitlab" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "${var.cloudflare_domain}"
    type = "CNAME"
}

#Office 365
resource "cloudflare_record" "vlucas_autodiscover" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "autodiscover.outlook.com"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_enterpriseenrollment" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "enterpriseenrollment.manage.microsoft.com"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_enterpriseregistration" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "enterpriseregistration.windows.net"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_lyncdiscover" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "webdir.online.lync.com"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_selector1._domainkey" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "selector1-vlucaswang-com._domainkey.vlucaswang.onmicrosoft.com"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_selector2._domainkey" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "selector2-vlucaswang-com._domainkey.vlucaswang.onmicrosoft.com"
    type = "CNAME"
}

resource "cloudflare_record" "vlucas_sip" {
    domain = "${var.cloudflare_domain}"
    name = "www"
    value = "sipdir.online.lync.com"
    type = "CNAME"
}

#MX Records
resource "cloudflare_record" "vlucas_mx" {
    domain = "${var.cloudflare_domain}"
    name = "${var.cloudflare_domain}"
    value = "vlucaswang-com.mail.protection.outlook.com"
    type = "MX"
    priority = 1
}

#SRV Records
resource "cloudflare_record" "vlucas_sip_tls" {
    domain = "${var.cloudflare_domain}"
    name = "_sip._tls.${var.cloudflare_domain}"
    type = "SRV"
    data   = {
        service  = "_sip"
        proto    = "_tls"
        name     = "${var.cloudflare_domain}."
        priority = 100
        weight   = 1
        port     = 443
        target   = "sipdir.online.lync.com."
    }
}

resource "cloudflare_record" "vlucas_sipfederationtls" {
    domain = "${var.cloudflare_domain}"
    name = "_sipfederationtls._tcp.${var.cloudflare_domain}"
    type = "SRV"
    data   = {
        service  = "_sipfederationtls"
        proto    = "_tcp"
        name     = "${var.cloudflare_domain}."
        priority = 100
        weight   = 1
        port     = 5061
        target   = "sipfed.online.lync.com."
    }
}

#TXT Records
resource "cloudflare_record" "vlucas_spf" {
    domain = "${var.cloudflare_domain}"
    name   = "${var.cloudflare_domain}"
    type   = "TXT"
    value  = "v=spf1 include:spf.protection.outlook.com -all"
}

resource cloudflare_record "vlucas_dmarc" {
  "domain"  = "${var.cloudflare_domain}"
  "name"    = "_dmarc.${var.cloudflare_domain}"
  "type"    = "TXT"
  "value"   = "v=DMARC1; p=none"
}

#CAA Records
resource cloudflare_record "vlucas_issue" {
  "domain"  = "${var.cloudflare_domain}"
  "name"    = "${var.cloudflare_domain}"
  "type"    = "CAA"
  "value"   = "0 issue \"letsencrypt.org\""
}

resource cloudflare_record "vlucas_issuewild" {
  "domain"  = "${var.cloudflare_domain}"
  "name"    = "${var.cloudflare_domain}"
  "type"    = "CAA"
  "value"   = "0 issuewild \"letsencrypt.org\""
}

resource cloudflare_record "vlucas_email" {
  "domain"  = "${var.cloudflare_domain}"
  "name"    = "${var.cloudflare_domain}"
  "type"    = "CAA"
  "value"   = "0 iodef \"mailto:lucas.wang@vlucaswang.com\""
}
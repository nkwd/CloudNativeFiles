provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_key_pair" "publicaccesskey" {
    key_name = "admins-public-ssh-key"
    public_key = ""
}

resource "aws_vpc" "default" {
    cidr_block = "${var.aws_vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "magento2"
        group = "magento-vpc"
    }
}

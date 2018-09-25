variable "aws_region" {
    description = "AWS region"
    default = "ap-southeast-2"
}

data "aws_availability_zones" "available" {}

variable "aws_vpc_cidr" {
    description = "VPC CIDR block"
    default = "172.16.0.0/16"
}

variable "aws_public_cidr" {
    description = "CIDR blocks for public subnets"
    default = [
        "172.16.1.0/24",
        "172.16.2.0/24",
        "172.16.3.0/24",
        "172.16.4.0/24",
        "172.16.5.0/24",
        "172.16.6.0/24"
    ]
}

variable "aws_private_cidr" {
    description = "CIDR blocks for private subnets"
    default = [
        "172.16.101.0/24",
        "172.16.102.0/24",
        "172.16.103.0/24",
        "172.16.104.0/24",
        "172.16.105.0/24",
        "172.16.106.0/24"
    ]
}

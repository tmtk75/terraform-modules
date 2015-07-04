variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" { default = "ap-southeast-2" }

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

module "vpc" {
    source = "../../aws/vpc"
    region = "ap-southeast-2"
    subnet_zone_white = "b"
}

variable "allowed_cidr" {}
module "ec2" {
    source       = "../../aws/ec2"
    public_key   = "${file("./id_rsa.pub")}"
    allowed_cidr = "${var.allowed_cidr}"
    vpc_id       = "${module.vpc.vpc_id}"
    subnet_id    = "${module.vpc.subnet_id_black}"
}

output "public_dns" { value = "${module.ec2.public_dns}" }


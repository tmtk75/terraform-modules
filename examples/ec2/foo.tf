variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" { default = "ap-southeast-1" }

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

module "vpc" {
    source = "../../aws/vpc"
    region = "${var.aws_region}"
    subnet_zone_white = "b"
}

module "ami" {
    source = "../../aws/ami"
    region              = "${var.aws_region}"
    distribution        = "centos"
    version             = "7"
    virtualization_type = "hvm"
}

variable "allowed_cidr" {}
module "ec2" {
    source       = "../../aws/ec2"
    public_key   = "${file("./id_rsa.pub")}"
    allowed_cidr = "${var.allowed_cidr}"
    vpc_id       = "${module.vpc.vpc_id}"
    subnet_id    = "${module.vpc.subnet_id_black}"
    ami          = "${module.ami.ami_id}"
}

output "public_dns" { value = "${module.ec2.public_dns}" }


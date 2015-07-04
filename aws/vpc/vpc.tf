variable "region"            {}
variable "vpc_cidr"          { default = "192.168.0.0/16" }
variable "subnet_cidr_black" { default = "192.168.1.0/24" }
variable "subnet_cidr_white" { default = "192.168.2.0/24" }
variable "subnet_zone_black" { default = "a" }
variable "subnet_zone_white" { default = "c" }
variable "vpc_name" { default = "foobar" }

resource "aws_vpc" "my-vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags {
        Name = "${var.vpc_name}"
	r = "${var.region}"
    }
}

resource "aws_subnet" "black" {
    vpc_id            = "${aws_vpc.my-vpc.id}"
    cidr_block        = "${var.subnet_cidr_black}"
    availability_zone = "${var.region}${var.subnet_zone_black}"
    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_subnet" "white" {
    vpc_id            = "${aws_vpc.my-vpc.id}"
    cidr_block        = "${var.subnet_cidr_white}"
    availability_zone = "${var.region}${var.subnet_zone_white}"
    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_route_table" "igw" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    route {
        gateway_id = "${aws_internet_gateway.gw.id}"
        cidr_block = "0.0.0.0/0"
    }
    tags {
        Name = "${var.vpc_name}"
    }
}

resource "aws_route_table_association" "black" {
    subnet_id      = "${aws_subnet.black.id}"
    route_table_id = "${aws_route_table.igw.id}"
}

resource "aws_route_table_association" "white" {
    subnet_id      = "${aws_subnet.white.id}"
    route_table_id = "${aws_route_table.igw.id}"
}

output "vpc_id"          { value = "${aws_vpc.my-vpc.id}" }
output "subnet_id_black" { value = "${aws_subnet.black.id}" }
output "subnet_id_white" { value = "${aws_subnet.white.id}" }


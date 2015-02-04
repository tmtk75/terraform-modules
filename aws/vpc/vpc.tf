variable "aws_region" {}
variable "cidr" {}
variable "aws_subnet_zone" {
    default = "a"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = "${var.cidr}"
    enable_dns_support = true
    enable_dns_hostnames = true
}

output "vpc_id" {
    value = "${aws_vpc.my-vpc.id}"
}

resource "aws_subnet" "main" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.cidr}"
    availability_zone = "${var.aws_region}${var.aws_subnet_zone}"
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.my-vpc.id}"
}

resource "aws_route_table" "igw" {
    vpc_id = "${aws_vpc.my-vpc.id}"
    route {
        gateway_id = "${aws_internet_gateway.gw.id}"
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "main_and_igw" {
    subnet_id = "${aws_subnet.main.id}"
    route_table_id = "${aws_route_table.igw.id}"
}

output "vpc_id" {
    value = "${aws_vpc.my-vpc.id}"
}

output "subnet_id" {
    value = "${aws_subnet.main.id}"
}

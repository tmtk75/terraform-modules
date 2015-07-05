variable "name"          { default = "foo" }
variable "volume_type"   { default = "gp2" }
variable "allowed_cidr"  {}
variable "public_key"    {}
variable "vpc_id"        {}
variable "subnet_id"     {}
variable "ami"           {}
variable "instance_type" { default = "t2.micro" }

resource "aws_security_group" "foo" {
    name        = "${var.name}"
    description = "${var.name}"
    vpc_id      = "${var.vpc_id}"
    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["${var.allowed_cidr}"]
    }
    tags {
	Name = "${var.name}"
    }
}

resource "aws_key_pair" "foo" {
    key_name   = "${var.name}" 
    public_key = "${var.public_key}"
}

resource "aws_instance" "foo" {
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name      = "${aws_key_pair.foo.key_name}"
    subnet_id     = "${var.subnet_id}"
    security_groups = ["${aws_security_group.foo.id}"]
    associate_public_ip_address = true

    root_block_device {
        volume_type = "${var.volume_type}"
        volume_size = 20
    }
    ebs_block_device {
	device_name = "/dev/xvdj"
        volume_size = 100
    }
    ephemeral_block_device {
        device_name  = "/dev/xvdf"
        virtual_name = "ephemeral0"
    }
    tags {
	Name = "${var.name}"
    }
}

output "public_dns" { value = "${aws_instance.foo.public_dns}" }


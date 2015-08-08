/*
 * A workaround to give multiple values.
 */
variable vpc_subnets {}
variable ec2_count   { default = 2 }
variable ami_id      {}

resource aws_instance "webapp" {
	ami           = "${var.ami_id}"
	instance_type = "t2.micro"
	count         = "${var.ec2_count}"
	subnet_id     = "${element(split(",", var.vpc_subnets), count.index)}"
}

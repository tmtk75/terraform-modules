variable aws_access_key {}
variable aws_secret_key {}
variable aws_region     { default = "ap-southeast-1" }


provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
        region = "${var.aws_region}"
}

module ami {
	source              = "../../aws/ami"
	distribution        = "centos"
	version             = "7"
	virtualization_type = "hvm"
	region              = "${var.aws_region}"
}

module vpc  {
	source            = "../../aws/vpc"
        region            = "${var.aws_region}"
	subnet_zone_black = "a"
	subnet_zone_white = "b"
}

module ec2 {
	source      = "../../aws/subnets"
	ami_id      = "${module.ami.ami_id}"
	vpc_subnets = "${module.vpc.subnet_id_black},${module.vpc.subnet_id_white}"
}

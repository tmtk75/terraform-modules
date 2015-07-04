module "vpc" {
    source     = "../../aws/vpc"
    region = "${var.aws_region}"
    subnet_zone_white = "b"
}

variable "distribution"        {}
variable "version"             {}
variable "region"              {}
variable "virtualization_type" { default = "pv" }

output "ami_id" { value = "${lookup(var.amis, format("%s:%s%s:%s",var.region,var.distribution,var.version,var.virtualization_type))}" }

variable "amis" {
    default = {
        # CentOS 6.5 (x86_64) - Release Media
        # https://aws.amazon.com/marketplace/ordering/ref=dtl_psb_continue?ie=UTF8&productId=f4325b48-37b0-405a-9847-236c64622e3e&region=us-east-1
        "us-east-1:centos6.5:pv"      = "ami-b6bdde86"
        "us-west-1:centos6.5:pv"      = "ami-1a013c5f"
        "us-west-2:centos6.5:pv"      = "ami-42718735"
        "eu-central-1:centos6.5:pv"   = ""
        "eu-west-1:centos6.5:pv"      = "ami-8997afe0"
        "ap-southeast-1:centos6.5:pv" = "ami-a08fd9f2"
        "ap-southeast-2:centos6.5:pv" = "ami-e7138ddd"
        "ap-northeast-1:centos6.5:pv" = "ami-81294380"
        "sa-east-1:centos6.5:pv"      = "ami-7d02a260"

        # CentOS 7 (x86_64) with Updates HVM
        # https://aws.amazon.com/marketplace/ordering?productId=b7ee8a69-ee97-4a49-9e68-afaee216db2e&ref_=dtl_psb_continue&region=us-east-1
        "us-east-1:centos7:hvm"      = "ami-c7d092f7"
        "us-west-1:centos7:hvm"      = "ami-6bcfc42e"
        "us-west-2:centos7:hvm"      = "ami-d440a6e7"
        "eu-central-1:centos7:hvm"   = "ami-7cc4f661"
        "eu-west-1:centos7:hvm"      = "ami-96a818fe"
        "ap-southeast-1:centos7:hvm" = "ami-aea582fc"
        "ap-southeast-2:centos7:hvm" = "ami-bd523087"
        "ap-northeast-1:centos7:hvm" = "ami-89634988"
        "sa-east-1:centos7:hvm"      = "ami-bf9520a2"

        # CoreOS
        # https://coreos.com/docs/running-coreos/cloud-providers/ec2/
	# PV
        "us-east-1:coreos:pv"       = "ami-91ea17fa"
        "us-west-1:coreos:pv"       = "ami-cb67938f"
        "us-west-2:coreos:pv"       = "ami-5f4d486f"
        "eu-central-1:coreos:pv"    = "ami-e8e5ddf5"
        "eu-west-1:coreos:pv"       = "ami-512f5526"
        "ap-southeast-1:coreos:pv"  = "ami-d803078a"
        "ap-southeast-2:coreos:pv"  = "ami-2d641e17"
        "ap-northeast-1:coreos:pv"  = "ami-1c6fca1c"
        "sa-east-1:coreos:pv"       = "ami-b3cb49ae"
	# HVM
        "us-east-1:coreos:hvm"      = "ami-93ea17f8"
        "us-west-1:coreos:hvm"      = "ami-c967938d"
        "us-west-2:coreos:hvm"      = "ami-5d4d486d"
        "eu-central-1:coreos:hvm"   = "ami-eae5ddf7"
        "eu-west-1:coreos:hvm"      = "ami-5f2f5528"
        "ap-southeast-1:coreos:hvm" = "ami-da030788"
        "ap-southeast-2:coreos:hvm" = "ami-23641e19"
        "ap-northeast-1:coreos:hvm" = "ami-1a6fca1a"
        "sa-east-1:coreos:hvm"      = "ami-b1cb49ac"

        # https://aws.amazon.com/marketplace/ordering/ref=dtl_psb_continue?ie=UTF8&productId=f37c8255-1ff9-48bd-b5da-b5046f4fee68&region=us-east-1
        # Amazon Linux AMI (HVM / 64-bit)
        "us-east-1:amazonlinux:hvm"      = "ami-1ecae776"
        "us-west-1:amazonlinux:hvm"      = "ami-e7527ed7"
        "us-west-2:amazonlinux:hvm"      = "ami-d114f295"
        "eu-central-1:amazonlinux:hvm"   = "ami-a8221fb5"
        "eu-west-1:amazonlinux:hvm"      = "ami-a10897d6"
        "ap-southeast-1:amazonlinux:hvm" = "ami-68d8e93a"
        "ap-southeast-2:amazonlinux:hvm" = "ami-fd9cecc7"
        "ap-northeast-1:amazonlinux:hvm" = "ami-cbf90ecb"
        "sa-east-1:amazonlinux:hvm"      = "ami-b52890a8"
    }
}



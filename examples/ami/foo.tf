module "ami-centos" {
    source              = "../../aws/ami"
    distribution        = "centos"
    version             = "7"
    region              = "ap-northeast-1"
    virtualization_type = "hvm"
}

module "ami-coreos" {
    source              = "../../aws/ami"
    distribution        = "coreos"
    version             = ""
    region              = "ap-northeast-1"
    virtualization_type = "hvm"
}

output "ami-centos" { value = "${module.ami-centos.ami_id}" }
output "ami-coreos" { value = "${module.ami-coreos.ami_id}" }

This module provides an EC2 instance which is allowed to access thru ssh from specified cidr.

```
$ terraform get
$ ssh-keygen -t rsa -f id_rsa
$ terraform plan -var allowed_cidr=123.123.123.123/32
$ terraform apply -var allowed_cidr=123.123.123.123/32
$ ssh -i id_rsa centos@`terraform output public_dns`
```

mount ebs
```
$ lsblk
$ file -s /dev/xvdj
$ sudo mkfs -t ext4 /dev/xvdj
$ sudo mkdir /ext/disk1
$ sudo mount /dev/xvdj /ext/disk1
```

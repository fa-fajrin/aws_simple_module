provider "aws" {
    version = "~> 2.0"
    region  = "ap-southeast-1"
}

module "vpc" {
    source       = "../modules/vpc"
    vpc_cidr     = "172.1.0.0/16"
    vpc_id       = "${module.vpc.vpc_id}"
    subnet_count = 2
    subnet_cidr  = [
        "172.1.1.0/24", 
        "172.1.2.0/24"
    ]
}

module "elasticbeanstalk" {
    source      = "../modules/elasticbeanstalk"
    vpc_id      = "${module.vpc.vpc_id}"
    subnet_cidr = "${module.vpc.subnet_cidr}"
}
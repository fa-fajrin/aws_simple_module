variable "eb_name" {
    description = "Name for the Elasticbeanstalk"
    default     = "eb-testing"
}

variable "eb_desc" {
    description = "Short description of the Elasticbeanstalk"
    default     = "This EB is for testing only"
}

variable "enveb_tier" {
    default = "WebServer"
}

variable "enveb_sol_stack_name" {
    default = "Ruby 2.6 with Puma version 2.10.1"
}

variable "enveb_namespace" {
    description = "Unique namespace identifying the option's associated AWS resource"
    default     = "aws:ec2:vpc"
}

variable "vpc_id" {}

variable "subnet_cidr" {}
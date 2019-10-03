// Variables of VPC
variable "vpc_cidr" {
    description = "Specifiy CIDR block on your VPC"
    default     = "172.1.0.0/16"
}

variable "vpc_tenancy" {
    default = "default"
}

variable "vpc_name" {
    description = "Give your VPC name here"
    default     = "vpc-1"
}

// Variables of Subnet
variable "vpc_id" {}

variable "subnet_cidr" {
    description = "Specify CIDR block on your subnet"
    type        = list(string)
    default     = [
        "172.1.1.0/24"
    ]
}

variable "subnet_name" {
    description = "Give your subnet name here"
    default     = "subnet-vpc-1"
}

variable "subnet_count" {
    description = "How many subnet you need in this network"
    default     = 1
}

// Variables of Security Group
variable "allow_tls_name" {
    default = "allow_tls"
}

variable "allow_tls_desc" {
    default = "Security group for TLS"
}

variable "ingress_desc" {
    default = "Allow TLS inbound traffic"
}

variable "egress_desc" {
    default = "Allow all port outbound traffic"
}
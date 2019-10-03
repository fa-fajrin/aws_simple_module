# Set the VPC
resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.vpc_tenancy}"

  tags = {
    Name = "${var.vpc_name}"
  }
}

# Set the subnet of VPC
resource "aws_subnet" "main" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr[count.index]}"
  count      = "${var.subnet_count}"

  tags = {
    Name = "${var.subnet_name}-${count.index+1}"
  }
}

# Set the security
resource "aws_security_group" "allow_tls" {
  name        = "${var.allow_tls_name}"
  description = "${var.allow_tls_desc}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "1"
    description = "${var.ingress_desc}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "${var.egress_desc}"
  }
}
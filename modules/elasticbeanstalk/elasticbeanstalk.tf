resource "aws_elastic_beanstalk_application" "main" {
  name        = "${var.eb_name}"
  description = "${var.eb_desc}"
}

resource "aws_elastic_beanstalk_environment" "envmain" {
  name                = "${aws_elastic_beanstalk_application.main.name}"
  application         = "${aws_elastic_beanstalk_application.main.name}"
  tier                = "${var.enveb_tier}"
  solution_stack_name = "${var.enveb_sol_stack_name}"

  setting {
    namespace = "${var.enveb_namespace}"
    name      = "VPCId"
    value     = "${var.vpc_id}"
  }

  setting {
    namespace = "${var.enveb_namespace}"
    name      = "Subnets"
    value     = "${var.subnet_cidr}"
  }
}
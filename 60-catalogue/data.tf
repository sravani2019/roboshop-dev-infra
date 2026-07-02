

data "aws_ssm_parameter" "catalogue_sg_id" {
    name = "/${var.project}/${var.environment}/catalogue_sg_id"
}
data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project}/${var.environment}/database_subnet_id"
}
data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.environment}/vpc_id"
}
data "aws_ssm_parameter" "backend_lb_listener_arn" {
    name = "/${var.project}/${var.environment}/backend_lb_listener_arn"
}
data "aws_ami" "joindevops" {
  most_recent = true
  owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
 
}

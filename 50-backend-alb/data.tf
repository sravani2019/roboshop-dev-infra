

data "aws_ssm_parameter" "backend_lb_sg_id" {
    name = "/${var.project}/${var.environment}/backend_lb_sg_id"
}
data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project}/${var.environment}/database_subnet_id"
}



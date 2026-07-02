

data "aws_ssm_parameter" "frontend_alb_sg_id" {
    name = "/${var.project}/${var.environment}/backend_lb_sg_id"
}
data "aws_ssm_parameter" "public_subnet_id" {
    name = "/${var.project}/${var.environment}/public_subnet_id"
}

data "aws_ssm_parameter" "certificate_arn" {
    name = "/${var.project}/${var.environment}/certificate_arn"
}


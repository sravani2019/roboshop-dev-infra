

data "aws_ssm_parameter" "catalogue_sg_id" {
    name = "/${var.project}/${var.environment}/catalogue_sg_id"
}
data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project}/${var.environment}/database_subnet_id"
}



resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.proj}/${var.envi}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
  overwrite = true
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/${var.proj}/${var.envi}/public_subnet_id"
  type  = "String"
  value = join(",", module.vpc.public_subnet_id)
  overwrite = true
}

resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/${var.proj}/${var.envi}/private_subnet_id"
  type  = "String"
  value = join(",", module.vpc.private_subnet_id)
  overwrite = true
}

resource "aws_ssm_parameter" "database_subnet_id" {
  name  = "/${var.proj}/${var.envi}/database_subnet_id"
  type  = "String"
  value = join(",", module.vpc.database_subnet_id)
  overwrite = true
}
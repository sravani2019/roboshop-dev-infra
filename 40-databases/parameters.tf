resource "aws_ssm_parameter" "mysql_pass" {
  count = length(var.sg_names)
  name  = "/${var.project}/${var.environment}/mysql_root_password"
  type  = "SecureString"
  value = var.mysql_root_password
  overwrite = true
}
locals {
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    private_subnet_id= split(",", data.aws_ssm_parameter.private_subnet_id.value)[0]
    ami_id = data.aws_ami.joindevops.id
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    common_name = "${var.project}-${var.environment}"
}

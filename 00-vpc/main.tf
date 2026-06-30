module "vpc" {
    source = "git::https://github.com/sravani2019/terraform-aws-vpc.git"
    project = var.proj
    environment = var.envi
    is_peering_required = false

}
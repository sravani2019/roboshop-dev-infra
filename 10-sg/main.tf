module "security_group" {
    count = length(var.sg_names)
    source = "git::https://github.com/sravani2019/terrafrom--aws-sg.git"
    project = var.project
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = replace(var.sg_names[count.index],"_","-")
    

}
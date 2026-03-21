/* module "sg" {
    source = "../../Terraform-sg-module"
    count = length(var.sg_names)
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index],"_","-")
    vpc_id =  data.aws_ssm_parameter.vpc_id.value
}
 */

module "sg" {
    source = "../../Terraform-sg-module"
    for_each = var.sg_names
    project = var.project
    environment = var.environment
    sg_name = replace(each.key,"_","-")
    vpc_id =  data.aws_ssm_parameter.vpc_id.value
}
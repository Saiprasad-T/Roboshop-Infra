module "vpc" {
    source = "../../Terrafrom-vpc-module"
    project = var.project
    environment = var.environment
    is_peering_requried = false
}
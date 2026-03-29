locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}
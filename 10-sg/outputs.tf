output "sg_id" {   #prints the sg id on terminal,* indicates all the id's
    value = module.sg[*].main.id
}
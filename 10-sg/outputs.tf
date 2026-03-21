/* output "sg_id" {   #prints the sg id on terminal,* indicates all the id's
    value = module.sg[*].sg_id
} */

output "sg_id" {
  value = { for k, v in module.sg : k => v.sg_id }
}

#v = value
#k = key
#module.sg[*].sg_id fails because for_each creates a map, and maps must be accessed using a for-expression, not [*].
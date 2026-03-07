output "vpc_id" {
    value = module.vpc.vpc_id
 }

 output "public" {
    value = module.vpc.public
 }

 output "private" {
    value = module.vpc.private
 }
  output "database" {
    value = module.vpc.database
 }
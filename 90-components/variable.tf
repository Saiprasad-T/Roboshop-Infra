variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "instance_type" {
  type        = string
  default = "t3.micro"
}

variable "component" {
    type = string
}

variable "rule_priority" {
   type = number
}
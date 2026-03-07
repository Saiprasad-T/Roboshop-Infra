variable "project" {      
    type = string
    default = "roboshop"
}

variable "environment" {     
    type = string
    default = "dev"
}

variable "sg_names" {
    type = list
    default = [
        "mongodb","redis","rabbitmq","mysql",
        "catalogue","user","cart","shipping","payment",
        "frontend",
        "frontend_alb",
        "backend_alb",
        "bastion"
    ]
}

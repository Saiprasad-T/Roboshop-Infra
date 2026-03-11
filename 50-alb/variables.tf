variable "project" {      
    type = string
    default = "roboshop"
}

variable "environment" {     
    type = string
    default = "dev"
}

variable "alb_tags" {
  type        = map
  default = { }
}

variable "zone_id" {
  type        = string
  default     = "Z054884433KSB5YRIKHVR"
  description = "zone_id"
}

variable "domain" {
  type        = string
  default     = "devopswiththota.online"
}



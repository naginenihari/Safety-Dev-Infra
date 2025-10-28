variable "project_name" {
  default = "safety"
}

variable "environment" {
  default = "dev"
}

variable "sg_names" {
  default = [
    #Databases
    "mongodb","redis","mysql","rabbitmq",
    #Backend
    "catalogue","user","cart","shipping","payment",

    #frontend
    "frontend",
     #Bastion
    "bastion",
    #Frontend Applcation Loadbalancer
    "frontend_alb",
    #Backend Application Loadbalancer
    "backend_alb"
    ]
}
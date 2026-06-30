variable "project" {
        default = "roboshop"
}

variable "environment" {
    
    default = "dev"
}

variable "sg_names" {
    type = list
    default = [
        "mongodb", "user", "mysql", "catalogue", "redis", "rabbitmq", 
        "shipping", "payment", "backend_lb", "frontend", "frontend_alb",
        "bastion", "cart"
    ]
}
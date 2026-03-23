
variable "project"{
    default = "Roboshop"
}
variable "component"{
    type = string
}
variable "health_check_path"{
    default = "/health"
}
variable "port_number"{
    default = 8080
}
variable "app_version" {
    type = string
    default = "v3"
}
variable "rule_priority"{

}
variable "domain_name" {
    default = "kajjam.online"
}
variable "environment" {
    default = "dev"
}
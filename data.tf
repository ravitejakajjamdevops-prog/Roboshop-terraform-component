data "aws_ami" "RetreiveInstanceID" {

    most_recent = true
    owners = ["973714476881"]


    filter {

        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }   


    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  } 
}
data "aws_ssm_parameter" "public_subnet_id" {
    name = "/${var.project}/${var.environment}/Public_subnet_ids"
}
data "aws_ssm_parameter" "sg_id" {
    name = "/${var.project}/${var.environment}/{$var.component}_sg_id"
}
data "aws_ssm_parameter" "frontend-alb_listener_arn" {
    name = "/${var.project}/${var.environment}/frontend-alb_listener_arn"
}
data "aws_ssm_parameter" "Private_subnet_ids" {
    name = "/${var.project}/${var.environment}/Private_subnet_ids"
}
data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.environment}/vpc_id"
}
data "aws_ssm_parameter" "frontend-alb_certificate_arn" {
  name = "/Roboshop/${var.environment}/frontend-alb_certificate_arn"
}
data "aws_ssm_parameter" "backend-lb_listener_arn" {
    name = "/${var.project}/${var.environment}/backend-lb_listener_arn"
}
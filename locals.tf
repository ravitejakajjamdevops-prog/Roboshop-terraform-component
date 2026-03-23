locals {
    ami_id = data.aws_ami.RetreiveInstanceID.id
    Private_subnet_ids = split(",", data.aws_ssm_parameter.Private_subnet_ids.value)[0]
    sg_id = data.aws_ssm_parameter.sg_id.value
    health_check_path = var.component == "frontend" ? "/" : "/health"
    port_number = var.component == "frontend" ? 80 : 8080
    backend-alb_listener_arn = data.aws_ssm_parameter.backend-alb_listener_arn.value
    frontend-alb_listener_arn = data.aws_ssm_parameter.frontend-alb_listener_arn.value
    alb_listener_arn = var.component == "frontend" ? local.frontend-alb_listener_arn : local.backend-alb_listener_arn
    common_tags = {

        Project = var.project
        Environment = var.environment
    }
    frontend-alb_certificate_arn = data.aws_ssm_parameter.frontend-alb_certificate_arn.value
    host_header = var.component == "frontend" ? "${var.component}-${var.environment}.${var.domain_name}" : "${var.component}-${var.environment}.backend-alb.${var.domain_name}"
}
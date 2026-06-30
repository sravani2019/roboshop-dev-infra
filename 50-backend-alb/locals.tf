locals {
    backend_lb_sg_id = data.aws_ssm_parameter.backend_lb_sg_id.value
    private_subnet_id= split(",", data.aws_ssm_parameter.private_subnet_id.value)
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    common_name = "${var.project}-${var.environment}"
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/http"
      message_body = "<h1>Hi,Iam from HTTP Backend ALB</h1>"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "*.backend-lb-${var.environment}.devops90s.space"
  type    = "A"

  alias {
    name                   = aws_lb.backend_lb.dns_name
    zone_id                = aws_lb.backend_lb.zone_id
    evaluate_target_health = true
  }
}
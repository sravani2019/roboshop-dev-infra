resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_subnet_id

  enable_deletion_protection = false#if true we cannot delete via terraform



  tags = merge(
    {
        Name = "${local.common_name}-frontend_lab"
    },
    local.common_tags
  )
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = local.certificate_arn


  default_action {
    type = "fixed-response"

    fixed_response {
      content_type =  "text/html" 
      message_body = "<h1>Hi,Iam from HTTPS FRONTEND ALB</h1>"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.devops90s.space"
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}
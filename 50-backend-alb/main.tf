resource "aws_lb" "backend_lb" {
  name               = "${local.common_name}-backend-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_lb_sg_id]
  subnets            = local.private_subnet_id

  enable_deletion_protection = true #if true we cannot delete via terraform



  tags = merge(
    {
        Name = "${local.common_name}-backend_lb"
    },
    local.common_tags
  )
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type =  "text/html" 
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
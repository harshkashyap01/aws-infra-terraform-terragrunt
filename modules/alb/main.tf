module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name    = "${var.project_name}-${var.environment}-alb"
  vpc_id  = var.vpc_id
  subnets = var.public_subnet_ids

  # Internet-facing ALB
  internal = false

  # Security group
  security_group_name        = "${var.project_name}-${var.environment}-alb-sg"
  security_group_description = "ALB security group for ${var.project_name}-${var.environment}"

  security_group_ingress_rules = {
    http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "Allow HTTP"
      cidr_ipv4   = "0.0.0.0/0"
    }
    https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "Allow HTTPS"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  # Target group
  target_groups = {
    default = {
      name        = "${var.project_name}-${var.environment}-tg"
      protocol    = "HTTP"
      port        = var.target_port
      target_type = var.target_type

      health_check = {
        enabled             = true
        path                = var.health_check_path
        healthy_threshold   = 2
        unhealthy_threshold = 3
        timeout             = 5
        interval            = 30
        matcher             = "200-299"
      }
    }
  }

  # Listeners
  listeners = {
    http-redirect = {
      port     = 80
      protocol = "HTTP"

      default_action = {
        type = "redirect"
        redirect = {
          port        = "443"
          protocol    = "HTTPS"
          status_code = "HTTP_301"
        }
      }
    }

    https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = var.certificate_arn
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"

      default_action = {
        type             = "forward"
        target_group_key = "default"
      }
    }
  }
    Project     = var.project_name
    Environment = var.environment
  }
}
    ManagedBy   = "terraform"
  tags = {


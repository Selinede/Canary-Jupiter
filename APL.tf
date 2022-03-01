

# APPLICATION LOAD BALANCER
# terraform create application load balancer

resource "aws_lb" "Jupiter-alb" {
  name               = "Jupi"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Jupiter-vpc-security-group.id]

  subnet_mapping {
    subnet_id = aws_subnet.Pub_Sub1.id
  
  }

  subnet_mapping {
    subnet_id = aws_subnet.Pub_Sub2.id
  }

  enable_deletion_protection = false

  tags = {
    name = "Jupiter"
  }
}

# TARGET GROUP

resource "aws_alb_target_group" "tg_Jupiter" {
  name        = "Jupiter-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.Jupiter_vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,300"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# LISTENER ON PORT 80 WITH REDIRECT APPLICATION

resource "aws_lb_listener" "Jupiter-alb-listener" {
  load_balancer_arn = aws_lb.Jupiter-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.tg_Jupiter.arn
  }
}
resource "aws_lb" "ALB" {
  name               = "my-alb"
  load_balancer_type = var.load_balancer
  security_groups = [var.pub_seg_sg_id]
  tags = {
    Name = "ALB"
  }
   subnet_mapping {
    subnet_id = var.pubsub1_id
  }
     subnet_mapping {
    subnet_id = var.pubsub2_id
  }
}
  resource "aws_lb_target_group" "ALB_Target" {
  port     = 80
  protocol = "HTTP"
  # vpc_id   = aws_vpc.myvpc.id
  vpc_id   = var.vpc_id
}
 resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB_Target.arn
  }
}
resource "aws_lb_target_group_attachment" "targetinstance1" {
  target_group_arn = aws_lb_target_group.ALB_Target.arn
  target_id = var.web1_id
}
resource "aws_lb_target_group_attachment" "targetinstance2" {
  target_group_arn = aws_lb_target_group.ALB_Target.arn
  target_id = var.web2_id
}
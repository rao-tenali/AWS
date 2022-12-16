# resource "aws_security_group" "sg" {
#   name   = "Tenali"
#   vpc_id = "${aws_vpc.vpc.id}"
# }

# 1st option
# resource "aws_security_group_rule" "srs" {
#   count = length(var.sg_ingress_rules)

#   type              = "ingress"
#   from_port         = var.sg_ingress_rules[count.index].from_port
#   to_port           = var.sg_ingress_rules[count.index].to_port
#   protocol          = var.sg_ingress_rules[count.index].protocol
#   cidr_blocks       = [var.sg_ingress_rules[count.index].cidr_block]
#   description       = var.sg_ingress_rules[count.index].description
#   security_group_id = aws_security_group.sg.id
# }

locals {
  ports_in = [
    80,
    443,
    22
  ]
  ports_out = [
    0
  ]
}

resource "aws_security_group" "internet_facing_alb" {
  name        = "internetfacing-loadbalancer-sg"
  description = "Security group attached to internet facing loadbalancer"
  vpc_id = "${aws_vpc.vpc.id}"

  dynamic "ingress" {
    for_each = toset(locals.ports_in)
    content {
      description = "Web Traffic from internet"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = toset(locals.ports_out)
    content {
      description = "Web Traffic to internet"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  tags = {
    Name = "internetfacing-loadbalancer-sg"
  }
}
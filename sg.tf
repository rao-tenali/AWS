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
# resource "aws_vpc" "vpc" {
#   cidr_block       = "${var.AWS_CIDRBLOCK}"
#   enable_dns_support = "true"
#   enable_dns_hostnames = "true"
#   instance_tenancy = "default"

#   tags = {
#     Name = "vpc"
#   }
# }


# resource "aws_subnet" "prod-subnet-public-1" {
#     vpc_id = "${aws_vpc.vpc.id}"
#     count = length(var.subnet_azs)
#     cidr_block = "${element(var.subnet_cidr,count.index)}"
#     map_public_ip_on_launch = "true"
#     availability_zone = "${element(var.subnet_azs,count.index)}"

#     tags =  {
#         Name = "${element(var.crt_names,count.index)}"
#     }
# }
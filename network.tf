# resource "aws_internet_gateway" "igw"{
#     vpc_id  =   "${aws_vpc.vpc.id}"

#     tags    =   {
#         Name    =   "igw"
#     }
# }

# resource "aws_route_table" "prod-public-crt" {
#     vpc_id = "${aws_vpc.vpc.id}"
    
#     route {
#         //associated subnet can reach everywhere
#         cidr_block = "0.0.0.0/0" 
#         //CRT uses this IGW to reach internet
#         gateway_id = "${aws_internet_gateway.igw.id}" 
#     }
    
#     tags =  {
#         Name = "prod-public-crt"
#     }
# }

# resource "aws_route_table_association" "prod-crta-public-subnet-1"{
#     count = length(var.subnet_azs)
#     subnet_id = element(aws_subnet.prod-subnet-public-1.*.id, count.index)
#     route_table_id = "${aws_route_table.prod-public-crt.id}"
# }


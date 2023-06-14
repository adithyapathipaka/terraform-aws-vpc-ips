data "aws_network_interfaces" "network_interfaces" {
  
  filter {
    name   = "vpc-id"
    values = [var.var.aws_vpc_id]
  }
#    filter {
#     name   = "interface-type"
#     values = ["vpc_endpoint"]
#   }
}
locals {
  is_vpc_passed                         = var.aws_vpc_id == null ? false : true
  is_security_id_passed                 = length(var.aws_security_group_id) > 0 ? true : false
  is_aws_interface_endpoint_type_passed = length(var.aws_interface_endpoint_type) > 0 ? true : false
  aws_ip_address_base_info           = length(data.aws_network_interface.interface_info) > 0 ? [for i in data.aws_network_interface.interface_info : { "subnet-id" : "${i.subnet_id}", "ip_address" : i.private_ips, "availability_zone" : i.availability_zone, "aws_security_group_id" : i.security_groups, "interface_type" : i.interface_type }] : []

}
data "aws_network_interfaces" "network_interfaces" {


  dynamic "filter" {
    for_each = local.is_vpc_passed ? [1] : []
    content {
      name   = "vpc-id"
      values = [var.aws_vpc_id]
    }
  }

  dynamic "filter" {
    for_each = local.is_security_id_passed ? [1] : []
    content {
      name   = "group-id"
      values = var.aws_security_group_id
    }
  }

  dynamic "filter" {
    for_each = local.is_aws_interface_endpoint_type_passed ? [1] : []
    content {
      name   = "interface-type"
      values = var.aws_interface_endpoint_type
    }
  }

}


data "aws_network_interface" "interface_info" {
  count = length(data.aws_network_interfaces.network_interfaces.ids)
  id    = data.aws_network_interfaces.network_interfaces.ids[count.index]
}
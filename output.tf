output "network_interfaces_ids" {
  description = "Network Interfaces IDs"
  value       = data.aws_network_interfaces.network_interfaces.ids

}


output "network_interfaces" {
  description = "Network Interfaces Info"
  value       = data.aws_network_interface.interface_info

}


output "network_interfaces_ips" {

  description = "Network Interfaces IP's"
  value       = flatten([for k, v in data.aws_network_interface.interface_info : v.private_ips])

}


output "aws_ip_address_base_info" {

  description = "Network Interfaces Base Info"
  value       = local.aws_ip_address_base_info

}
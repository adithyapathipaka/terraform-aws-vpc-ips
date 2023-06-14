output "network_interfaces_ids" {
  description = "Network Interfaces ID"
  value = data.aws_network_interfaces.network_interfaces.ids

}


output "network_interfaces" {
  description = "Network Interfaces ID"
  value = data.aws_network_interface.interface_info

}
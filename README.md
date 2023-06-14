# AWS Terraform Module to Pull the IPs from the Network Interfaces
Terraform module to fetch the Ips from AWS VPC Network interfaces

# Usage

```hcl
module "vpc-ips" {
  source  = "adithyapathipaka/vpc-ips/aws"
  version = "1.0.0"
  # insert the 1 required variable here
}
```

## Input Variables
| Input Variable  | Variable Description | Optional | Data Type | Allow Values |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| `aws_vpc_id`  | AWS VPC ID  | `false` | string | |
| `aws_security_group_id`  | AWS Security Group ID | `true` | list(string) | |
| `aws_interface_endpoint_type`  | AWS VPC IP Interface Type  | `true` | list(string) | `"api_gateway_managed", "aws_codestar_connections_managed", "branch", "efa", "gateway_load_balancer", "gateway_load_balancer_endpoint", "global_accelerator_managed", "interface", "iot_rules_managed", "lambda", "load_balancer", "nat_gateway", "network_load_balancer", "quicksight", "transit_gateway", "trunk", "vpc_endpoint"`|

## Output Variables
| Output Variable  | Variable Description  | Data Type |
| ------------- | ------------- | ------------- |
| `network_interfaces_ids`  | Network Interfaces IDs  | list | 
| `network_interfaces`  | Network Interfaces Info | list(string) | 
| `network_interfaces_ips`  | Network Interfaces IP's | list(string) |
| `aws_ip_address_base_info` | Network Interfaces Base Info | list(map)

> **Note**
> All the Outputs will be empty if data is found with the given input

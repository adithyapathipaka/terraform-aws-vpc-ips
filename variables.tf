variable "aws_vpc_id" {
  description = "AWS VPC ID"
  type        = string
  nullable    = true
  validation {
    condition     = length(trimspace(var.aws_vpc_id)) > 0 && can(regex("^(vpc-[a-zA-Z0-9]{8}|vpc-[a-zA-Z0-9]{17})$", trimspace(var.aws_vpc_id)))
    error_message = format("VPC id should be in format `vpc-xxxxxxxx` or `vpc-xxxxxxxxxxxxxxxxx`, where x represents an alphanumeric character and should contains private subnets.")
  }
}

variable "aws_security_group_id" {
  description = "AWS Security Group ID"
  type        = list(string)
  default     = []
  nullable    = false

}

variable "aws_interface_endpoint_type" {
  description = "AWS VPC IP Interface Type"
  type        = list(string)
  default     = []
  nullable    = false
  validation {
    condition     = length(var.aws_interface_endpoint_type) > 0 ? alltrue([for i in var.aws_interface_endpoint_type : contains(["api_gateway_managed", "aws_codestar_connections_managed", "branch", "efa", "gateway_load_balancer", "gateway_load_balancer_endpoint", "global_accelerator_managed", "interface", "iot_rules_managed", "lambda", "load_balancer", "nat_gateway", "network_load_balancer", "quicksight", "transit_gateway", "trunk", "vpc_endpoint"], i)]) : true
    error_message = "Values must be from ${join(",", ["api_gateway_managed", "aws_codestar_connections_managed", "branch", "efa", "gateway_load_balancer", "gateway_load_balancer_endpoint", "global_accelerator_managed", "interface", "iot_rules_managed", "lambda", "load_balancer", "nat_gateway", "network_load_balancer", "quicksight", "transit_gateway", "trunk", "vpc_endpoint"])}"
  }
}
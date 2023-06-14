variable "aws_region" {
  description = "Region for AWS"
  type        = string
  nullable    = false
  default     = "eu-central-1"
  validation {
    condition     = contains(["eu-central-1", "us-east-1"], var.aws_region)
    error_message = "Value must one of ${join(", ", ["eu-central-1", "us-east-1"])}"
  }

}

variable "aws_vpc_id" {
  description = "AWS VPC ID to deploy MWAA"
  type        = string
  nullable    = false
  validation {
    condition     = length(trimspace(var.aws_vpc_id)) > 0 && can(regex("^(vpc-[a-zA-Z0-9]{8}|vpc-[a-zA-Z0-9]{17})$", trimspace(var.aws_vpc_id)))
    error_message = format("VPC id should be in format `vpc-xxxxxxxx` or `vpc-xxxxxxxxxxxxxxxxx`, where x represents an alphanumeric character and should contains private subnets.")
  }
}

variable "security_group_id" {
  description = "AWS VPC ID to deploy MWAA"
  type        = string
  default = null
  nullable    = true
#   validation {
#     condition     = length(trimspace(var.aws_vpc_id)) > 0 && can(regex("^(vpc-[a-zA-Z0-9]{8}|vpc-[a-zA-Z0-9]{17})$", trimspace(var.aws_vpc_id)))
#     error_message = format("VPC id should be in format `vpc-xxxxxxxx` or `vpc-xxxxxxxxxxxxxxxxx`, where x represents an alphanumeric character and should contains private subnets.")
#   }
}
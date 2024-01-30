variable "aws_region" {
  type        = string
  description = "Region AWS"
  default     = "eu-west-3"
}

variable "app" {
  type        = string
  description = "App name"
  default     = "ansible"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnets"
  default     = ["10.0.0.0/18"]
}
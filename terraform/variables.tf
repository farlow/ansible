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

variable "user_name" {
  type        = string
  description = "user name"
  default     = "chris"
}

variable "user_password" {
  type        = string
  description = "user password"
  sensitive = true
}

variable "server_name" {
  type        = list(string)
  description = "server names"
  default     = ["ansible-master", "cible1", "cible2", "cible3"]
}
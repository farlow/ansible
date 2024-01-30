# recupère dynamiquement les zones de disponibilités
data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  name = "${var.app}-VPC"

  cidr                    = var.vpc_cidr
  azs                     = data.aws_availability_zones.available.names
  public_subnets          = var.public_subnets
  create_igw              = true
  enable_nat_gateway      = false

  tags = {
    app       = "${var.app}"
    tf_module = "${var.app}-vpc"
  }
}

module "ansible_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ansible_sg"
  description = "Security group for Ansible"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-tcp","all-icmp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    app       = "${var.app}"
    tf_module = "${var.app}-ansible_sg"
  }
}
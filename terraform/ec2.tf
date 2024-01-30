data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "server1" {
   ami           = data.aws_ami.ubuntu.id
   instance_type = "t2.micro"
   associate_public_ip_address = true
   security_groups = ["${module.ansible_sg.security_group_id}"]
   subnet_id = module.vpc.public_subnets[0]
}
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

data "template_file" "user_data_master" {
  template = file("./user_data_master.sh")
  vars = {
    user_name = var.user_name
    user_password = var.user_password
  }
}

data "template_file" "user_data_cible" {
  template = file("./user_data_cible.sh")
  vars = {
    user_name = var.user_name
    user_password = var.user_password
  }
}

resource "aws_instance" "ansible_master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = ["${module.ansible_sg.security_group_id}"]
  subnet_id = module.vpc.public_subnets[0]
  user_data = data.template_file.user_data_master.rendered

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "ansible_master"
  }
}

resource "aws_instance" "ansible_cible" {
  for_each = toset(var.server_name)

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = ["${module.ansible_sg.security_group_id}"]
  subnet_id = module.vpc.public_subnets[0]
  user_data = data.template_file.user_data_cible.rendered

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "${each.key}"
  }
}
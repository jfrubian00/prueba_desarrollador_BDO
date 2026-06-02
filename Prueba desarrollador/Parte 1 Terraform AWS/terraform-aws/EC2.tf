data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_security_group" "sg" {
  name = "http-security-group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vm" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.instance_type

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [aws_security_group.sg.id]

  associate_public_ip_address = true

  root_block_device {
    volume_size = 30
  }
}
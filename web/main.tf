locals {
  vpc_id        = var.vpc_id
  subnet_id     = var.public_subnet1
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

resource "aws_security_group" "security_group" {
  vpc_id = local.vpc_id
}

resource "aws_security_group_rule" "security_group_rule_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "security_group_rule_egress" {
  type              = "egress"
  to_port           = "-1"
  protocol          = "-1"
  from_port         = "-1"
  security_group_id = aws_security_group.security_group.id
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_instance" "web" {
  ami             = local.image_id
  instance_type   = local.instance_type
  subnet_id       = local.subnet_id
  security_groups = [aws_security_group.security_group.id]
  key_name        = local.key_name

  tags = {
    Name = "Instance Demo"
  }
}
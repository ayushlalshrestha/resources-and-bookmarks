variable "instance_type" {
  default = "t2.micro"
  description = "Enter t2.micro, m1.small, or m1.large. Default is t2.micro."
}

locals {
  subnet_config = {
    VPC      = { CIDR = "10.0.0.0/16" }
    Public1  = { CIDR = "10.0.0.0/24" }
    Public2  = { CIDR = "10.0.1.0/24" }
    Public3  = { CIDR = "10.0.2.0/24" }
  }
}

resource "aws_vpc" "main" {
  cidr_block           = local.subnet_config.VPC.CIDR
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "ACloudGuru"
    Application = aws_stackname
    Network     = "VPC"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.subnet_config.Public1.CIDR
  availability_zone = element(data.aws_availability_zones.available.names, 0)

  tags = {
    Application = aws_stackname
    Network     = "Public1"
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = local.subnet_config.Public2.CIDR
  availability_zone = element(data.aws_availability_zones.available.names, 1)

  tags = {
    Application = aws_stackname
    Network     = "Public2"
  }

  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Application = aws_stackname
    Network     = "Public"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
      "Principal": "*"
    }
  ]
}
POLICY
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Application = aws_stackname
    Network     = "Public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "bastion" {
  name_prefix = "BastionSG-"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Application = "CLI Host"
  }
}

resource "aws_instance" "bastion" {
  ami           = "ami-0e999cbd62129e3b1"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public1.id
  associate_public_ip_address = true

  user_data = <<-EOT
#!/bin/bash -xe
yum install -y ec2-instance-connect
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
EOT

  vpc_security_group_ids = [aws_security_group.bastion.id]

  tags = {
    Name = "CLI Host"
  }
}

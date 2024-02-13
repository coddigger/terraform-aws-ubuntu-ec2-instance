###################################
## Virtual Machine Module - Main ##
###################################

#Create random password
resource "random_string" "password" {
  length  = 10
  special = false
}

# Create Elastic IP for the EC2 instance
resource "aws_eip" "linux-eip" {
  #vpc = true
  domain = "vpc"
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-eip"
    Environment = var.app_environment
    F5SE = var.f5_se
  }
}

# Create EC2 Instance
resource "aws_instance" "linux-server" {
  #  count =                     1
  #ami                         = data.aws_ami.ubuntu-linux-2204.id
  instance_type = var.linux_instance_type
  #  ami                         = "ami-0cf13cb849b11b451" # Ubuntu 20.04 desktop image
  #  instance_type               = "t3.micro"
  #ami = "ami-0536f90611129659d"
  ami = "ami-0c1cb44c4b95e31f4"
  # ami = "ami-0deb1e840a4ccfeff"
  #  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-linux-sg.id]
  associate_public_ip_address = var.linux_associate_public_ip_address
  source_dest_check           = false
  key_name                    = aws_key_pair.key_pair.key_name
  user_data                   = file("aws-user-data.sh")

  # root disk
  root_block_device {
    volume_size           = var.linux_root_volume_size
    volume_type           = var.linux_root_volume_type
    delete_on_termination = true
    encrypted             = true
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.linux_data_volume_size
    volume_type           = var.linux_data_volume_type
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-desktop"
    Environment = var.app_environment
    F5SE        = var.f5_se
  }
}

# Associate Elastic IP to Linux Server
resource "aws_eip_association" "linux-eip-association" {
  #  instance_id   = aws_instance.linux-server.id
  instance_id   = aws_instance.linux-server.id
  allocation_id = aws_eip.linux-eip.id
}

# Define the security group for the Linux server
resource "aws_security_group" "aws-linux-sg" {
  name        = "${lower(var.app_name)}-${var.app_environment}-linux-sg"
  description = "Allow incoming HTTP connections"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTP connections"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming RDP connections"
  }

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming HTTPS connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-linux-sg"
    Environment = var.app_environment
    F5SE        = var.f5_se
  }
}

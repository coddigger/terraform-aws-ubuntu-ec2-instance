# Application Definition 
app_name        = "automationworkshop" # Do NOT enter any spaces
app_environment = "training"           # Dev, Test, Staging, Prod, etc
f5_se           = "nandersen"

# Network
vpc_cidr           = "10.11.0.0/16"
public_subnet_cidr = "10.11.1.0/24"

# AWS Settings
#aws_access_key = "xxx"
#aws_secret_key = "xxx"
aws_region = "eu-north-1"

# Linux Virtual Machine
linux_instance_type               = "t3.medium"
linux_associate_public_ip_address = true
linux_root_volume_size            = 30
linux_root_volume_type            = "gp2"
linux_data_volume_size            = 10
linux_data_volume_type            = "gp2"

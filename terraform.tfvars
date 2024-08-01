# Application Definition 
app_name        = "automationworkshop" # Do NOT enter any spaces
app_environment = "training"           # Dev, Test, Staging, Prod, etc
f5_se           = "n.andersen@f5.com"
time_zone       = "Europe/London"

# Network
vpc_cidr           = "10.11.0.0/16"
public_subnet_cidr = "10.11.1.0/24"

# AWS Settings
#aws_access_key = "xxx"
#aws_secret_key = "xxx"
# aws_region = "eu-north-1"
# aws_az = "eu-north-1b"
aws_region = "eu-north-1"
aws_az = "eu-north-1b"

# Linux Virtual Machine
# linux_instance_type               = "t3.medium"
# linux_instance_type               = "t3.2xlarge"
linux_instance_type               = "m5.4xlarge"
linux_associate_public_ip_address = true
linux_root_volume_size            = 60
linux_root_volume_type            = "gp2"
linux_data_volume_size            = 20
linux_data_volume_type            = "gp2"

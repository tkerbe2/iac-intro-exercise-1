#=================#
# Filter for AMI  #
#=================#

# This is a little beyond the scope of this current lab. However, what this does is create us a simple filter to find the latest version of Amazon Linux.
# Amazon Linux is a free light weight Linux distro based off of Red Hat Enterprise Linux (RHEL) and optimized for AWS.
# https://docs.aws.amazon.com/linux/al2/ug/what-is-amazon-linux.html

data "aws_ami" "amzn_linux" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
#=======================#
# EC2 Instance Resource #
#=======================#

# This will create us a simple free-tier EC2 instance in our lab VPC.

resource "aws_instance" "lab-web-vm" {
  ami                 = data.aws_ami.amzn_linux.id
  instance_type       = "t3.micro"
  subnet_id           = aws_subnet.lab-web-sn.id

  tags = {
    Name        = "lab-1-ec2"
    Environment = "Dev"
  }
}

#=====================#
# Elastic IP Resource #
#=====================#

# This will claim a random AWS owned public IP and assign it to our account.

resource "aws_eip" "lab-web-eip" {

# This assigns the EIP assign to our EC2 instance in the code block above.
  instance = aws_instance.lab-web-vm.id
  domain   = "vpc"
}

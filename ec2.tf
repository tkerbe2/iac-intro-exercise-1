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

resource "aws_instance" "lab-web" {
  ami                 = data.aws_ami.amzn_linux.id
  instance_type       = "t3.micro"
  vpc_id              = aws_vpc.lab-vpc.id
  associate_public_ip = true

  tags = {
    Name        = "lab-1-ec2"
    Environment = "Dev"
  }
}
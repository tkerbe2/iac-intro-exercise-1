#==============#
# VPC Resource #
#==============#

# Here we create our main VPC. I am choosing a /23.
# Go to https://cidr.xyz/ for help.

# Our base IP is 10.10.0.0.
# Our last usable IP is 10.10.1.254.
# A /23 essentially gives us 2 /24 CIDR blocks for a total of 512 IPs.

resource "aws_vpc" "lab-vpc" {
  cidr_block       = "10.10.0.0/23"
  instance_tenancy = "default"

  tags = {
    Name        = "lab-1-vpc"
    Environment = "Dev"
  }
}

#=================#
# Subnet Resource #
#=================#

# Here we create a single subnet for our VM to live in.

resource "aws_subnet" "lab-web" {
  vpc_id     = aws_vpc.lab-vpc.id
  cidr_block = "10.10.0.0/24"

  tags = {
    Name = "lab-web-sn"
    Environment = "Dev"
  }
}


#==================#
# Internet Gateway #
#==================#

# Here we create our internet gateway. This allows our VM to reach the internet and will allow us to reach our VM.
# This resource block below creates the Internet Gateway resource, but it does not attach it.

resource "aws_internet_gateway" "lab-igw" {
  vpc_id = aws_vpc.lab-vpc.id

  tags = {
    Name        = "lab-1-igw"
    Environment = "Dev"
  }
}


#=============================#
# Internet Gateway Attachment #
#=============================#

# Here you will actually attach your Internet Gateway to the VPC.
# If you don't attach an Internet Gateway to the VPC, it will not forward traffic.

resource "aws_internet_gateway_attachment" "lab-igw" {
  internet_gateway_id = aws_internet_gateway.lab-igw.id
  vpc_id              = aws_vpc.lab-vpc.id
}

#=====================#
# Default Route Table #
#=====================#

# By default when you create a VPC in AWS a default route table is also created.
# It is easier to just simply use the default route table and add a 0.0.0.0/0 route to the internet through our IGW.
# Read more about default routes.

resource "aws_default_route_table" "lab-default-rt" {
  default_route_table_id = aws_vpc.lab-vpc.default_route_table_id

# This creates a route that basically says; "If you do not match a local route, go to the Internet Gateway to get to the internet"
# Remember traffic will always match the most specific routes first.
# By default your default route table has a route for your VPC CIDR so any host talking to any other host inside your VPC will have a route.
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab-igw.id
  }

  tags = {
    Name        = "lab-1-default-rt"
    Environment = "Dev"
  }
}
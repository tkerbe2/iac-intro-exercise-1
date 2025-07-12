#======================#
#  AWS Provider Block  #
#======================#

# Since we're using AWS we need to tell Terraform that we're using the AWS provider.
# Here we will also define our region in AWS. I usually use the default which is us-east-1. 

provider "aws" {
  region = "us-east-1"
}

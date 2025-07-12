![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🧪 Creating Basic Resources in AWS with HCP Terraform - Guided Lab

In this lab you will create some basic AWS resources and deploy them using HCP Terraform. 

- [AWS Free Tier](https://aws.amazon.com/free/)

### Resources Created:
This demo creates the following resources:

- VPC
- Subnet
- IGW
- Static Routes
- EC2 Instance
- Security Group
- Security Group Inbound Policy
  
<br>

# 💡 Terms and Concepts

## Files and Structure

In this repo you will notice a bunch of files with the extension of .tf. The .tf file is the Terraform file extension. Any file with this extension will be seen as a configuration file written in HashiCorp Configuration Language. You can generally name TF files what you would like, however there are some best practices for common files with common configuration. The following files below are from HashiCorps Style Guide. 

- A backend.tf file that contains your backend configuration. You can define multiple terraform blocks in your configuration to separate your backend configuration from your Terraform and provider versioning configuration.
- A main.tf file that contains all resource and data source blocks.
- A outputs.tf file that contains all output blocks in alphabetical order.
- A providers.tf file that contains all provider blocks and configuration.
- A terraform.tf file that contains a single terraform block which defines your required_version and required_providers.
- A variables.tf file that contains all variable blocks in alphabetical order.
- A locals.tf file that contains local values. Refer to local values for more information.
- A override.tf file that contains override definitions for your configuration. Terraform loads this and all files ending with _override.tf last. Use them sparingly and add comments to the original resource definitions, as these overrides make your code harder to - reason about. Refer to the override files documentation for more information.

[HashiCorp. (n.d.). Style Guide.](https://developer.hashicorp.com/terraform/language/style)

<br>

## Resource Blocks and Arguments

Terraform is mostly a large combination of resource blocks. These resource blocks define a specific resource type with a name that is only referenced in Terraform (local name). See the example below for a breakdown. 
Terraform arguments are specific settings that can be used to configure a resource a specific type of way. 

```
resource "aws_s3_bucket" "my_bucket" {
  bucket = "tkdev-test-bucket"

  tags = {
    Name        = "tkdev-test-bucket"
    Environment = "Dev"
  }
}
```

- On the first line you will see the `resource`, followed by the type as `aws_s3_bucket`. This is our resource type and the `"my_bucket"` is the local name.
- Next you have the bucket which is an optional argument. 

> 📖 Suggested Reading 
- [Style Guide](https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html)
- [Resource Blocks](https://developer.hashicorp.com/terraform/language/resources/syntax)

<br>

# Lab Steps

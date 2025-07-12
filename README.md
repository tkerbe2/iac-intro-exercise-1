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


> 📖 Suggested Reading 
- [Style Guide]([https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html](https://developer.hashicorp.com/terraform/language/style))
- [Resource Blocks](https://developer.hashicorp.com/terraform/language/resources/syntax)

<br>

# Lab Steps

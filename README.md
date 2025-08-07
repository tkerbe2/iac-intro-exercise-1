![tkdev_space_200](https://github.com/user-attachments/assets/31af05be-97b5-4d4e-82ef-4f23203eb7ac)

<br>


# 🔬 Exercise 1 - The Basics of Terraform Code

In this lab we will quickly cover some basic Terraform concepts and analyze some real functional code. No resources will be created but after this lab you will be ready for your first challenge.

<br>

# 💡 Terms and Concepts

## Files and Structure

In this repo you will notice a bunch of files with the extension of .tf. The .tf file is the Terraform file extension. Any file with this extension will be seen as a configuration file written in HashiCorp Configuration Language. You can generally name TF files what you would like, however there are some best practices for common files with common configuration. The following file names are from the HashiCorp Style Guide. By following these standards your code will be easier for others to read and consume. 

> - A backend.tf file that contains your backend configuration. You can define multiple terraform blocks in your configuration to separate your backend configuration from your Terraform and provider versioning configuration.
> - A main.tf file that contains all resource and data source blocks.
> - A outputs.tf file that contains all output blocks in alphabetical order.
> - A providers.tf file that contains all provider blocks and configuration.
> - A terraform.tf file that contains a single terraform block which defines your required_version and required_providers.
> - A variables.tf file that contains all variable blocks in alphabetical order.
> - A locals.tf file that contains local values. Refer to local values for more information.
> - A override.tf file that contains override definitions for your configuration. Terraform loads this and all files ending with _override.tf last. Use them sparingly and add comments to the original resource definitions, as these overrides make your code harder to - > reason about. Refer to the override files documentation for more information.

[HashiCorp. (n.d.). Style Guide.](https://developer.hashicorp.com/terraform/language/style)

<br>

## Resource Blocks and Arguments

Terraform is mostly a large combination of resource blocks. These resource blocks define a specific resource type with a name that is only referenced in Terraform (local name). See the example below for a breakdown. 
Terraform arguments are specific settings that can be used to configure a resource a specific type of way. Before proceeding I recommend reading all of the links in the Suggested Reading below. The readings below will most likely take anywhere from 15 - 45 minutes.

# 📖 Suggested Reading
- [Style Guide](https://docs.aws.amazon.com/accounts/latest/reference/accounts-welcome.html)
- [Syntax](https://developer.hashicorp.com/terraform/language/syntax)
- [Configuration Syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration)
- [Resource Blocks](https://developer.hashicorp.com/terraform/language/resources/syntax)
- [Resource Behavior](https://developer.hashicorp.com/terraform/language/resources/behavior)
- [Providers](https://developer.hashicorp.com/terraform/language/providers)
- [Provider Configuration](https://developer.hashicorp.com/terraform/language/providers/configuration)

<br>

### AWS S3 Bucket Code Example

```
resource "aws_s3_bucket" "my_bucket" {
  bucket = "tkdev-test-bucket"

  tags = {
    Name        = "tkdev-test-bucket"
    Environment = "Dev"
  }
}
```
<br>

- On the first line you will see the `resource`, followed by the type as `aws_s3_bucket`. This is our resource type and the `"my_bucket"` is the local name.
- Next you have the bucket which is an optional argument. This means that if you don't supply a value or the argument is not present, the argument has a default value or action.
- Lastly, tags are optional and in AWS they're just a way to label and organize resources. You can supply values or leave them blank.

To see all the different ways you can configure a specific resource block you will use [the Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket). You can use this registry to find all resource types and how they can be configured and defined with Terraform. 

### ✍️ AWS VPC Code Exercise

```
resource "aws_vpc" "main_vpc" {
  cidr_block       = "192.168.0.1/24"
  instance_tenancy = "default"
  region           = "us-east-1"

  tags = {
    Name        = "tkdev_vpc"
    Environment = "Prod"
    Department  = "Development"
  }
}
```

For this code block above I want you to answer the following questions:
1. Which arguments are required?
2. Which arguments are optional?
3. What is the resource local name?

Use the registry and search vpc to find the aws_vpc resource page. 

<br>

### 🗹 Answers
(Check here if you're stuck or ready to compare)
Remeber to use the [registry](https://registry.terraform.io/).

<br>

Question 1.
<details>
None, actually
</details>
Question 2.
<details>
All of the arguments are optional
</details>
Question 3.
<details>
main_vpc
</details>

<br>

# ✨ Congratulations!

***

You've finished this lab and have completed the following items:
- ✅ Learned about Terraform files.
- ✅ Learned the basics about resource blocks.
- ✅ Learned the basics about provider blocks.
- ✅ Learned the basics about arguments.
- ✅ Analyzed some Terraform code.


***

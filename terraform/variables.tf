#
# Credentials for test
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

# SSH key
variable "ssh_key_name" {}

# 
variable "aws_amis" {
  default = {
      "ap-northeast-1" = "ami-482a1b26"
  }
}

# Instance Type
variable "instance_type" {
  default = "t2.micro"
}


# Instance Tag Name
variable "tag_names" {
  default = {
    "0" = "win-instance01"
    "1" = "win-instance02"
  }
}

# Iam role
variable "ec2_iam_profile" {
  default = "your-instance-profile-name"
}


# Subnet
variable "subnet" {}

# SecurityGroup
variable "securiy_group" {}

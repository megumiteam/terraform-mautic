provider "aws" {}

variable "site_name" {}
variable "key_name" {}
variable "domain" {}
variable "email" {}
variable "stage" {}
variable "cidr" {}
variable "instance_size" { default = "t2.medium" }
variable "allow_ip" { default = "0.0.0.0/0" }
variable "ssh_public_port" { default = 22 }
variable "mautic_ami" {
  default {
    "ap-south-1" = "ami-a69befc9"
    "eu-west-2" = "ami-cf848eab"
    "eu-west-1" = "ami-88c196fb"
    "ap-northeast-2" = "ami-5d4f9b33"
    "ap-northeast-1" = "ami-7eb6181f"
    "sa-east-1" = "ami-1ef56a72"
    "ca-central-1" = "ami-f7843693"
    "ap-southeast-1" = "ami-3834945b"
    "ap-southeast-2" = "ami-6a6c5309"
    "eu-central-1" = "ami-2ea75d41"
    "us-east-1" = "ami-37c3e020"
    "us-east-2" = "ami-be4812db"
    "us-west-1" = "ami-d8efa5b8"
    "us-west-2" = "ami-8d3e9eed"
  }
}

data "aws_availability_zones" "available" {}
data "aws_region" "current" {
  current = true
}

output "ip" {
  value = "${aws_eip.mautic_web.public_ip}"
}
output "instance_id" {
  value = "${aws_instance.mautic.id}"
}

provider "aws" {
    alias = "oregon"
    region = "us-west-2"
}

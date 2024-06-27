terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_group" "pharmacists" {
  name = "pharmacists"
  path = "/users/"
}

resource "aws_iam_user" "ct" {
  name = "winnie"
  path = "/system/"

  
}

resource "aws_lightsail_instance" "custom" {
  name              = "myinstance"
  availability_zone = "us-east-1b"
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "nano_3_0"
 # key_pair_name = "week2"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>My first server deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
}


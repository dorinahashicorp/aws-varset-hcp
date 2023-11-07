terraform {
required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.63.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
}
}

data "hcp_vault_secrets_app" "Learning-app" {
  app_name = "Learning-app"
}

provider "aws" {
  region = "us-east-2"
}

provider "hcp" {
  client_id = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}

variable "HCP_CLIENT_ID" {
  type = string
}

variable "HCP_CLIENT_SECRET" {
  type = string
}

resource "aws_instance" "dorina-vm" {
  ami           = "ami-00448a337adc93c05" 
  instance_type = "t2.micro" 
  tags = {
    Name = "dorina-vm"
  }
}

output "public_ip" {
  value = aws_instance.dorina-vm.public_ip
}

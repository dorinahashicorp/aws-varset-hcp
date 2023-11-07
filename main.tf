provider "aws" {
  region = "us-east-2" 
}

resource "aws_instance" "dorina-vm" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro" 
  tags = {
    Name = "dorina-vm"
  }
}

data "hcp_vault_secrets_app" "test-app" {
  app_name = "Learning-app"
  secret_name = "AWS_ACCESS_KEY_ID"
}

data "hcp_vault_secrets_app" "test-app" {
  app_name = "Learning-app"
  secret_name = "AWS_SECRET_ACCESS_KEY"
}

output "public_ip" {
  value = aws_instance.dorina-vm.public_ip
}

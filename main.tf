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

output "public_ip" {
  value = aws_instance.dorina-vm.public_ip
}

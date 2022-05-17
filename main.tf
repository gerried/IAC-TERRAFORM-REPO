
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}
resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "Terraform"
  }
}


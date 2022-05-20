
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.azs.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.azs.names[1]
  tags = {
    Name = "private_subnet"
  }
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "Terraform"
  }
}
# count, mostly for list []
/*
resource "aws_instance" "web" {
  count = var.create_instance ? 1 : 0
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "Terraform"
  }
}#/

#for each, mostly used for map {}
#[] list
#{} map
#bool true or false

#for each using list of string, note we need to convert data type to map
resource "aws_instance" "web" {
  for_each = toset(var.instance_types)
  ami           = data.aws_ami.ami.id
  instance_type = each.value
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "Terraform"
  }
}

#for each using map
local {
  instances =[{
    subnet =aws_instance.count.id
  instance_type ="t3.micro"
  },
{
  subnet =aws_instance.count.id
instance_type ="t2.micro"
}]

}


resource "aws_instance" "web" {
  for_each = toset(local.instances)
  ami           = data.aws_ami.ami.id
  instance_type = each.value.instance_type
  subnet_id     = each.value.subnet

  tags = {
    Name = "Terraform"
  }
}*/

data "aws_availability_zones" "azs" {
  state = "available" #it will look at the avail azs#
}

#data.aws_availability_zones.azs.name




data "aws_ami" "ami" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#data.aws_ami.ami.id

data "aws_availability_zones" "azs" {
  state = "available" #it will look at the avail azs#
}

#data.aws_availability_zones.azs.name


#data.aws_ami_ids.amazon_linux_2

/*data "aws_ami" "ami" {
    most_recent      = true
    owners =  ["self"]

     filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "tag:components"
    values = ["ami"]
  }

}*/

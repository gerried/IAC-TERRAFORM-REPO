
variable "vpc_cidr_block" {
  type        = string
  description = "cidr block for VPC"
  default     = "10.0.0.0/16"
}

variable "region" {
  type        = string
  description = "region value"
  default     = "us-east-1"

}

/*variable "ami" {
  type        = string
  description = "ami value"
  default     = "ami-0022f774911c1d690"
}*/

variable "instance_type" {
  type        = string
  description = "instance type value"
  default     = "t2.micro"
}

variable "public_subnet_cidr" {
  type        = string
  description = "public subnet cidr"
  default     = "10.0.0.0/24"

}

variable "private_subnet_cidr" {
  type        = string
  description = "private subnet cidr"
  default     = "10.0.2.0/24"

}

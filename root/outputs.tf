
output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.example.id
}

output "public_ip" {
  description = "public_ip"
  value       = aws_instance.web.public_ip
}

output "ami" {
  description = "ami id"
  value = aws_instance.web.ami
}

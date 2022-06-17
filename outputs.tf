output "instance_public_ip" {
  value       = aws_instance.test.public_ip
  description = "Public IP address for EC2 instance"
  sensitive   = true
}

output "instance_private_ip" {
  value       = aws_instance.test.private_ip
  description = "Private IP address for EC2 instance"
  sensitive   = true
}
output "instance_id" {
  description = "The ID of the created EC2 instance."
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "The public IP of the created EC2 instance."
  value       = aws_instance.this.public_ip
}

output "availability_zone" {
  description = "The availability zone where the EC2 instance is running."
  value       = aws_instance.this.availability_zone
}

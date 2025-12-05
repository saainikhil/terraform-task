variable "region" {
  description = "AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
  default     = "terraform-ec2-demo"
}

variable "ami_id" {
  description = "AMI ID for an Amazon Linux or Ubuntu image in the selected region."
  type        = string
}

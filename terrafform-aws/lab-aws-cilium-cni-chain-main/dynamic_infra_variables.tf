# Below dynamic objects configuration for module VPC 
variable "user_name" {
  description = "Type user name in small caps (case sensetive)"
}
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}
variable "vpc_cidr_base" {
  description = "VPC Subnnet"
  default = "172.16.0.0/16"
}
variable "aws_azs" {
  description = "availability zones"
  default     = "us-east-1a, us-east-1b, us-east-1c"
}
variable "az_count_public" {
  description = "number of active availability zones in VPC"
  default     = "1"
}
variable "az_count_private" {
  description = "number of active availability zones in VPC"
  default     = "3"
}
variable "public_subnet_cidrs" {
  description = "Public CIDRs in VPC"
  default = {
    zone0 = "172.16.4.0/24"
  }
}
variable "private_subnet_cidrs" {
  description = "Private CIDRs in VPC"
  default = {
    zone0 = "172.16.1.0/24"
    zone1 = "172.16.2.0/24"
    zone2 = "172.16.3.0/24"
  }
}
# Below dynamic objects configuration for module EKS 
variable "ami_type" {
  default = "AL2_x86_64"
}
variable "instance_types" {
  default = "t3.medium"
}
variable "capacity_type" {
  default = "ON_DEMAND"
}
# Below dynamic objects configuration for module ec2_env_access
variable "ami" {
  description = "Ec2 ami for vnc"
  default = "ami-0cff7528ff583bf9a"
}
variable "instance_type" {
  description = "Ec2 instance_type for vnc"
  default = "t2.medium"
}
variable "group" {
  description = "Fortigate default group for bookmarks"
  default = "CyberSecTeam-Infra"
}
# Below configuration for disable or enable modules
variable "metrics_server" {
  description = "Choose if enable=true or disable=false this module"
  type = bool
}
variable "kyverno" {
  description = "Choose if enable=true or disable=false this module"
  type = bool
}
variable "argocd" {
  description = "Choose if enable=true or disable=false this module"
  type = bool
}

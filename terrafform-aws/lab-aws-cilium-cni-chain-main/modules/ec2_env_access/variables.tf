variable "ec2_password_var" {
  type = string
  sensitive = true
}
variable "region_var" {
    type = string
}
variable "cluster_name_var" {
}
variable "vpc_id" {
    type = string
}
variable "tags" {
    type = string
}
variable "group" {
  description = "Fortigate default group for bookmarks"
}
variable "token" {
  description = "Fortigate api user token"
  type = string
  sensitive = true
}
variable "hostname" {
  description = "Fortigate ip address"
}
variable "public_subnet" {
  description = "Network_id_for_ec2"
}
variable "ami" {
  description = "Ec2 ami for vnc"
}
variable "instance_type" {
  description = "Ec2 instance_type for vnc"
}
variable "node_iam_role_arn" {
  description = "Nodes role arn"
}
variable "host" {
} 
variable "cluster_ca_certificate" {
}   
variable "wait_before_deploy" {
} 

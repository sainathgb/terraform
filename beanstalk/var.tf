variable "region" {
    type = string
    description = "Enter region "
    default = "us-west-2"
}
variable "accesskey" {
    type = string
    description = " enter the access key "
    default = "AKIAWNH4RMVOLYDTB64L"
}
variable "secret_key"{
    type = string
    description = "enter the secret key"
    default = "BppXUt4xfWVzo+pofGdSMUSDEZb81WE2scLUWwO9"
}
variable "elasticapp" {
  default = "myapp"
}
variable "beanstalkappenv" {
  default = "myenv"
}
variable "solution_stack_name" {
  type = string
}
variable "tier" {
  type = string
}
variable "public_subnets_cidr" {
    type = string
    default = "10.0.1.0/24"
}
variable "public_subnets_cidr2" {
    type = string
    default = "10.0.3.0/24"
}
variable "private_subnets_cidr" {
    type = string
    default = "10.0.2.0/24"
}
variable "availability_zones" {
    type = string 
    default = "us-west-2c"
}
variable "availability_zones2" {
    type = string
    default = "us-west-2a"
}

variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ingress_ports" {
  type = list(number)
}

variable "egress_all" {
  type    = bool
  default = true
}
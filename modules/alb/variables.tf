variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "target_port" {
  type = number
}

variable "target_type" {
  type = string
}

variable "health_check_path" {
  type = string
}

variable "certificate_arn" {
  type = string
}

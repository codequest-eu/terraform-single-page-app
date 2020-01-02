variable "name" {}
variable "code" {}
variable "role_arn" {}

variable "runtime" {
  default = "nodejs12.x"
}

variable "handler" {
  default = "index.handler"
}

variable "tags" {
  default = {}
}

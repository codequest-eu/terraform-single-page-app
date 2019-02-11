variable "name" {}
variable "code" {}
variable "code_bucket" {}
variable "role_arn" {}

variable "runtime" {
  default = "nodejs8.10"
}

variable "handler" {
  default = "index.handler"
}

variable "tags" {
  default = {}
}

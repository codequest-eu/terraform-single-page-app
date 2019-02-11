provider "aws" {
  alias  = "middleware"
  region = "us-east-1"
}

locals {
  hash         = "${md5(var.code)}"
  archive_name = "${var.name}.${local.hash}.zip"
  archive_path = "${path.module}/tmp/${local.archive_name}"
}

data "archive_file" "archive" {
  type        = "zip"
  output_path = "${local.archive_path}"

  source {
    content  = "${var.code}"
    filename = "index.js"
  }
}

resource "aws_s3_bucket_object" "archive" {
  provider = "aws.middleware"
  bucket   = "${var.code_bucket}"
  key      = "${local.archive_name}"
  source   = "${local.archive_path}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_function" "middleware" {
  provider      = "aws.middleware"
  s3_bucket     = "${var.code_bucket}"
  s3_key        = "${aws_s3_bucket_object.archive.id}"
  function_name = "${var.name}"
  role          = "${var.role_arn}"
  runtime       = "${var.runtime}"
  handler       = "${var.handler}"
  publish       = true
  tags          = "${var.tags}"
}

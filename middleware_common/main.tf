provider "aws" {
  alias  = "middleware"
  region = "us-east-1"
}

data "aws_iam_policy_document" "middleware" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "lambda.amazonaws.com",
        "edgelambda.amazonaws.com",
      ]
    }
  }
}

resource "aws_iam_role" "role" {
  name               = "${var.name_prefix}-middleware"
  assume_role_policy = "${data.aws_iam_policy_document.middleware.json}"
}

resource "aws_s3_bucket" "code" {
  provider = "aws.middleware"
  bucket   = "${var.name_prefix}-middleware-code"
  acl      = "private"
  tags     = "${var.tags}"
}

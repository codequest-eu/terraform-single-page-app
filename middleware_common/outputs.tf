output "role_name" {
  value = "${aws_iam_role.role.name}"
}

output "role_arn" {
  value = "${aws_iam_role.role.arn}"
}

output "source_bucket_name" {
  value = "${aws_s3_bucket.code.bucket}"
}

output "source_bucket_arn" {
  value = "${aws_s3_bucket.code.arn}"
}

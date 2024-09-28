output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.id
}

output "iam_user_name" {
  value = aws_iam_user.terraform.name
}

output "iam_access_key_id" {
  value = aws_iam_access_key.terraform.id
}

output "iam_access_key_secret" {
  value     = aws_iam_access_key.terraform.secret
  sensitive = true
}

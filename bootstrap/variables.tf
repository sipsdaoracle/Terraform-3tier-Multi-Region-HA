variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
}

variable "iam_user_name" {
  description = "The name of the IAM user for Terraform"
  type        = string
}

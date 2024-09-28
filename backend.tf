terraform {
  backend "s3" {
    bucket         = "3tier-state-bucket-name"
    key            = "multi-region-ha/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "3tier-state-lock-table-name"
  }
}

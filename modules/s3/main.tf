module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  for_each = toset(var.bucket_names)

  bucket = "${var.project_name}-${var.environment}-${each.value}"

  acl = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.value}"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

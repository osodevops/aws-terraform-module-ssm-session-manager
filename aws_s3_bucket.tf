resource "aws_s3_bucket" "bucket" {
  bucket        = var.s3_bucket_name
  acl           = var.s3_bucket_acl
  force_destroy = var.s3_bucket_force_destroy

  versioning {
    enabled = var.bucket_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = data.aws_kms_alias.kms_alias.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = var.s3_bucket_name
    },
  )
}


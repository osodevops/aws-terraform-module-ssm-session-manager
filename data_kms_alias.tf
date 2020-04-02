data "aws_kms_alias" "kms_alias" {
  name = "alias/${var.kms_alias}"
}


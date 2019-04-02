variable "kms_alias" {
  default = ""
}

variable "s3_bucket_name" {
  default = ""
}

variable "s3_bucket_acl" {
  default = "private"
}

variable "s3_key_prefix" {
  default = ""
}

variable "s3_encryption_enabled" {
  default = false
}

variable "s3_bucket_force_destroy" {
  default = false
}

variable "bucket_versioning" {
  default = false
}

variable "cloudwatch_log_group_name" {
  default =  ""
}

variable "cloudwatch_encryption_enabled" {
  default = false
}

variable "common_tags" {
  type = "map"
}

locals {
  environments = "${substr(var.common_tags["Environment"],0,1)}"
}

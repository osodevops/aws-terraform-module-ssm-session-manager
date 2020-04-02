resource "aws_ssm_document" "session_manager_settings" {
  name            = "SSM-SessionManagerRunShell"
  document_format = "JSON"
  document_type   = "Session"

  content = <<EOF
{
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
        "s3BucketName": "${aws_s3_bucket.bucket.id}",
        "s3KeyPrefix": "${var.s3_key_prefix}",
        "s3EncryptionEnabled": "${var.s3_encryption_enabled ? "true" : "false"}",
        "cloudWatchLogGroupName": "${aws_cloudwatch_log_group.session-manager-cwl-group.name}",
        "cloudWatchEncryptionEnabled": "${var.cloudwatch_encryption_enabled ? "true" : "false"}"
    }
}
EOF

}


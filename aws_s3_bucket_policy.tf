resource "aws_s3_bucket_policy" "" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy = <<POLICY
  {
    "Version":""
    "Statement": [
      {
        "Effect": "Deny",
        "":"",
        "Action": "s3:*",
        "Resource": [
            "${aws_s3_bucket.bucket.arn}/*",
            "${aws_s3_bucket.bucket.arn}"
        ],
        "Condition": {
            "Bool": {
              "aws:SecureTransport": "false"
          }
        }
      }
    ]
  }
  POLICY
}
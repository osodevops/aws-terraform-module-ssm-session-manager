# AWS Terraform Module - SSM Session Manager

This module creates an SSM document that stores preferences for session manager.

Session preferences let you specify a location to store log output for all sessions in your AWS account. 
You can also enable server-side encryption using a AWS KMS key for a specified stream to ensure your session
records are transferred securely.

Requires `aws` provider >= 1.36.0

## Example 

```hcl
module "session-manager" {
  source = "git::ssh://git@github.com/osodevops/aws-terraform-module-ssm-session-manager.git"
  
  s3_bucket_name = "session-logs-bucket"
  s3_key_prefix = "session-logs"
  s3_encryption_enabled = true
  cloudwatch_log_group_name = "project-name/ssm/session-logs"
  cloudwatch_encryption_enabled = true
}
```

## Inputs 

The following arguments are supported:

* `s3_bucket_name` = The name of the bucket where to store session logs. (*Optional setting*)
* `s3_key_prefix` = Set to write output to a sub-folder, enter a sub-folder name. (*Optional setting*)
* `s3_encryption_enabled` = Specify if you want to encrypt bucket objects in S3 (*Optional setting*)
* `cloudwatch_log_group_name` = Sets the name of the log group where session logs will be uploaded to. (*Optional setting*)
* `cloudwatch_encryption_enabled` = Specify if you want to encrypt log data (*Optional setting*)

## Outputs

* `document_name` = Name of the created session manager document.
* `document_arn` = ARN of the created session manager document. You can use this to create IAM policies that prevent changes to session manager preferences. 
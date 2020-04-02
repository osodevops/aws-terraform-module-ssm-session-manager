resource "aws_cloudwatch_log_group" "session-manager-cwl-group" {
  name = var.cloudwatch_log_group_name

  tags = merge(
    var.common_tags,
    {
      "Name" = var.cloudwatch_log_group_name
    },
  )
}


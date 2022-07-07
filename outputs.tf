data "aws_region" "current" {}

output "firehose_arn" {
  description = "The ARN of the created Firehose"
  value       = aws_kinesis_firehose_delivery_stream.this.arn
}

output "firehose_name" {
  description = "The name of the created Firehose"
  value       = aws_kinesis_firehose_delivery_stream.this.name
}

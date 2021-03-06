locals {
  tags = merge({ "SymEnv" = var.environment }, var.tags)
}

module "kinesis_firehose_connector" {
  source = "symopsio/kinesis-firehose-connector/sym"

  environment = var.environment
  name_prefix = var.name_prefix
  tags        = local.tags
}

resource "aws_kinesis_firehose_delivery_stream" "this" {
  name        = "${var.name_prefix}SymDatadogFirehose${title(var.environment)}"
  destination = "http_endpoint"

  s3_configuration {
    role_arn   = module.kinesis_firehose_connector.firehose_role_arn
    bucket_arn = module.kinesis_firehose_connector.firehose_bucket_arn
  }

  http_endpoint_configuration {
    url        = var.datadog_intake_url
    name       = "Datadog"
    access_key = var.datadog_access_key
    role_arn   = module.kinesis_firehose_connector.firehose_role_arn
  }

  tags = local.tags
}

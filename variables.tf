variable "environment" {
  description = "An environment qualifier for the resources this module creates, to support a Terraform SDLC."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "datadog_intake_url" {
  description = "Intake url for Datadog to consume Kinesis Firehose messages"
  type        = string
  default     = "https://aws-kinesis-http-intake.logs.datadoghq.com/v1/input"
}

variable "datadog_access_key" {
  description = "Secret used by the Firehose to send logs to Datadog. DO NOT check this into version control."
  type        = string
  sensitive   = true
}

variable "name_prefix" {
  description = "A prefix for the Firehose and dependency names"
  type        = string
  default     = ""
}

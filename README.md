# datadog-connector

The `datadog-connector` module provisions a Kinesis Firehose which is configured to pipe logs to Datadog. It uses the `kinesis-firehose-connector` to create the Firehose's dependencies.

To provide the Sym Runtime with access to the resources created in this `Connector`, use the `aws/kinesis-firehose` addon in the `runtime-connector` module.

For EU Datadog, make sure to set the `datadog_intake_url` input to `https://aws-kinesis-http-intake.logs.datadoghq.eu/v1/input`!

SECURITY NOTE: The `datadog_access_key` variable is [sensitive](https://learn.hashicorp.com/tutorials/terraform/sensitive-variables). Be sure to manage this value in an environment variable or a `tfvars` file that is excluded from version control. For example, `export TF_VAR_datadog_access_key="my-access-key"`.

```hcl
module "datadog_connector" {
  source  = "symopsio/datadog-connector/sym"
  version = ">= 1.0.0"

  environment = "sandbox"
  datadog_access_key = var.sensitive_access_key
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kinesis_firehose_connector"></a> [kinesis\_firehose\_connector](#module\_kinesis\_firehose\_connector) | symopsio/kinesis-firehose-connector/sym | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datadog_access_key"></a> [datadog\_access\_key](#input\_datadog\_access\_key) | Secret used by the Firehose to send logs to Datadog. DO NOT check this into version control. | `string` | n/a | yes |
| <a name="input_datadog_intake_url"></a> [datadog\_intake\_url](#input\_datadog\_intake\_url) | Intake url for Datadog to consume Kinesis Firehose messages | `string` | `"https://aws-kinesis-http-intake.logs.datadoghq.com/v1/input"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | An environment qualifier for the resources this module creates, to support a Terraform SDLC. | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A prefix for the Firehose and dependency names | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags to apply to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firehose_arn"></a> [firehose\_arn](#output\_firehose\_arn) | The ARN of the created Firehose |
| <a name="output_firehose_name"></a> [firehose\_name](#output\_firehose\_name) | The name of the created Firehose |
<!-- END_TF_DOCS -->

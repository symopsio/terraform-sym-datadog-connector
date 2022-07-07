## datadog-connector

The `datadog-connector` module provisions a Kinesis Firehose which is configured to pipe logs to Datadog. It uses the `kinesis-firehose-connector` to create the Firehose's dependencies.

To provide the Sym Runtime with access to the resources created in this `Connector`, use the `aws/kinesis-firehose` addon in the `runtime-connector` module.

SECURITY NOTE: The `datadog_access_key` variable is [sensitive](https://learn.hashicorp.com/tutorials/terraform/sensitive-variables). Be sure to manage this value in an environment variable or a `tfvars` file that is excluded from version control. For example, `export TF_VAR_datadog_access_key="my-access-key"`.

```hcl
module "datadog_connector" {
  source  = "terraform.symops.com/symopsio/datadog-connector/sym"
  version = ">= 1.0.0"

  environment = "sandbox"
  datadog_access_key = var.sensitive_access_key
}
```

# Configure terraform.
terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"
    }
  }
}

# Configure the New Relic provider.
provider "newrelic" {
  account_id = var.account_id
  api_key    = var.api_key
  region     = var.region
}

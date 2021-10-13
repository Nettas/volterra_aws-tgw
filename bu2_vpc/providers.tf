########################### Versions ##########################
terraform {
  required_version = ">= 0.14.5"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.10"
    }
    aws = ">= 3"
  }
}

########################### Providers ##########################
provider "aws" {
  region = var.awsRegion
}

provider "volterra" {
  timeout      = "90s"
  api_p12_file = var.volterraP12
  # url          = var.api_url
  # api_p12_file = var.api_p12_file
  # api_cert     = var.api_p12_file != "" ? "" : var.api_cert
  # api_key      = var.api_p12_file != "" ? "" : var.api_key
  url = var.volterraUrl
}
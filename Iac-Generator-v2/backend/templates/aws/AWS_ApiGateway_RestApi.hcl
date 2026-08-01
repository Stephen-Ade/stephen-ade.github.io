terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_api_gateway_rest_api" "this" {
  # Properties injected dynamically by IaC-Generator-v2 backend
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_bedrock_model_invocation_logging_configuration" "this" {
  # Properties injected dynamically by IaC-Generator-v2 backend
}

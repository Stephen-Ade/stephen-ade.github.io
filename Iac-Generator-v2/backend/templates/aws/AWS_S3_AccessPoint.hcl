terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_s3_access_point" "this" {
  # Properties injected dynamically by IaC-Generator-v2 backend
}

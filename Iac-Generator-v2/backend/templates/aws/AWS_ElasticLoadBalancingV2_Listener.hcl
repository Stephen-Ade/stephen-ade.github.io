terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_lb_listener" "this" {
  # Properties injected dynamically by IaC-Generator-v2 backend
}

terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "~> 2.0.12"
    }
  }
}

provider "panos" {
  hostname = var.panorama_hostname
  api_key  = var.panorama_api_key
}

resource "panos_service_object" "{{snakeCase name}}" {
  name              = "{{name}}"
  description       = "{{description}}"
  protocol          = "{{protocol}}"
  destination_port = "{{destination_port}}"
  source_port       = "{{source_port}}"
}
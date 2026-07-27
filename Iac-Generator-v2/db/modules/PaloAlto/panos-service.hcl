terraform {
  required_version = ">= 1.8.0, < 2.0.0"

  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "~> 2.0.12"
    }
  }
}

variable "panorama_hostname" {
  type = string
}

variable "panorama_api_key" {
  type      = string
  sensitive = true
}

provider "panos" {
  hostname = var.panorama_hostname
  api_key  = var.panorama_api_key
}

resource "panos_service" "{{tfLabel name}}" {
{{#eq scope_type "device_group"}}
  location = {
    device_group = {
      name = "{{device_group_name}}"
    }
  }
{{/eq}}
{{#eq scope_type "vsys"}}
  location = {
    vsys = {
      name = "{{vsys_name}}"
    }
  }
{{/eq}}
{{#eq scope_type "shared"}}
  location = "shared"
{{/eq}}

  name = "{{name}}"
{{#if description}}
  description = "{{description}}"
{{/if}}

  protocol = {
{{#eq protocol_type "tcp"}}
    tcp = {
      destination_port = "{{destination_port}}"
{{#if source_port}}
      source_port      = "{{source_port}}"
{{/if}}
{{#if enable_timeout_override}}
      override = {
{{#if timeout}}
        timeout           = {{timeout}}
{{/if}}
{{#if halfclose_timeout}}
        halfclose_timeout = {{halfclose_timeout}}
{{/if}}
{{#if timewait_timeout}}
        timewait_timeout  = {{timewait_timeout}}
{{/if}}
      }
{{/if}}
    }
{{/eq}}
{{#eq protocol_type "udp"}}
    udp = {
      destination_port = "{{destination_port}}"
{{#if enable_timeout_override}}
      override = {
{{#if timeout}}
        timeout = {{timeout}}
{{/if}}
      }
{{/if}}
    }
{{/eq}}
  }

{{#if disable_override}}
  disable_override = "{{disable_override}}"
{{/if}}
{{#if tags}}
  tags = {{safeArray tags}}
{{/if}}
}
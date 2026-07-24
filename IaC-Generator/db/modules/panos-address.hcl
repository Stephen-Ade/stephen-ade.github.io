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

resource "panos_address" "{{snakeCase name}}" {
  {{#if (eq scope_type "device_group")}}
  location = {
    device_group = {
      name = "{{device_group_name}}"
    }
  }
  {{/if}}
  {{#if (eq scope_type "shared")}}
  location = { shared = true }
  {{/if}}
  {{#if (eq scope_type "vsys")}}
  location = {
    vsys = "{{vsys_name}}"
  }
  {{/if}}

  name        = "{{name}}"
  description = "{{description}}"
  
  {{address_type}} = "{{value}}"
  
  {{#if tags}}tags = {{{safeArray tags}}}{{/if}}
  {{#if disable_override}}disable_override = {{disable_override}}{{/if}}
}
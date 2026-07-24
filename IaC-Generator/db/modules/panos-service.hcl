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

resource "panos_service" "{{snakeCase name}}" {
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

  protocol = {
    {{protocol}} = {
    {{#if destination_port}}destination_port = "{{destination_port}}"{{/if}}
    {{#if source_port}}source_port      = "{{source_port}}"{{/if}}
    }
  }

  {{#if override_timeout}}override_timeout       = {{override_timeout}}{{/if}}
  {{#if halfclose_timeout}}halfclose_timeout      = {{halfclose_timeout}}{{/if}}
  {{#if timewait_timeout}}timewait_timeout        = {{timewait_timeout}}{{/if}}
  
  {{#if tags}}tags = {{{safeArray tags}}}{{/if}}
  {{#if disable_override}}disable_override = {{disable_override}}{{/if}}
}
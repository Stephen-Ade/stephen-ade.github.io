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

resource "panos_address" "{{tfLabel name}}" {
  {{#if location}}
  location = {
    {{#eq location.scope_type 'device_group'}}
    device_group = {
      name = "{{location.device_group.name}}"
    }
    {{/eq}}
    {{#eq location.scope_type 'vsys'}}
    vsys = {
      name = "{{location.vsys.name}}"
    }
    {{/eq}}
    {{#eq location.scope_type 'shared'}}
    shared = {}
    {{/eq}}
  }
  {{/if}}

  name = "{{name}}"
  {{#if description}}description = "{{description}}"{{/if}}

  {{#eq address_type 'ip_netmask'}}
  ip_netmask = "{{ip_netmask}}"
  {{/eq}}
  {{#eq address_type 'ip_range'}}
  ip_range = "{{ip_range}}"
  {{/eq}}
  {{#eq address_type 'fqdn'}}
  fqdn = "{{fqdn}}"
  {{/eq}}
  {{#eq address_type 'ip_wildcard'}}
  ip_wildcard = "{{ip_wildcard}}"
  {{/eq}}

  {{#if disable_override}}disable_override = "{{disable_override}}"{{/if}}
  {{#if tags}}tags = {{{safeArray tags}}}{{/if}}
}
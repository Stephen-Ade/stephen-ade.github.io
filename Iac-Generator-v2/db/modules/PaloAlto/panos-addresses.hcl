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

resource "panos_addresses" "{{tfLabel name}}" {
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

  addresses = {
{{#each addresses}}
    "{{name}}" = {
{{#if description}}
      description = "{{description}}"
{{/if}}
{{#eq address_type "ip_netmask"}}
      ip_netmask = "{{ip_netmask}}"
{{/eq}}
{{#eq address_type "ip_range"}}
      ip_range = "{{ip_range}}"
{{/eq}}
{{#eq address_type "fqdn"}}
      fqdn = "{{fqdn}}"
{{/eq}}
{{#eq address_type "ip_wildcard"}}
      ip_wildcard = "{{ip_wildcard}}"
{{/eq}}
{{#if disable_override}}
      disable_override = "{{disable_override}}"
{{/if}}
{{#if tags}}
      tags = {{safeArray tags}}
{{/if}}
    }
{{/each}}
  }
}
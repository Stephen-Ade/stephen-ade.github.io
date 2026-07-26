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
{{#eq scope_type "shared"}}
  location = "shared"
{{/eq}}
{{#eq scope_type "vsys"}}
  location = {
    vsys = {
      name = "{{vsys_name}}"
    }
  }
{{/eq}}

  {{{rawOutput addresses_map_hcl}}}
}
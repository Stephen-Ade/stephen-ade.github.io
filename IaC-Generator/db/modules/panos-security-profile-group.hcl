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

resource "panos_security_profile_group" "{{tfLabel name}}" {
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

  name = "{{name}}"
{{#if virus}}
  virus             = {{safeArray virus}}
{{/if}}
{{#if spyware}}
  spyware           = {{safeArray spyware}}
{{/if}}
{{#if vulnerability}}
  vulnerability     = {{safeArray vulnerability}}
{{/if}}
{{#if url_filtering}}
  url_filtering     = {{safeArray url_filtering}}
{{/if}}
{{#if file_blocking}}
  file_blocking     = {{safeArray file_blocking}}
{{/if}}
{{#if wildfire_analysis}}
  wildfire_analysis = {{safeArray wildfire_analysis}}
{{/if}}
{{#if data_filtering}}
  data_filtering    = {{safeArray data_filtering}}
{{/if}}
{{#if gtp}}
  gtp               = {{safeArray gtp}}
{{/if}}
{{#if sctp}}
  sctp              = {{safeArray sctp}}
{{/if}}
{{#if disable_override}}
  disable_override  = "{{disable_override}}"
{{/if}}
}
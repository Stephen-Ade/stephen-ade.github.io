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

resource "panos_pbf_policy_rules" "{{tfLabel name}}" {
{{#eq scope_type "device_group"}}
  location = {
    device_group = {
      name     = "{{device_group_name}}"
      rulebase = "{{rulebase}}"
    }
  }
{{/eq}}
{{#eq scope_type "vsys"}}
  location = {
    vsys = "{{vsys}}"
  }
{{/eq}}
{{#eq scope_type "shared"}}
  location = "shared"
{{/eq}}

  position = {
    where = "{{position_where}}"
  }

  rules = [{
    name                  = "{{name}}"
{{#if description}}
    description           = "{{description}}"
{{/if}}

    source_zones          = {{safeArray source_zones}}
    destination_zones     = {{safeArray destination_zones}}
    source_addresses      = {{safeArray source_addresses}}
    destination_addresses = {{safeArray destination_addresses}}
    
    negate_source         = {{#if negate_source}}true{{else}}false{{/if}}
    negate_destination    = {{#if negate_destination}}true{{else}}false{{/if}}
    
    applications          = {{safeArray applications}}
    services              = {{safeArray services}}

    action                = "{{action}}"
{{#eq action "forward"}}
    forwarding = {
      egress_interface = "{{egress_interface}}"
    }
{{/eq}}

    tag                   = {{safeArray tag}}
    
    disabled              = {{#if disabled}}true{{else}}false{{/if}}
    log_end               = {{#if log_end}}true{{else}}false{{/if}}
{{#if log_setting}}
    log_setting           = "{{log_setting}}"
{{/if}}
  }]
}
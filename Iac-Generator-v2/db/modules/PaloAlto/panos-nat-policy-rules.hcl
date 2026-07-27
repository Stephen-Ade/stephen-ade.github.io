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

resource "panos_nat_policy_rules" "{{tfLabel name}}" {
{{#eq scope_type "device_group"}}
  location = {
    device_group = {
      name     = "{{device_group_name}}"
      rulebase = "{{rulebase}}"
    }
  }
{{/eq}}
{{#eq scope_type "shared"}}
  location = {
    shared = {
      rulebase = "{{rulebase}}"
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

  position = {
    where = "{{position_where}}"
{{#if position_pivot}}
    pivot    = "{{position_pivot}}"
{{/if}}
{{#if position_directly}}
    directly = {{position_directly}}
{{/if}}
  }

  rules = [{
    name                  = "{{name}}"
{{#if description}}
    description           = "{{description}}"
{{/if}}
    disabled              = {{#if disabled}}true{{else}}false{{/if}}

    source_zones          = {{safeArray source_zones}}
    destination_zone      = {{safeArray destination_zone}}
    source_addresses      = {{safeArray source_addresses}}
    destination_addresses = {{safeArray destination_addresses}}
    service               = "{{service}}"
    to_interface          = "{{to_interface}}"
    nat_type              = "{{nat_type}}"
{{#eq source_translation_type "dynamic_ip_and_port"}}

    source_translation = {
      dynamic_ip_and_port = {
{{#eq source_dyn_ip_port_mode "interface_address"}}
        interface_address = {
          interface = "{{source_interface}}"
{{#if source_interface_ip}}
          ip        = "{{source_interface_ip}}"
{{/if}}
        }
{{/eq}}
{{#eq source_dyn_ip_port_mode "translated_address"}}
        translated_address = {{safeArray source_dyn_ip_port_addresses}}
{{/eq}}
      }
    }
{{/eq}}
{{#eq source_translation_type "dynamic_ip"}}

    source_translation = {
      dynamic_ip = {
        translated_address = {{safeArray source_dynamic_ip_addresses}}
      }
    }
{{/eq}}
{{#eq source_translation_type "static_ip"}}

    source_translation = {
      static_ip = {
        translated_address = "{{static_translated_address}}"
        bi_directional      = "{{bi_directional}}"
      }
    }
{{/eq}}
{{#if enable_destination_translation}}

    destination_translation = {
      translated_address = "{{destination_translated_address}}"
{{#if destination_translated_port}}
      translated_port    = {{destination_translated_port}}
{{/if}}
    }
{{/if}}
{{#if tag}}
    tag       = {{safeArray tag}}
{{/if}}
{{#if group_tag}}
    group_tag = "{{group_tag}}"
{{/if}}
  }]
}
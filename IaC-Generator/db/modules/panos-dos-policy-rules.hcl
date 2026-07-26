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

resource "panos_dos_policy_rules" "{{tfLabel name}}" {
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
    pivot = "{{position_pivot}}"
{{/if}}
  }

  rules = [{
    name                  = "{{name}}"
{{#if description}}
    description           = "{{description}}"
{{/if}}

{{#eq source_type "zone"}}
    source_zones          = {{safeArray source_zones}}
{{/eq}}
{{#eq source_type "interface"}}
    source_interfaces     = {{safeArray source_interfaces}}
{{/eq}}

{{#eq destination_type "zone"}}
    destination_zones     = {{safeArray destination_zones}}
{{/eq}}
{{#eq destination_type "interface"}}
    destination_interfaces = {{safeArray destination_interfaces}}
{{/eq}}

    source_addresses      = {{safeArray source_addresses}}
    destination_addresses = {{safeArray destination_addresses}}
    
    negate_source         = {{#if negate_source}}true{{else}}false{{/if}}
    negate_destination    = {{#if negate_destination}}true{{else}}false{{/if}}
    
    source_user           = {{safeArray source_user}}
    service               = {{safeArray service}}
    
{{#if schedule}}
    schedule              = "{{schedule}}"
{{/if}}

    action                = "{{action}}"
{{#eq action "protect"}}
    protect = {
{{#eq protection_type "aggregate"}}
      aggregate = {
        profile = "{{aggregate_profile}}"
      }
{{/eq}}
{{#eq protection_type "classified"}}
      classified = {
        profile            = "{{classified_profile}}"
        classified_address = "{{classified_address_type}}"
      }
{{/eq}}
{{#eq protection_type "aggregate_and_classified"}}
      aggregate = {
        profile = "{{aggregate_profile}}"
      }
      classified = {
        profile            = "{{classified_profile}}"
        classified_address = "{{classified_address_type}}"
      }
{{/eq}}
    }
{{/eq}}

    disabled              = {{#if disabled}}true{{else}}false{{/if}}
    tag                   = {{safeArray tag}}
{{#if log_setting}}
    log_setting           = "{{log_setting}}"
{{/if}}
  }]
}
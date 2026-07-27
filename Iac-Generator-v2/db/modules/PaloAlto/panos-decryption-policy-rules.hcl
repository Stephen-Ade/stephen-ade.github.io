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

resource "panos_decryption_policy_rules" "{{tfLabel name}}" {
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
    
    source_user           = {{safeArray source_user}}
    services              = {{safeArray services}}
    category              = {{safeArray category}}

    action                = "{{action}}"
    profile               = "{{profile}}"

    type = {
{{#eq decryption_type "ssl_forward_proxy"}}
      ssl_forward_proxy = {}
{{/eq}}
{{#eq decryption_type "ssh_proxy"}}
      ssh_proxy = {}
{{/eq}}
{{#eq decryption_type "ssl_inbound_inspection"}}
      ssl_inbound_inspection = {
        certificates = {{safeArray inbound_certificates}}
      }
{{/eq}}
    }

    tag                   = {{safeArray tag}}
{{#if group_tag}}
    group_tag             = "{{group_tag}}"
{{/if}}
    
    disabled              = {{#if disabled}}true{{else}}false{{/if}}
    log_success           = {{#if log_success}}true{{else}}false{{/if}}
    log_fail              = {{#if log_fail}}true{{else}}false{{/if}}
{{#if log_setting}}
    log_setting           = "{{log_setting}}"
{{/if}}
  }]
}
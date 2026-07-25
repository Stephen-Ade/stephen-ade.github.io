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

resource "panos_service" "{{tfLabel name}}" {
  {{#if location}}
  location = {
    {{#eq location.scope_type 'device_group'}}
    device_group = {
      name = "{{location.device_group.name}}"
      {{#if location.device_group.panorama_device}}panorama_device = "{{location.device_group.panorama_device}}"{{/if}}
    }
    {{/eq}}
    {{#eq location.scope_type 'vsys'}}
    vsys = {
      name = "{{location.vsys.name}}"
      {{#if location.vsys.ngfw_device}}ngfw_device = "{{location.vsys.ngfw_device}}"{{/if}}
    }
    {{/eq}}
    {{#eq location.scope_type 'shared'}}
    shared = {}
    {{/eq}}
  }
  {{/if}}

  name = "{{name}}"
  {{#if description}}description = "{{description}}"{{/if}}

  protocol = {
    {{#eq protocol.protocol_type 'tcp'}}
    tcp = {
      destination_port = "{{protocol.tcp.destination_port}}"
      {{#if protocol.tcp.source_port}}source_port      = "{{protocol.tcp.source_port}}"{{/if}}
      {{#if protocol.tcp.enable_timeout_override}}
      override = {
        {{#if protocol.tcp.timeout}}timeout           = {{protocol.tcp.timeout}}{{/if}}
        {{#if protocol.tcp.halfclose_timeout}}halfclose_timeout = {{protocol.tcp.halfclose_timeout}}{{/if}}
        {{#if protocol.tcp.timewait_timeout}}timewait_timeout  = {{protocol.tcp.timewait_timeout}}{{/if}}
      }
      {{/if}}
    }
    {{/eq}}
    {{#eq protocol.protocol_type 'udp'}}
    udp = {
      destination_port = "{{protocol.udp.destination_port}}"
      {{#if protocol.udp.enable_timeout_override}}
      override = {
        {{#if protocol.udp.timeout}}timeout = {{protocol.udp.timeout}}{{/if}}
      }
      {{/if}}
    }
    {{/eq}}
  }

  {{#if disable_override}}disable_override = "{{disable_override}}"{{/if}}
  {{#if tags}}tags = {{{safeArray tags}}}{{/if}}
}
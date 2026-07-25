terraform {
  required_version = ">= 1.8.0"
}

resource "panos_security_profile_group" "{{tfLabel}}" {
  name = "{{name}}"
{{#if description}}
  description = "{{description}}"
{{/if}}
{{#eq scope_type "vsys"}}
  vsys = "{{vsys}}"
{{/eq}}
{{#eq scope_type "device_group"}}
  device_group = "{{device_group}}"
{{/eq}}
{{#if antivirus}}
  antivirus = "{{antivirus}}"
{{/if}}
{{#if anti_spyware}}
  anti_spyware = "{{anti_spyware}}"
{{/if}}
{{#if vulnerability}}
  vulnerability = "{{vulnerability}}"
{{/if}}
{{#if url_filtering}}
  url_filtering = "{{url_filtering}}"
{{/if}}
{{#if wildfire_analysis}}
  wildfire_analysis = "{{wildfire_analysis}}"
{{/if}}
{{#if file_blocking}}
  file_blocking = "{{file_blocking}}"
{{/if}}
{{#if data_filtering}}
  data_filtering = "{{data_filtering}}"
{{/if}}
{{#if dns_security}}
  dns_security = "{{dns_security}}"
{{/if}}
}
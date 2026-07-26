{
  "typeName": "panos/panos_addresses",
  "provider": "panos",
  "vendor": "Palo Alto",
  "deviceType": "Bulk Address Objects",
  "supportedPlatforms": ["terraform"],
  "description": "Manages bulk PAN-OS Address Objects in a single resource (Provider v2.0.x).",
  "properties": {
    "name": {
      "type": "string",
      "description": "The resource name in Terraform (e.g., bulk_dmz_addresses)."
    },
    "scope_type": {
      "type": "string",
      "description": "Where this object lives.",
      "enum": ["vsys", "device_group", "shared"],
      "default": "vsys"
    },
    "vsys_name": {
      "type": "string",
      "description": "The VSYS name (e.g., vsys1).",
      "visibleWhen": { "field": "scope_type", "value": "vsys" }
    },
    "device_group_name": {
      "type": "string",
      "description": "The Panorama device group name.",
      "visibleWhen": { "field": "scope_type", "value": "device_group" }
    },
    "description": {
      "type": "string",
      "description": "Description of the bulk address resource."
    },
    "addresses_json": {
      "type": "array",
      "description": "Array of address object definitions to be bulk-created, injected via rawOutput.",
      "items": {
        "type": "object",
        "properties": {
          "name": {
            "type": "string",
            "description": "PAN-OS object name (e.g., DMZ-Database)."
          },
          "description": {
            "type": "string",
            "description": "Description of the individual address object."
          },
          "address_type": {
            "type": "string",
            "description": "Type of address value. Determines which field is mapped to the HCL 'value' attribute.",
            "enum": ["ip_netmask", "ip_range", "fqdn", "ip_wildcard"]
          },
          "ip_netmask": {
            "type": "string",
            "description": "IP address with CIDR netmask (e.g., 172.16.10.50/32)",
            "visibleWhen": { "field": "address_type", "value": "ip_netmask" }
          },
          "ip_range": {
            "type": "string",
            "description": "IP range with hyphen separator (e.g., 172.16.10.50-172.16.10.60)",
            "visibleWhen": { "field": "address_type", "value": "ip_range" }
          },
          "fqdn": {
            "type": "string",
            "description": "Fully qualified domain name (e.g., db.example.com)",
            "visibleWhen": { "field": "address_type", "value": "fqdn" }
          },
          "ip_wildcard": {
            "type": "string",
            "description": "IP address with wildcard mask (e.g., 10.20.0.0/0.0.255.255)",
            "visibleWhen": { "field": "address_type", "value": "ip_wildcard" }
          },
          "tags": {
            "type": "array",
            "items": { 
              "type": "string",
              "minLength": 1
            },
            "uniqueItems": true,
            "description": "Administrative tags (SafeArray - empty strings strictly prohibited)."
          }
        },
        "required": ["name", "address_type"]
      }
    }
  },
  "required": ["name", "scope_type", "addresses_json"]
}
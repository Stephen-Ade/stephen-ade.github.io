# WARNING: Do not add terraform or provider blocks here to prevent
# conflicts in user environments.

module "{{tfLabel name}}" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "{{moduleVersion}}"

  project_id = {{projectIdExpression}}
  name       = "{{name}}"
  location   = "{{toLower location}}"

{{#if labels}}
  labels = {{{labels}}}
{{/if}}
}
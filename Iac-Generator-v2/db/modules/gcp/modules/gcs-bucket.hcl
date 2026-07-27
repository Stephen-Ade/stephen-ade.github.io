# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.

module "{{tfLabel name}}" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "{{moduleVersion}}"

  # The UI doesn't always provide project_id, so we fallback to a variable
  project_id = "var.project_id" 
  
  name       = "{{name}}"
  location   = "{{location}}"

  # GCP uses "labels" instead of "tags". 
  # Gracefully fallback to empty labels object if UI doesn't send them.
  labels = {{#if labels}}{{{labels}}}{{else}}{}{{/if}}
}
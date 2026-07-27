# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.

module "{{tfLabel Name}}" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "{{moduleVersion}}"

  name        = "{{Name}}"
  location    = "{{Location}}"
  project_id  = "{{#if ProjectId}}{{ProjectId}}{{else}}var.project_id{{/if}}"

  # GCP uses "labels" instead of "tags". 
  # Gracefully fallback to empty labels object if UI doesn't send them.
  labels = {{#if Tags}}{{{Tags}}}{{else}}{}{{/if}}
}
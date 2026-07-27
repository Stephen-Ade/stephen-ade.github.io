# WARNING: Do not add terraform or provider blocks here to prevent crashes in user environments.
# DevSecOps Note: Triple-stache syntax is used to output raw JSON safely.
# The backend strictly stringifies this in server.js to prevent RCE.

module "{{tfLabel PolicyName}}" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
    version = "{{moduleVersion}}"

  name        = "{{PolicyName}}"
  
  # Gracefully fallback to a default if the UI doesn't send a description
  description = "{{#if Description}}{{Description}}{{else}}Managed by IaC-Generator v2{{/if}}"
  
  # Raw JSON output for the policy document
  policy = {{{PolicyDocument}}}

  # Gracefully fallback to empty tags object if UI doesn't send them
  tags = {{#if Tags}}{{{Tags}}}{{else}}{}{{/if}}
}
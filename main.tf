terraform {
required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.76.0"
    }
}
}

data "hcp_vault_secrets_secret" "access_key" {
  app_name    = "Learning-app"
  secret_name = "AWS_ACCESS_KEY_ID"
}

data "hcp_vault_secrets_secret" "secret_key" {
  app_name    = "Learning-app"
  secret_name = "AWS_SECRET_ACCESS_KEY"
}

resource "tfe_variable" "access_key" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = data.hcp_vault_secrets_secret.access_key.secret_value
  category        = "environment"
  description     = "The AWS Access Key"
  variable_set_id = tfe_variable_set.test.id
}

resource "tfe_variable" "secret_key" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = data.hcp_vault_secrets_secret.secret_key.secret_value
  category        = "environment"
  description     = "The AWS Secret Key"
  variable_set_id = tfe_variable_set.test.id
}

resource "tfe_variable_set" "test" {
  name          = "Dorinas AWS Creds"
  description   = "Env Variables for Dorinas AWS creds"
  organization  = "Infragoose"
}

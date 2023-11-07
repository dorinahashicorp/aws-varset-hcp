terraform {
required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.63.0"
    }
}
}

data "hcp_vault_secrets_app" "Learning-app" {
  app_name = "Learning-app"
}

provider "hcp" {
  client_id = var.HCP_CLIENT_ID
  client_secret = var.HCP_CLIENT_SECRET
}

variable "HCP_CLIENT_ID" {
  type = string
}

variable "HCP_CLIENT_SECRET" {
  type = string
}

output "dorina-test" {
  value = data.hcp_vault_secrets_app.Learning-app
  sensitive = true
}

#### we need ot provide our provider details ex: aws , azure, gcp
provider "aws" {
  region = var.region
  access_key = var.accesskey
  secret_key = var.secret_key
}


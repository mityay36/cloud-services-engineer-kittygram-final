terraform {
  required_version = ">= 0.13"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.61.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1"
    }
  }

  backend "s3" {
    endpoint = "https://storage.yandexcloud.net"
    bucket   = "kittygram-tf-state-bucket"
    region   = "ru-central1"
    key      = "tf-state.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}

provider "yandex" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  cloud_id    = var.cloud_id
  folder_id   = var.folder_id
}

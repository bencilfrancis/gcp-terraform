terraform {
  backend "gcs" {
    bucket = "gcp-terraform-321-state-bucket"
    prefix = "gke/runners"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
} 
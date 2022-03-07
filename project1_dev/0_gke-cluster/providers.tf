terraform {
  required_version = ">= 0.12"

  backend "gcs" {
    bucket      = "terraform-state" 
    prefix      = "project1_dev/gke"
    credentials = "../../project1_dev.json"
  }
}

provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
}
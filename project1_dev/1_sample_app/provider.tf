terraform {
  required_version = ">= 0.12"

  backend "gcs" {
    bucket      = "terraform-state" 
    prefix      = "project1_dev/appss"
    credentials = "../../project1_dev.json"
  }
}

provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
}

data "google_container_cluster" "cluster" {
  name     = var.gcp_cluster_name
  location = var.gcp_zone[0]
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.cluster.endpoint}"
  client_certificate     = base64decode(data.google_container_cluster.cluster.master_auth[0].client_certificate)
  client_key             = base64decode(data.google_container_cluster.cluster.master_auth[0].client_key)
  cluster_ca_certificate = base64decode(data.google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}
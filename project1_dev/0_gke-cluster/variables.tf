variable "gcp_credentials" {
  type        = string
  description = "Directory of service account key"
}

variable "gcp_project_id" {
  type        = string
  description = "GKE Project ID"
}

variable "gcp_region" {
  type        = string
  description = "GKE Region"
}

variable "gcp_regional" {
  type        = string
  description = "If GKE is Regional"
}

variable "gcp_cluster_name" {
  type        = string
  description = "GKE Cluster Name"
}

variable "gcp_zone" {
  type        = list(string)
  description = "List of GKE Cluster Zone"
}

variable "gke_network" {
  type        = string
  description = "GKE Cluster VPC Network name"
}

variable "gke_subnetwork" {
  type        = string
  description = "GKE Cluster VPC Subnetwork name"
}

variable "gke_ip_range_pods" {
  type        = string
  description = "GKE Cluster Pod IP range"
}

variable "gke_ip_range_svc" {
  type        = string
  description = "GKE Cluster Service IP range"
}

variable "gke_service_account" {
  type        = string
  description = "GKE Service Account"
}
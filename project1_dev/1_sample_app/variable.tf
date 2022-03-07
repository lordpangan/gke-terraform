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

variable "gcp_cluster_name" {
  type        = string
  description = "GKE Cluster Name"
}

variable "gcp_zone" {
  type        = list(string)
  description = "List of GKE Cluster Zone"
}
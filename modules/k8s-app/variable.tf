variable "gcp_cluster_name" {
  type        = string
  description = "GKE Cluster Name"
}

variable "gcp_region" {
  type        = string
  description = "GKE Cluster Region"
}

variable "gcp_credentials" {
  type        = string
  description = "Directory of service account key"
}

variable "gcp_project_id" {
  type        = string
  description = "GKE Project ID"
}

variable "gcp_zone" {
  type        = string
  description = "List of GKE Cluster Zone"
}

# App Vars
variable "app_name" {
  type        = string
  description = "Deployment name"
}

variable "app_namespace" {
  type        = string
  description = "Deployment namespace"
}

# Deployment Vars
variable "deploy_label" {
  type        = map
  description = "List of Deployment labels"
}

variable "deploy_label_selector" {
  type        = map
  description = "Deployment and Service label selector"
}

variable "deploy_replicas" {
  type        = number
  description = "Deployment replica count"
}

variable "deploy_image" {
  type        = string
  description = "Deployment Image"
}

variable "deploy_limit_cpu" {
  type        = string
  description = "Deployment CPU limit"
}

variable "deploy_limit_memory" {
  type        = string
  description = "Deployment Memory limit"
}

variable "deploy_request_cpu" {
  type        = string
  description = "Deployment CPU request"
}

variable "deploy_request_memory" {
  type        = string
  description = "Deployment Memory request"
}

# Service Vars
variable "svc_port" {
  type        = number
  description = "Service Port"
}

variable "svc_targetport" {
  type        = number
  description = "Service TargetPort"
}
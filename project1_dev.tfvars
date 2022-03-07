# Provider Details
gcp_credentials = "../../project1_dev-key.json"
gcp_project_id  = "project1_dev"
gcp_region      = "europe-west1"

# GKE Details
gcp_cluster_name          = "dev-gke"
# if cluster is gcp_regional
gcp_regional              = "false"
# cluster zone
gcp_zone                  = ["europe-west1-d"]
# cluster network configuratio
gke_network               = "default"
gke_subnetwork            = "default"
gke_ip_range_pods         = ""
gke_ip_range_svc          = ""
# GCP service account email
gke_service_account       = "terraform@project1_dev.iam.gserviceaccount.com"
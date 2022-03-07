module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gcp_cluster_name
  region                     = var.gcp_region
  regional                   = var.gcp_regional
  zones                      = var.gcp_zone
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = var.gke_ip_range_pods
  ip_range_services          = var.gke_ip_range_svc
  http_load_balancing        = true
  horizontal_pod_autoscaling = true
  network_policy             = false
  create_service_account     = false

  node_pools = [
    {
      name               = "k8s-pool"
      machine_type       = "e2-standard-2"
      min_count          = 1
      max_count          = 5
      initial_node_count = 1
      local_ssd_count    = 0
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.gke_service_account
      preemptible        = true
    },
  ]

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "k8s-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
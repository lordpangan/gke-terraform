module "nginxdemos" {
  source           = "../../modules/k8s-app/"
  gcp_cluster_name = var.gcp_cluster_name
  gcp_region       = var.gcp_region
  gcp_zone         = var.gcp_zone[0]
  gcp_credentials  = var.gcp_credentials
  gcp_project_id   = var.gcp_project_id

  # App Variables
  app_name      = "nginxdemos"
  app_namespace = "default"
  deploy_label = {
    app = "nginxdemos"
  }
  deploy_label_selector = {
    app = "nginxdemos"
  }
  deploy_replicas       = 1
  deploy_image          = "nginxdemos/hello"
  deploy_limit_cpu      = "0.5"
  deploy_limit_memory   = "128Mi"
  deploy_request_cpu    = "250m"
  deploy_request_memory = "50Mi"
  svc_port              = 8080
  svc_targetport        = 80
}

resource "kubernetes_ingress_v1" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "dev-ingress"
    annotations = {
      "cloud.google.com/load-balancer-type" = "External"
      "kubernetes.io/ingress.class"         = "gce"
    }
  }
  spec {
    rule {
      http {
        path {
          backend {
            service {
              name = "nginxdemos"
              port {
                number = 8080
              }
            }
          }
          path = "/"
        }
      }
    }
  }
}
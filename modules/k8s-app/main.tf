resource "kubernetes_deployment" "app" {
    metadata {
    name = var.app_name
    labels = var.deploy_label
    namespace = var.app_namespace
  }

  spec {
    replicas = var.deploy_replicas

    selector {
      match_labels = var.deploy_label_selector
    }

    template {
      metadata {
        labels = var.deploy_label
      }

      spec {
        container {
          image = var.deploy_image
          name  = var.app_name

          resources {
            limits = {
              cpu    = var.deploy_limit_cpu
              memory = var.deploy_limit_memory
            }
            requests = {
              cpu    = var.deploy_request_cpu
              memory = var.deploy_request_memory
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
          
          readiness_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }

          startup_probe {
            http_get {
              path = "/"
              port = 80
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app-svc" {
  metadata {
    name = var.app_name
  }
  spec {
    selector = var.deploy_label_selector
    port {
      port        = var.svc_port
      target_port = var.svc_targetport
    }

    type =  "NodePort"
  }
}
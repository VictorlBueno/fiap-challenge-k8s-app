resource "kubernetes_manifest" "app_config" {
  manifest = yamldecode(file("${path.module}/app-config.yaml"))
}

resource "kubernetes_manifest" "app_deployment" {
  manifest = yamldecode(file("${path.module}/app-deployment.yaml"))
}

resource "kubernetes_manifest" "app_hpa" {
  manifest = yamldecode(file("${path.module}/app-hpa.yaml"))
}

resource "kubernetes_manifest" "app_service" {
  manifest = yamldecode(file("${path.module}/app-service.yaml"))
}
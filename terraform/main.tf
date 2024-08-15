resource "kubernetes_namespace" "wordpress" {
  metadata {
    name = "wordpress"
  }
}

resource "kubernetes_resource_quota" "wordpress" {
  metadata {
    name      = "wordpress-quota"
    namespace = kubernetes_namespace.wordpress.metadata[0].name
  }
  spec {
    hard = {
      "requests.cpu"    = "2"
      "requests.memory" = "2Gi"
      "limits.cpu"      = "4"
      "limits.memory"   = "4Gi"
    }
  }
}

resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  namespace  = kubernetes_namespace.wordpress.metadata[0].name

  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "wordpressUsername"
    value = "admin"
  }

  set {
    name  = "wordpressPassword"
    value = "password"
  }

  set {
    name  = "mariadb.auth.rootPassword"
    value = "secretpassword"
  }

  values = [
    file("${path.module}/../helm/values.yaml")
  ]
}
resource "kubernetes_namespace" "wordpress" {
  metadata {
    name = var.wordpress_namespace
  }
}

resource "helm_release" "wordpress" {
  name       = var.wordpress_release_name
  repository = var.wordpress_repository
  chart      = var.wordpress_chart
  namespace  = kubernetes_namespace.wordpress.metadata[0].name

  set {
    name  = "service.type"
    value = var.wordpress_service_type
  }

  set {
    name  = "wordpressUsername"
    value = var.wordpress_username
  }

  set {
    name  = "wordpressPassword"
    value = var.wordpress_password
  }

  set {
    name  = "mariadb.auth.rootPassword"
    value = var.mariadb_root_password
  }

  values = [
    file(var.wordpress_values_file)
  ]
}
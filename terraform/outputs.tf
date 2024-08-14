output "access_instructions" {
  description = "Instructions to access WordPress"
  value = <<EOT
To access WordPress, follow these steps:

1. run:
   kubectl port-forward service/${var.wordpress_release_name} 8080:80 -n ${var.wordpress_namespace}

2. in Your browser go to:
  localhost:8080
EOT
}
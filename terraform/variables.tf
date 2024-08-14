variable "wordpress_namespace" {
  description = "Kubernetes namespace for WordPress"
  type        = string
  default     = "wordpress"
}

variable "wordpress_release_name" {
  description = "Name of the WordPress Helm release"
  type        = string
  default     = "wordpress"
}

variable "wordpress_repository" {
  description = "Helm repository for WordPress chart"
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
}

variable "wordpress_chart" {
  description = "Helm chart name for WordPress"
  type        = string
  default     = "wordpress"
}

variable "wordpress_values_file" {
  description = "Path to the values file for WordPress Helm chart"
  type        = string
  default     = "../helm/values.yaml"
}

variable "wordpress_service_type" {
  description = "Kubernetes service type for WordPress"
  type        = string
  default     = "NodePort"
}

variable "wordpress_username" {
  description = "WordPress admin username"
  type        = string
  default     = "admin"
}

variable "wordpress_password" {
  description = "WordPress admin password"
  type        = string
  default     = "password"
}

variable "mariadb_root_password" {
  description = "MariaDB root password"
  type        = string
  default     = "secretpassword"
}
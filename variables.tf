variable "helm_namespace" {
  description = "The namespace Helm will install the chart under"
}

variable "helm_repository" {
  description = "The repository where the Helm chart is stored"
}
variable "helm_repository_password" {
  default     = ""
  description = "The password of the repository where the Helm chart is stored"
}
variable "helm_repository_username" {
  default     = ""
  description = "The username of the repository where the Helm chart is stored"
}

variable "chart_version" {
  description = "Version of the Helm chart"
}

# Monitoring

variable "enable_monitoring" {
  type        = bool
  default     = false
  description = "Adds metrics Service and Prometheus Operator ServiceMonitor"
}
variable "monitoring_namespace" {
  type        = string
  default     = "monitoring"
  description = "The namespace where Prometheus Operator is installed"
}
variable "servicemonitor_labels" {
  type        = map
  default     = {
    app     = "velero"
    release = "kube-prometheus-stack"
  }
  description = "The labels of the Velero ServiceMonitor"
}
variable "metrics_port" {
  type        = number
  default     = 8085
  description = "The service port for Prometheus metrics"
}

# Backup Storage Location

variable "backup_storage_resource_group" {
  description = "The resource group containing the bucket"
}
variable "backup_storage_account" {
  description = "The storage account containing the bucket"
}
variable "backup_storage_bucket" {
  description = "The bucket to use for backing up"
}

# Credentials

variable "azure_client_id" {
  description = "The Azure Client ID to use to access the storage account"
}
variable "azure_client_secret" {
  description = "The Client Secret to use for the storage backend"
}

variable "azure_resource_group" {
  description = "The Resource Group in where the Client ID resides"
}

variable "azure_subscription_id" {
  description = "The Azure Subscription ID"
}

variable "azure_tenant_id" {
  description = "The Azure Tenant ID"
}

variable "dependencies" {
  type        = list
  description = "Dependency name refering to namespace module"
}

variable "values" {
  default     = ""
  type        = string
  description = "Values to be passed to the Helm Chart"
}

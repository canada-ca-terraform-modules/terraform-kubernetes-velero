resource "helm_release" "velero" {
  name = "velero"

  repository          = var.helm_repository
  repository_username = var.helm_repository_username
  repository_password = var.helm_repository_password

  chart     = "velero"
  version   = var.chart_version
  namespace = var.helm_namespace
  timeout   = 1200

  values = [
    var.values,
  ]

  # Backup Storage Location
  set {
    name  = "configuration.backupStorageLocation.bucket"
    value = var.backup_storage_bucket
  }

  set {
    name  = "configuration.backupStorageLocation.config.resourceGroup"
    value = var.backup_storage_resource_group
  }

  set {
    name  = "configuration.backupStorageLocation.config.storageAccount"
    value = var.backup_storage_account
  }

  # Credentials
  set {
    name  = "credentials.secretContents.cloud"
    value = <<EOF
AZURE_CLIENT_ID: ${var.azure_client_id}
AZURE_CLIENT_SECRET: ${var.azure_client_secret}
AZURE_RESOURCE_GROUP: ${var.azure_resource_group}
AZURE_SUBSCRIPTION_ID: ${var.azure_subscription_id}
AZURE_TENANT_ID: ${var.azure_tenant_id}
EOF
  }
}

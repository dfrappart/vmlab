

resource "azurerm_log_analytics_workspace" "LawMonitor" {
  allow_resource_only_permissions = true
  cmk_for_query_forced            = false
  daily_quota_gb                  = -1
  internet_ingestion_enabled      = true
  internet_query_enabled          = true
  #local_authentication_enabled       = true
  location                           = azurerm_resource_group.RGShared["rsg-monitor"].location
  name                               = "law-monitorlab"
  reservation_capacity_in_gb_per_day = null
  resource_group_name                = azurerm_resource_group.RGShared["rsg-monitor"].name
  retention_in_days                  = 30
  sku                                = "PerGB2018"
  tags = {
    ManagedBy = "Terraform"
    Usage     = "Diag settings Assigned through Policy"
  }
}

resource "random_string" "suffixsta" {
  length  = 4
  special = false
  upper   = false
  lower   = true
  numeric = true
  keepers = {
    # Generate a new suffix only when the resource group name changes
    rg_name = azurerm_resource_group.RGShared["rsg-monitor"].name
  }
}


resource "azurerm_storage_account" "StaMonitor" {
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  allow_nested_items_to_be_public   = true
  allowed_copy_scope                = null
  cross_tenant_replication_enabled  = true
  default_to_oauth_authentication   = false
  edge_zone                         = null
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = false
  is_hns_enabled                    = false
  large_file_share_enabled          = null
  location                          = azurerm_resource_group.RGShared["rsg-monitor"].location
  min_tls_version                   = "TLS1_2"
  name                              = var.CustomizeStaName ? "stamonfrc${random_string.suffixsta.result}" :"stamonfrcebyhte"
  nfsv3_enabled                     = false
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  resource_group_name               = azurerm_resource_group.RGShared["rsg-monitor"].name
  sftp_enabled                      = false
  shared_access_key_enabled         = true
  table_encryption_key_type         = "Service"

  tags = {
    ManagedBy = "Terraform"
    Usage     = "Diag settings Assigned through Policy"
  }

  blob_properties {
    change_feed_enabled           = false
    change_feed_retention_in_days = null
    default_service_version       = null
    last_access_time_enabled      = false
    versioning_enabled            = false
    container_delete_retention_policy {
      days = 7
    }
    delete_retention_policy {
      days = 7
    }
  }
  
  network_rules {
    bypass         = ["AzureServices"]
    default_action = "Deny"
    ip_rules = [
      data.http.myip.response_body
    ]
    virtual_network_subnet_ids = []
  }

  share_properties {
    retention_policy {
      days = 7
    }
  }
}
#############################################################################
#This file is used to define data source refering to Azure existing resources
#############################################################################


#############################################################################
#data source for the subscription


data "azurerm_subscription" "current" {}

data "azurerm_client_config" "currentclientconfig" {}

#############################################################################
#data source for azure ad owners

data "azuread_client_config" "current" {}



data "azuread_group" "aksadmin" {
  display_name     = var.AKSAdminGroupName
  security_enabled = true
}

#############################################################################
#data source for diagnostic settings

data "azurerm_monitor_diagnostic_categories" "keyvaultdiag" {
  resource_id = azurerm_key_vault.Kv.id
  depends_on  = [azurerm_key_vault.Kv]
}

data "azurerm_monitor_diagnostic_categories" "bastiondiag" {
  for_each = { for k, v in var.VnetConfig : k => v if v.EnableBastion == true }
  resource_id = azurerm_bastion_host.Bastion.id
  depends_on  = [azurerm_bastion_host.Bastion]
}

#############################################################################
#data source for public IP

data "http" "myip" {
  url = "https://ipinfo.io/ip"
}




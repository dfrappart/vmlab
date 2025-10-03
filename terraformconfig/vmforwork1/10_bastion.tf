


resource "azurerm_public_ip" "BastionIp" {

  for_each = { for k, v in var.VnetConfig : k => v if v.VnetEnableBastion }
  name     = "pubip-bst-${each.key}"

  location            = azurerm_resource_group.RGVnet[each.key].location
  resource_group_name = azurerm_resource_group.RGVnet[each.key].name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "Bastion" {
  for_each            = { for k, v in var.VnetConfig : k => v if v.VnetEnableBastion }
  name                = "bst-${each.key}"
  location            = azurerm_resource_group.RGVnet[each.key].location
  resource_group_name = azurerm_resource_group.RGVnet[each.key].name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "${data.azurerm_subscription.current.id}/resourceGroups/${azurerm_resource_group.RGVnet[each.key].name}/providers/Microsoft.Network/virtualNetworks/${module.vnet[each.key].VNetFullOutput.name}/subnets/AzureBastionSubnet"
    public_ip_address_id = azurerm_public_ip.BastionIp[each.key].id
  }

  tunneling_enabled      = true
  scale_units            = 2
  shareable_link_enabled = false
  sku                    = "Standard"
  ip_connect_enabled     = true
  kerberos_enabled       = false

  lifecycle {
    ignore_changes = [sku, tunneling_enabled]
  }

}


resource "azurerm_monitor_diagnostic_setting" "BstDiagSettings" {
  for_each = { for k, v in var.VnetConfig : k => v if v.VnetEnableBastion }
  name                       = format("%s-%s", "diag", azurerm_bastion_host.Bastion[each.key].name)
  storage_account_id         = azurerm_storage_account.StaMonitor.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.LawMonitor.id
  target_resource_id         = azurerm_bastion_host.Bastion[each.key].id


  dynamic "enabled_log" {
    for_each = data.azurerm_monitor_diagnostic_categories.bastiondiag[each.key].log_category_types
    content {
      category = enabled_log.value

    }
  }

  lifecycle {
    ignore_changes = [metric]
  }

}
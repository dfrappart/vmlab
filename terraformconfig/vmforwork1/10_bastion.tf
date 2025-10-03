


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



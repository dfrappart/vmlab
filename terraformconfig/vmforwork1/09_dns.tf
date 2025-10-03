
/*
resource "azurerm_private_dns_zone" "PrivateZones" {
  count               = length(var.PrivateDnsZoneList)
  resource_group_name = azurerm_resource_group.RGShared["rsg-dns"].name
  name                = var.PrivateDnsZoneList[count.index]
}


resource "azurerm_dns_zone" "PublicZones" {
  count               = length(var.PublicDnsZoneList)
  name                = var.PublicDnsZoneList[count.index]
  resource_group_name = azurerm_resource_group.RGShared["rsg-dns"].name
}



resource "azurerm_private_dns_zone_virtual_network_link" "AksDnsEastUsLinkToVnetAks" {

  for_each = { for k, v in var.VnetConfig : k => v if v.VnetLinkToAksEasUsDns }

  name                  = "dnslink-to-${module.vnet[each.key].VNetFullOutput.name}"
  virtual_network_id    = module.vnet[each.key].VNetFullOutput.id
  private_dns_zone_name = "privatelink.eastus.azmk8s.io"
  resource_group_name   = azurerm_resource_group.RGShared["rsg-dns"].name

}

resource "azurerm_private_dns_zone_virtual_network_link" "AksDnsFrCeLinkToVnetAks" {

  for_each = { for k, v in var.VnetConfig : k => v if v.VnetLinkToAksFrCeDns }

  name                  = "dnslink-to-${module.vnet[each.key].VNetFullOutput.name}"
  virtual_network_id    = module.vnet[each.key].VNetFullOutput.id
  private_dns_zone_name = "privatelink.francecentral.azmk8s.io"
  resource_group_name   = azurerm_resource_group.RGShared["rsg-dns"].name

}

*/
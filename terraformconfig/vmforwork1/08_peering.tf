/*
resource "azurerm_virtual_network_peering" "PeerAksToAgw" {
  name                         = "peer-${module.vnet["aks"].VNetFullOutput.name}-to-${module.vnet["agw"].VNetFullOutput.name}"
  resource_group_name          = azurerm_resource_group.RGVnet["aks"].name
  virtual_network_name         = module.vnet["aks"].VNetFullOutput.name
  remote_virtual_network_id    = module.vnet["agw"].VNetFullOutput.id
  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "PeerAgwToAks" {
  name                         = "peer-${module.vnet["agw"].VNetFullOutput.name}-to-${module.vnet["aks"].VNetFullOutput.name}"
  resource_group_name          = azurerm_resource_group.RGVnet["agw"].name
  virtual_network_name         = module.vnet["agw"].VNetFullOutput.name
  remote_virtual_network_id    = module.vnet["aks"].VNetFullOutput.id
  allow_forwarded_traffic      = true
  allow_virtual_network_access = true
  use_remote_gateways          = false
}
*/
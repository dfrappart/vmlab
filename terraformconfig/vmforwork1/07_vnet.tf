

module "vnet" {
  source = "github.com/dfrappart/Terra-AZModuletest//Custom_Modules/IaaS_NTW_VNet"

  for_each    = var.VnetConfig
  RgName      = azurerm_resource_group.RGVnet[each.key].name
  AppName     = each.value.AppName
  LawLogId    = azurerm_log_analytics_workspace.LawMonitor.id
  StaLogId    = azurerm_storage_account.StaMonitor.id
  ObjectIndex = each.value.VnetObjectIndex
  Location    = each.value.VnetLocation




  Vnet = {
    AddressSpace   = each.value.VNetAddressSpace
    DnsServers     = each.value.VnetDnsServers
    EnableFlowlogs = true

  }

  Subnets = each.value.SubnetsConfig
}



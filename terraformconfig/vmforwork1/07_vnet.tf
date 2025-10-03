

module "vnet" {
  source = "github.com/dfrappart/Terra-AZModuletest//Custom_Modules/IaaS_NTW_VNet"

  for_each = var.VnetConfig
  RgName   = azurerm_resource_group.RGVnet[each.key].name
  #CustomVnet             = true
  AppName = each.value.AppName
  #EnableVnetDiagSettings = true
  LawLogId    = azurerm_log_analytics_workspace.LawMonitor.id
  StaLogId    = azurerm_storage_account.StaMonitor.id
  ObjectIndex = each.value.VnetObjectIndex
  Location    = each.value.VnetLocation




  Vnet = {
    AddressSpace   = each.value.VNetAddressSpace
    DnsServers     = each.value.VnetDnsServers
    EnableFlowlogs = true

  }

  Subnets = each.value.SubnetsConfig #var.SubnetsConfig
}



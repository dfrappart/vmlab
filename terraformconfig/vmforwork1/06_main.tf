#######################################################
# Base resources

resource "azurerm_resource_group" "RGVnet" {
  for_each = var.VnetConfig
  name     = "rsg-spoke-${each.key}"
  location = each.value.VnetLocation
}



resource "azurerm_resource_group" "RGShared" {
  for_each = var.RgConfig

  location   = each.value.RgLocation
  managed_by = null
  name       = each.value.RgName == "" ? each.key : each.value.RgName
  #tags       = each.value.RgTags
}

resource "azurerm_resource_group" "RGVM" {
  for_each = { for k, v in var.VnetConfig : k => v if v.VmEnabled }
  name     = "rsg-vm-${each.key}"
  location = var.AzureRegion
}
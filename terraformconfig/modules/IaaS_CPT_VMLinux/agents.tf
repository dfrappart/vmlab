
###################################################################################
############################## Agent for VMs ######################################
###################################################################################


resource "azurerm_virtual_machine_extension" "CustomScriptExtension" {

  count                      = var.CustomScriptEnabled ? 1 : 0
  name                       = "${azurerm_windows_virtual_machine.VM.name}-CustomScript"
  publisher                  = "Microsoft.Compute"
  virtual_machine_id         = azurerm_windows_virtual_machine.VM.id
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.10"
  auto_upgrade_minor_version = true

  settings = jsonencode(var.CustomScriptSettings)

  protected_settings = jsonencode(var.CustomScriptProtectedSettings)




  tags = {

  }

}



resource "azurerm_virtual_machine_extension" "domain_join" {
  count                      = var.DomainJoined ? 1 : 0
  name                       = "${azurerm_windows_virtual_machine.VM.name}-DomainJoin"
  virtual_machine_id         = azurerm_windows_virtual_machine.VM.id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = jsonencode({

    Name    = var.DomainName
    User    = var.DomainJoinAccount
    Restart = "true"
    OUPath  = var.DomainOuPath
    Options = "3"

    }

  )


  protected_settings = jsonencode({

    Password = var.DomainJoinAccountPassword
  })


}

resource "azurerm_virtual_machine_extension" "EntraIdAuth" {
  count                      = var.EntraIdAuthEnabled ? 1 : 0
  name                       = "${azurerm_windows_virtual_machine.VM.name}-EntraIdAuth"
  virtual_machine_id         = azurerm_windows_virtual_machine.VM.id
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  type                       = "AADLoginForWindows"
  type_handler_version       = "2.0"
  auto_upgrade_minor_version = true



}

resource "azurerm_virtual_machine_extension" "AMA" {
  count                      = var.AMAEnabled ? 1 : 0
  name                       = "${azurerm_windows_virtual_machine.VM.name}-AMA"
  virtual_machine_id         = azurerm_windows_virtual_machine.VM.id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorWindowsAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  settings = jsonencode({
    authentication = {
      identifier-name  = var.AMAIdentifierName
      identifier-value = var.AMAAMAUaiId
    }
  })



}


variable "AMAEnabled" {
  type        = bool
  default     = true
  description = "A bool to enable/disable Azure Monitor Agent"

}

variable "AMAIdentifierName" {
  type        = string
  default     = "WorkspaceId"
  description = "The identifier name for Azure Monitor Agent"

}

variable "AMAAMAUaiId" {
  type        = string
  default     = "/subscriptions/16e85b36-5c9d-48cc-a45d-c672a4393c36/resourceGroups/rsg-monitor/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uai-ama"
  description = "The identifier value for Azure Monitor Agent"

}


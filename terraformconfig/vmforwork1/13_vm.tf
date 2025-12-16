
resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

output "pwd" {
  value     = random_password.password.result
  sensitive = true
}

resource "azurerm_key_vault_secret" "vmadminpwd" {
  name         = "vmadminpwd"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.Kv.id

}


module "AdminVm" {
  source = "../modules/IaaS_CPT_WinVm"

  for_each = { for k, v in var.VnetConfig : k => v if v.VmEnabled }

  TargetRg             = azurerm_resource_group.RGVM[each.key].name
  TargetLocation       = azurerm_resource_group.RGVM[each.key].location
  TargetSubnetId       = "${module.vnet[each.key].VNetFullOutput.id}/subnets/sub1-${module.vnet[each.key].VNetFullOutput.name}"
  VmAdminName          = "vmadmin"
  VmAdminPassword      = azurerm_key_vault_secret.vmadminpwd.value
  LawLogId             = azurerm_log_analytics_workspace.LawMonitor.id
  STALogId             = azurerm_storage_account.StaMonitor.id
  STABlobURI           = "https://${azurerm_storage_account.StaMonitor.name}.blob.core.windows.net/"
  VMSuffix             = "server1"
  ProvisionVMAgent     = true
  CustomDataScriptPath = filebase64("${path.root}/scripts/bootstrap.ps1")
  CreateAsg            = true
  DomainJoined         = false
  VMImagePublisherName = "MicrosoftWindowsServer"
  VMImageOfferName     = "WindowsServer"
  VMImageSku           = "2022-datacenter"

  depends_on = [azurerm_resource_group.RGVM]
}



ephemeral "tls_private_key" "EphemeralLinuxVmSshKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "EphemeralLinuxVmSshKey" {
  name         = "linuxvmsshKey"
  value_wo        = ephemeral.tls_private_key.EphemeralLinuxVmSshKey.private_key_pem
  value_wo_version = 1
  key_vault_id = azurerm_key_vault.Kv.id

}

resource "tls_private_key" "LinuxVmSshKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "LinuxVmSshKey" {
  name         = "linuxvmsshKey"
  value_wo        = tls_private_key.LinuxVmSshKey.private_key_pem
  value_wo_version = 1
  key_vault_id = azurerm_key_vault.Kv.id

}

module "LinuxVm" {
  source = "../modules/IaaS_CPT_LinuxVm"

  for_each = { for k, v in var.VnetConfig : k => v if v.LinuxVmEnabled }

  TargetRg             = azurerm_resource_group.RGVM[each.key].name
  TargetLocation       = azurerm_resource_group.RGVM[each.key].location
  TargetSubnetId       = "${module.vnet[each.key].VNetFullOutput.id}/subnets/sub1-${module.vnet[each.key].VNetFullOutput.name}"
  #VmAdminName          = "vmadmin"
  #VmAdminPassword      = azurerm_key_vault_secret.vmadminpwd.value
  SshPublicKey         = tls_private_key.LinuxVmSshKey.public_key_openssh
  LawLogId             = azurerm_log_analytics_workspace.LawMonitor.id
  STALogId             = azurerm_storage_account.StaMonitor.id
  STABlobURI           = "https://${azurerm_storage_account.StaMonitor.name}.blob.core.windows.net/"
  VMSuffix             = "server2"
  ProvisionVMAgent     = true
  CustomDataScriptPath = filebase64("${path.root}/scripts/bootstrap.sh")
  CreateAsg            = true
  VMImagePublisherName = "Canonical"
  VMImageOfferName     = "ubuntu-24_04-lts"
  VMImageSku           = "server"
  #DisablePasswordAuthentication = false

  depends_on = [azurerm_resource_group.RGVM]
}
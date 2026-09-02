

VnetConfig = {
  vm1 = {
    AppName           = "vm1"
    VNetAddressSpace  = "172.22.0.0/24"
    VnetEnableBastion = false
    VnetPeered        = false
    SubnetsConfig = [
      {
        Name          = "Subnet1"
        AddressPrefix = "172.22.0.0/26"
        EnableNsg     = true
        Nsg = {
          Name = "sub1"
          Rules = {

          }
        }
      },
      {
        Name          = "Subnet2"
        AddressPrefix = "172.22.0.64/26"
        EnableNsg     = true
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      },
      {
        Name          = "Subnet3"
        AddressPrefix = "172.22.0.128/26"
        EnableNsg     = true
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      },
      {
        Name            = "AzureBastionSubnet"
        AddressPrefix   = "172.22.0.192/26"
        AllowCustomName = true
        EnableNsg       = false
        Nsg = {
          Name = "value"
          Rules = {

          }
        }
      }
    ]
    VmEnabled = true
    WinVm = {
      Enabled   = true
      Publisher = "MicrosoftWindowsDesktop"
      Offer     = "windows-11"
      Sku       = "win11-25h2-ent"
    }
    LinuxVm = {
      Enabled = true
    }


  }
}




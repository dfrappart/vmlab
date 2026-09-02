


VnetConfig = {
  devvm1 = {
    AppName           = "dev-vm1"
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
    WinVm = {
      Enabled   = true
      Publisher = "MicrosoftWindowsDesktop"
      Offer     = "windows-11"
      Sku       = "win11-25h2-ent"
      VmSuffix  = "devserver1"
    }
    LinuxVm = {
      Enabled  = true
      VmSize   = "Standard_E4as_v5"
      VmSuffix = "devserver2"
    }


  }
}


CustomizeStaName = true

RgConfig = {
  "rsg-monitor" = {
    RgLocation = "francecentral"
    RgName     = "rsg-monitor-dev"
  }
  "rsg-kv" = {
    RgLocation = "francecentral"
    RgName     = "rsg-kv-dev"
  }
  "rsg-dns" = {
    RgLocation = "francecentral"
    RgName     = "rsg-dns-dev"
  }
}
rg1mapmodule = {
  rg2 = "canada central"
  # rg3 = "canada central"
  # rg4 = "canada central"
  # rg5 = "canada central"
}

strsatmapmodule= {
  satstr111 = {
  location = "canada central"
  resource_group_name = "rg2"
  account_replication_type = "LRS"
  account_tier = "Standard"
  }
  #   satstr112 = {
  # location = "canada central"
  # resource_group_name = "rg2"
  # account_replication_type = "LRS"
  # account_tier = "Standard"
  # }
}
vnet1mapmodule= {
  satvnet11 = {
  location="canada central"
  resource_group_name = "rg2"
  address_space = ["10.0.0.0/16"]
  }
}

satsubmapmodule={
 AzureBastionSubnet={
  virtual_network_name = "satvnet11"
  address_prefixes = ["10.0.1.0/24"]
  resource_group_name = "rg2"
}
 satsubnetfornic={
  virtual_network_name = "satvnet11"
  address_prefixes = ["10.0.2.0/24"]
  resource_group_name = "rg2"
}
}
satpipmapmodule = {
  satpip1 = {
  location = "canada central"
  allocation_method = "Static"
  resource_group_name = "rg2"
}
}

bastionhostmapmodule={
  satbas1 = {
    location = "canada central"
    resource_group_name = "rg2"
    ip_configuration = "bastionhostipconf"
    subname= "AzureBastionSubnet"
    virtual_network_name = "satvnet11"
    pipname = "satpip1" 
  }
}
satnicmapmodule = {
  satnic1 = {
    location= "canada central"
    resource_group_name ="rg2"
    ip_conf_name = "nicip"
    private_ip_address_allocation = "Dynamic"
    subname = "satsubnetfornic"
    virtual_network_name = "satvnet11"
  }
}

satvmmapmodule = {
  satvm1 = {
  location = "canada central"
  resource_group_name = "rg2"
  size = "Standard_D2s_v3"
  admin_username = "admin123"
  admin_password = "admin@123"
  disable_password_authentication = "false"
  storage_account_type = "Standard_LRS"
  caching = "ReadWrite"
  publisher = "Canonical"
  offer = "0001-com-ubuntu-server-jammy"
  sku = "22_04-lts-gen2"
  version = "latest"
  satnicname = "satnic1"
  }
}
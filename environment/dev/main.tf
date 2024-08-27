module "rgmodule" {
  source = "../../module/1_resource_group"
  rg1map = var.rg1mapmodule
}
module "str1module" {
  source = "../../module/2_storage_account"
  strsatmap = var.strsatmapmodule
  depends_on = [ module.rgmodule ]
}
module "satvnetmodule" {
 source= "../../module/3_virtual_net"
 vnetmap= var.vnet1mapmodule
 depends_on = [ module.rgmodule ]
}
module "satsubmodule" {
  source = "../../module/4_subnet"
  satsub1 = var.satsubmapmodule
  depends_on = [module.satvnetmodule]
}
module "satpubipmodule" {
  source = "../../module/5_public_ip"
  satpipmap = var.satpipmapmodule
  depends_on = [ module.rgmodule ]
}
module "satbastionmodule" {
  source = "../../module/6_bastion"
  bastionhost = var.bastionhostmapmodule
  depends_on = [ module.rgmodule,module.satsubmodule, module.satpubipmodule]
}

module "satnicmodule" {
  source = "../../module/7_nic"
  satnicmap = var.satnicmapmodule
  depends_on = [ module.rgmodule, module.satsubmodule ]
}

module "satvmmodule" {
 source = "../../module/8_vm"
 satvmmap = var.satvmmapmodule 
 depends_on = [ module.rgmodule, module.satnicmodule ]
}
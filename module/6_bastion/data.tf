data "azurerm_subnet" "satsubdatablock" {
  for_each = var.bastionhost
  name = each.value.subname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_public_ip" "satpubipdatablock" {
  for_each = var.bastionhost
  name = each.value.pipname
  resource_group_name = each.value.resource_group_name
}
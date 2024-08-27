resource "azurerm_bastion_host" "satbastion" {
  for_each = var.bastionhost
  name = each.key
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name=each.value.ip_configuration
    subnet_id = data.azurerm_subnet.satsubdatablock[each.key].id
    public_ip_address_id = data.azurerm_public_ip.satpubipdatablock[each.key].id
  }
}
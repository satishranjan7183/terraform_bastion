resource "azurerm_subnet" "vnetsubsat1" {
  for_each = var.satsub1
  name=each.key
  virtual_network_name = each.value.virtual_network_name
  address_prefixes = each.value.address_prefixes
  resource_group_name = each.value.resource_group_name
}
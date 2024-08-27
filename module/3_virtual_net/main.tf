resource "azurerm_virtual_network" "vnetsat1" {
  for_each = var.vnetmap
  name=each.key
  location=each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
}
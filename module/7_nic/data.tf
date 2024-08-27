data "azurerm_subnet" "satnicdatablock" {
  for_each = var.satnicmap
  name = each.value.subname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
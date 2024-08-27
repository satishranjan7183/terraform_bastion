
resource "azurerm_network_interface" "satnic" {
  for_each = var.satnicmap
  name = each.key
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name =each.value.ip_conf_name
    subnet_id = data.azurerm_subnet.satnicdatablock[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
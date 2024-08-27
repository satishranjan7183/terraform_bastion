
resource "azurerm_public_ip" "satpubip" {
  for_each = var.satpipmap
  name = each.key
  location = each.value.location
  allocation_method = each.value.allocation_method
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_resource_group" "satrg" {
  for_each = var.rg1map
  name     = each.key
  location = each.value
}
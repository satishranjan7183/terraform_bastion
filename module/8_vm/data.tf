data "azurerm_network_interface" "satnicdata" {
  for_each = var.satvmmap
  name = each.value.satnicname
  resource_group_name = each.value.resource_group_name
}
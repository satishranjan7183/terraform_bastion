resource "azurerm_linux_virtual_machine" "satlinvm" {
  for_each = var.satvmmap
  name = each.key
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
network_interface_ids = [data.azurerm_network_interface.satnicdata[each.key].id,]
source_image_reference {
  publisher = each.value.publisher
  sku = each.value.sku
  version = each.value.version
  offer = each.value.offer
}
  os_disk {
  storage_account_type = each.value.storage_account_type
  caching = each.value.caching
  }
}
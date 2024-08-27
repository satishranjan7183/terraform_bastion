
resource "azurerm_storage_account" "satstr12" {
  for_each = var.strsatmap
  name= each.key
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  account_replication_type = each.value.account_replication_type
  account_tier = each.value.account_tier
}
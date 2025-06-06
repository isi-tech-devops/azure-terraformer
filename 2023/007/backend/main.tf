# resource azurerm_resource_group main {
# name     = "rg-terraform"
# location = var.location
# }


data "azurerm_resource_group" "example" {
  name = "NDDNRCNBISHFXCcDevCorersg"
}


resource "azurerm_storage_account" "main" {
  name                     = "Accumulotrst"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}

output "id" {
  value = data.azurerm_resource_group.example.id
}

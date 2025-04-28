resource "azurerm_resource_group" "rg" {
  name     = "rgbox1"
  location = "Japan East"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "clusterbox1"
  location            = "Japan East"
  resource_group_name = "rgbox1"
  dns_prefix          = "dnsprefix11"

  default_node_pool {
    name       = "nodepool11"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }
}
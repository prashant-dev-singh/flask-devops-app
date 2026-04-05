provider "azurerm" {
  features {}
}

module "rg" {
  source   = "../../modules/rg"
  name     = "flask-dev-rg"
  location = "East US"
}

module "acr" {
  source   = "../../modules/acr"
  name     = "flaskacrdev12345"
  rg_name  = module.rg.name
  location = module.rg.location
}

module "aks" {
  source   = "../../modules/aks"
  name     = "flask-aks-dev"
  rg_name  = module.rg.name
  location = module.rg.location
}

# 🔥 FIXES YOUR EARLIER PROBLEM PERMANENTLY
#resource "azurerm_role_assignment" "acr_pull" {
#  principal_id         = module.aks.kubelet_identity[0].object_id
#  role_definition_name = "AcrPull"
#  scope                = module.acr.id
#}
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azuread_user" "example" {
    count = length(var.userinformation)
    user_principal_name = "${var.userinformation[count.index].princip}"
    display_name = "${var.userinformation[count.index].display}"

}

resource "azurerm_resource_group" "example" {
  name     = "${var.rgname}-${count.index}"
  count    = var.numberofrg 
  location = "West Europe"
}

variable "numberofrg" {
    default = 2
}

variable "rgname" {
    default = "rg-name-20230302"

}

variable "userinformation"{
    default = [
    {"princip":"ryan@examplecorp.com", "display":"Ryan"},
    {"princip":"john@examplecorp.com", "display":"John"}
    ]

}

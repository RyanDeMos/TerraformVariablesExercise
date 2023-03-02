terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

provider "aws" {
  # Configuration options
}

resource "azurerm_resource_group" "example" {
  name     = "${var.rgname}-${count.index}"
  count    = var.numberofrg 
  location = "West Europe"
}

variable "numberofrg" {
    default = 2
}


resource "aws_iam_user" "new_users" {
  for_each = toset(var.new_users)
  name = each.value
}

variable "new_users" {
  default = ["user1", "user2", "user3"]
}


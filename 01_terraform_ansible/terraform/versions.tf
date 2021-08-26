terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    godaddy = {
      source = "n3integration/godaddy"
    }
  }
  required_version = ">= 0.13"
}
terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
      version = "1.15.0"
    }
  }
}
provider "fortios" {
  hostname = var.hostname
  token    = var.token
  insecure = "true"
}

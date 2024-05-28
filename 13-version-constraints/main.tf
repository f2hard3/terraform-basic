terraform {
  required_providers {
    local = {  
      source = "hashicorp/local"
      # version = "2.2.2"
      # version = "!= 2.0.0" should not download 2.0.0
      # version = "< 1.4.0"
      # version = "> 1.4.0"
      # version = "> 2.2.0, < 2.5.0, != 2.3.0"
      # version = "~> 2.2" upgrade minor version
      # version = "~> 2.2.0" upgrade patch version
    }
  }
} 

resource "local_file" "pet" {
  filename = var.filename
  content = var.content
}

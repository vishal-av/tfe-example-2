terraform {
  required_version = ">= 1.0.0"
}

variable "environment" {
  type    = string
  default = "dev"
}

resource "null_resource" "example" {
  triggers = {
    environment = var.environment
    timestamp   = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Hello from Terraform! Environment: ${var.environment}'"
  }
}

output "environment_name" {
  value = var.environment
}

output "resource_id" {
  value = null_resource.example.id
}

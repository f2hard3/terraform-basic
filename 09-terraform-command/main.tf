resource "local_file" "pet" {
  filename        = var.filename
  content         = var.content
}

resource "random_pet" "cat" {
  length = "2"
  separator = "-"
}

output "content" {
  value = local_file.pet.content
  sensitive = false
  description = "Print the content of the file"
}

output "pet-name" {
  value = random_pet.cat.id
  sensitive = false
  description = "Print the name of the pet"
}
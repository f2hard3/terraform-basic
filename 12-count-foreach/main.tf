resource "local_file" "pet" {
  # filename = var.filename[count.index]
  # content = var.content
  # count = length(var.filename)

  filename = each.value
  content = var.content
  for_each = toset(var.filename)
}

output "pets" {
  value = local_file.pet

  sensitive = true
}
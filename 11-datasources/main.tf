resource "local_file" "pet" {
  filename = var.filename
  content = data.local_file.dog.content
}

data "local_file" "dog" {
  filename = "dogs.txt"  
}

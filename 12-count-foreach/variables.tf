variable "filename" {
  type = list(string)
  default = [
    # "pets.txt",
    "dogs.txt",
    "cats.txt"
  ]  
}

variable "content" {
  default = "We love pets!"
}
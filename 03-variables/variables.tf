variable "filename" {
  default = "pets.txt"
  type = string
  description = "the path of local file"
}

variable "file-content" {
  type = map(string)
  default = {
    "statement1" = "We love pets!"
    "statement2" = "We love animals!"
  }
  description = "the content of the file"
}

variable "prefix" {
  default = ["Mr", "Mrs", "Sir"]
  type = list(string)
  description = "the prefix to be set"
}

variable "separator" {
  default = "."  
}

variable "length" {
  default = 2
  type = number
}

variable "fruit" {
  type = set(string)
  default = [ "apple", "banana", "banana" ] // error
}

variable "bella" {
  type = object({
    name = string
    color = string
    age = number
    food = list(string)
    favorite_pet = bool
  })

  default = {
    name = "bella"
    color = "brown"
    age = 7
    food = [ "fish", "chicken", "turkey" ]
    favorite_pet = true
  }
}

variable "kitty" {
  type = tuple([ string, number, bool ])
  default = [ "cat", 7, true ]
}
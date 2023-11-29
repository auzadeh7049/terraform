variable "myvar" {
  type    = string
  default = "Hello Terraform"
}

variable "mymap" {
  type = map(string)
  default = {
    mykey = "my value"
  }
}

variable "my_list" {
  type    = list(any)
  default = [1, 2, 3]

}

#terraform console
#var.myvar
#var.mymap
#"${var.mymap["mykey"]}
#element(var.my_list,1)
#slice(var.my_list, 0, 2)

variable "digitalocean_token" {
  description = "The Digital Ocean token."
}

variable "digitalocean_region" {
  description = "The Digital Ocean region to create resources in."
}

variable "web_server_image" {
  description = "The Digital Ocean image to be used for the web server to be created."
  default = "centos-7-x64"
}

variable "web_server_size" {
  description = "The total number of web server nodes to be created."
}

variable "web_server_memory_size" {
  description = "The memory size of the web server to be created."
  default = "2gb"
}

variable "tag_web" {
  description = "The tag to be used for all web server nodes to be created."
}
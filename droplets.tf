data "template_file" "web_server_user_data" {
  template = "${file("templates/user_data")}"

  vars {
    dns_ip = "${var.web_server_image}"
  }
}

resource "digitalocean_droplet" "web" {
  name = "web-${count.index + 1}"
  count = "${var.web_server_size}"

  image = "${var.web_server_image}"
  region = "${var.digitalocean_region}"
  size = "${var.web_server_memory_size}"

  monitoring = true
  private_networking = true
  user_data = "${data.template_file.web_server_user_data.rendered}"

  tags = [
    "${digitalocean_tag.web.id}"]
}
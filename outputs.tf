output "web_server_ip_addresses" {
  value = "${join(",", digitalocean_droplet.web.*.ipv4_address)}"
}
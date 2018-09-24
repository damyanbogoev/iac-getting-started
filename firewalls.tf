resource "digitalocean_firewall" "web" {
  name = "web"

  inbound_rule = [
    {
      protocol = "tcp"
      port_range = "80"
      source_addresses = [
        "0.0.0.0/0",
        "::/0"]
    },
    {
      protocol = "tcp"
      port_range = "443"
      source_addresses = [
        "0.0.0.0/0",
        "::/0"]
    },
  ]

  outbound_rule = [
    {
      protocol = "icmp"
      // uncomment the code bellow for already created DC
      // in order to avoid the diff between the current and state to be
      // this is caused by issue in Terraform API
      //      port_range = "0"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"]
    },
    {
      protocol = "tcp"
      port_range = "all"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"]
    },
    {
      protocol = "udp"
      port_range = "all"
      destination_addresses = [
        "0.0.0.0/0",
        "::/0"]
    },
  ]

  tags = [
    "${digitalocean_tag.web.name}"]
}
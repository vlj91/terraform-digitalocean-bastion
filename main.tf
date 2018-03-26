data "template_file" "user_data" {
  template = "${file("${path.module}/user-data.tpl")}"

  vars {
    fqdn           = "bastion.${var.domain}"
    admin_username = "${var.admin_username}"
  }
}

resource "digitalocean_droplet" "bastion" {
  image              = "${var.image_name}"
  name               = "bastion"
  region             = "${var.region}"
  size               = "${var.size}"
  backups            = "${var.backups}"
  monitoring         = "${var.monitoring}"
  private_networking = "${var.private_networking}"

  ssh_keys = [
    "${split(",", var.ssh_keys)}",
  ]

  tags = [
    "${split(",", var.tags)}",
  ]

  user_data = "${data.template_file.user_data.rendered}"
}

resource "digitalocean_firewall" "bastion" {
  name = "bastion-${var.domain}"

  droplet_ids = [
    "${digitalocean_droplet.bastion.id}",
  ]

  inbound_rule = [
    {
      protocol   = "tcp"
      port_range = "22"

      source_addresses = [
        "${split(",", var.allowed_cidr_ranges)}",
      ]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "53"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol              = "udp"
      port_range            = "53"
      destination_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]
}

resource "digitalocean_floating_ip" "bastion" {
  droplet_id = "${digitalocean_droplet.bastion.id}"
  region     = "${digitalocean_droplet.bastion.region}"
}

resource "digitalocean_record" "bastion" {
  domain = "${var.domain}"
  type   = "A"
  name   = "bastion"
  value  = "${digitalocean_floating_ip.bastion.ip_address}"
}

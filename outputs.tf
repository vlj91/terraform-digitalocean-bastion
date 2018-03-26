output "ip_address" {
  description = "IP address of the bastion instance"
  value       = "${digitalocean_floating_ip.bastion.ip_address}"
}

output "hostname" {
  description = "Hostname of the bastion instance"
  value       = "${digitalocean_record.bastion.fqdn}"
}

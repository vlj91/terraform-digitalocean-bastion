variable "domain" {
  description = "Domain name, e.g. foobar.com. This must already be associated with your DigitalOcean account"
}

variable "admin_username" {
  description = "Administrator username to create"
  default     = "stack"
}

variable "image_name" {
  description = "DigitalOcean image to use"
  default     = "ubuntu-16-04-x64"
}

variable "region" {
  description = "DigitalOcean region to place the bastion host in"
  default     = "sgp1"
}

variable "size" {
  description = "Droplet size to create"
  default     = "s-1vcpu-1gb"
}

variable "backups" {
  description = "Choose whether to enable backups"
  default     = false
}

variable "monitoring" {
  description = "Choose whether to enable instance monitoring"
  default     = false
}

variable "private_networking" {
  description = "Choose whether to enable private networking"
  default     = true
}

variable "ssh_keys" {
  description = "Comma separated list of SSH keys to associate with the bastion instance"
}

variable "tags" {
  description = "Comma separated list of tags to associate with the instance"
  default     = "role:bastion"
}

variable "allowed_cidr_ranges" {
  description = "Comma separated list of allowed network ranges"
  default     = "0.0.0.0/0"
}

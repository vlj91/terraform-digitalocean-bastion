# `terraform-digitalocean-bastion`

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| admin_username | Administrator username to create | string | `stack` | no |
| allowed_cidr_ranges | Comma separated list of allowed network ranges | string | `0.0.0.0/0` | no |
| backups | Choose whether to enable backups | string | `false` | no |
| domain | Domain name, e.g. foobar.com. This must already be associated with your DigitalOcean account | string | - | yes |
| image_name | DigitalOcean image to use | string | `ubuntu-16-04-x64` | no |
| monitoring | Choose whether to enable instance monitoring | string | `false` | no |
| private_networking | Choose whether to enable private networking | string | `true` | no |
| region | DigitalOcean region to place the bastion host in | string | `sgp1` | no |
| size | Droplet size to create | string | `s-1vcpu-1gb` | no |
| ssh_keys | Comma separated list of SSH keys to associate with the bastion instance | list | - | yes |
| tags | Comma separated list of tags to associate with the instance | string | `role:bastion` | no |

## Outputs

| Name | Description |
|------|-------------|
| hostname | Hostname of the bastion instance |
| ip_address | IP address of the bastion instance |

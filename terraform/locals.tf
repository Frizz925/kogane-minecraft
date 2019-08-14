locals {
  hostname              = "minecraft"
  firewall_description  = "Firewall group for Minecraft server"

  instance_name   = "Minecraft"
  instance_region = "Singapore"
  instance_tag    = "kogane-minecraft"

  instance_vcpu   = 2
  instance_ram    = 4096
  instance_price  = "20.00"
  instance_os_id  = 352

  ssh_name        = "Minecraft SSH Key"
  ssh_public_key  = "${file(pathexpand(var.ssh_public_key))}"
}

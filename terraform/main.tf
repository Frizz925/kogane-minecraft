resource "vultr_instance" "minecraft" {
  name              = "${local.instance_name}"
  region_id         = "${data.vultr_region.instance_region.id}"
  plan_id           = "${data.vultr_plan.instance_plan.id}"
  os_id             = "${local.instance_os_id}"
  tag               = "${local.instance_tag}"
  firewall_group_id = "${vultr_firewall_group.minecraft_firewall.id}"
}

resource "vultr_ssh_key" "minecraft_ssh_key" {
  name        = "${local.ssh_name}"
  public_key  = "${local.ssh_public_key}"
}

resource "vultr_firewall_group" "minecraft_firewall" {
  description = "${local.firewall_description}"
}

resource "vultr_firewall_rule" "bastion_ssh" {
  firewall_group_id = "${vultr_firewall_group.minecraft_firewall.id}"
  cidr_block        = "${var.bastion_cidr}"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  notes             = "SSH from bastion instance"
}

resource "vultr_firewall_rule" "minecraft_tcp" {
  firewall_group_id = "${vultr_firewall_group.minecraft_firewall.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "tcp"
  from_port         = 25565
  to_port           = 25565
  notes             = "Minecraft server TCP"
}

resource "vultr_firewall_rule" "minecraft_udp" {
  firewall_group_id = "${vultr_firewall_group.minecraft_firewall.id}"
  cidr_block        = "0.0.0.0/0"
  protocol          = "udp"
  from_port         = 25565
  to_port           = 25565
  notes             = "Minecraft server UDP"
}

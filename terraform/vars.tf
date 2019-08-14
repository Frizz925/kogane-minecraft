variable "bastion_cidr" {
  type = "string"
}

variable "ssh_public_key" {
  type = "string"
  default = "~/.ssh/minecraft-id_rsa.pub"
}

data "vultr_region" "instance_region" {
  filter {
    name = "name"
    values = ["${local.instance_region}"]
  }
}

data "vultr_plan" "instance_plan" {
  filter {
    name = "vcpu_count"
    values = ["${local.instance_vcpu}"]
  }
  filter {
    name = "ram"
    values = ["${local.instance_ram}"]
  }
  filter {
    name = "price_per_month"
    values = ["${local.instance_price}"]
  }
}

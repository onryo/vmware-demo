data "vsphere_datacenter" "dc" {
  name = "${var.dc_name}"
}
data "vsphere_network" "network" {
  name          = "automation_test"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

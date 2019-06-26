data "vsphere_datacenter" "dc" {
  name = "${var.dc_name}"
}
data "vsphere_network" "network" {
  name          = "${var.vm_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

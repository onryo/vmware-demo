data "vsphere_network" "vm_network" {
  name          = "${var.vm_network}"
  datacenter_id = "${data.vsphere_datacenter.dc_name.id}"
}

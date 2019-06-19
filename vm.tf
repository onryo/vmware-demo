data "vsphere_virtual_machine" "template_from_ovf" {
name = "UbuntuTemplate"
datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}"
#  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
clone {
    template_uuid = "${data.vsphere_virtual_machine.template_from_ovf.id}"
 }
  num_cpus = 2
  memory   = 1024
  guest_id = "centos7_64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 20
  }
}

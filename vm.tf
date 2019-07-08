data "vsphere_virtual_machine" "template_from_ovf" {
  name          = var.vm_template_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
}

resource "random_string" "vm_name_suffix" {
  length  = 4
  upper   = false
  lower   = true
  number  = false
  special = false
}

resource "vsphere_virtual_machine" "vm" {
  name             = "${var.vm_name}-${random_string.vm_name_suffix.result}"
  folder           = var.vm_folder
  resource_pool_id = data.vsphere_compute_cluster.vsphere_compute_cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.vsphere_datastore.id

  clone {
    template_uuid = data.vsphere_virtual_machine.template_from_ovf.id
  }

  num_cpus = 2
  memory   = 2048
  guest_id = var.vm_guest_id

  network_interface {
    network_id = data.vsphere_network.vm_network.id
  }

  disk {
    label            = "disk0"
    size             = var.vm_disk_size
  }

  # required to support vApp
  cdrom {
    client_device = true
  }
}

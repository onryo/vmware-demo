provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"  

  # If you have a self-signed cert
  allow_unverified_ssl = true
}



data "vsphere_datastore" "datastore" {
  name          = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
 name          = "${var.pool}"
 datacenter_id = "${data.vsphere_datacenter.dc.id}"
}



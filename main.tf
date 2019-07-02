provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

provider "random" {
}

data "vsphere_datacenter" "dc_name" {
  name = var.dc_name
}

data "vsphere_datastore" "vsphere_datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
}

data "vsphere_compute_cluster" "vsphere_compute_cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.dc_name.id
}


terraform {
  backend "remote" {
    hostname = "ptfepoc.premera.cloud"
    organization = "Premera"

    workspaces {
      name = "vmware-demo"
    }
  }
}
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"  

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

variable "vsphere_user" {
  description = "vsphere_user"
}

variable "vsphere_password" {
  description = "vsphere_password"
}

variable "vsphere_server" {
  description = "vsphere_server"
}

data "vsphere_datacenter" "dc" {
  name = "automation_workshop"
}

data "vsphere_datastore" "datastore" {
  name          = "DCALCVM30_LAB_005DB"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "cluster1/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "automation_test"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

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

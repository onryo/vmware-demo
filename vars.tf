variable "vsphere_user" {
  description = "vSphere Username"
}

variable "vsphere_password" {
  description = "vSphere Password"
}

variable "vsphere_server" {
  description = "vSphere Server"
}

variable "dc_name" {
  description = "vSphere Datacenter Name"
}

variable "cluster_name" {
  description = "vSphere Cluster Name"
}

variable "datastore_name" {
  description = "vSphere Datastore Name"
}

variable "vm_template_name" {
  description = "VM Template to clone"
  default     = "UbuntuTemplate"
}

variable "vm_name" {
  description = "VM Name"
}

variable "vm_network" {
  description = "VM Network"
}

variable "ssh_public_key" {
  description = "SSH public key to inject into VM"
  default     = ""
}


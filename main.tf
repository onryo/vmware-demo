module "vsphere/" {
 
  source = "github.com/stoffee/vmware-demo/vsphere/"
  name             = "${var.vm_name}"
 resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
#  resource_pool_id = "${var.pool}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
}

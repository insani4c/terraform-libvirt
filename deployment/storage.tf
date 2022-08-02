# A pool for all cluster volumes
resource "libvirt_pool" "default" {
  name = "cluster_storage"
  type = "dir"
  path = "/data/vms/cluster_storage"
}

resource "libvirt_volume" "local_install_image" {
  name   = var.local_install_image
  pool   = libvirt_pool.default.name
  source = var.os_img_url
  format = "qcow2"
}

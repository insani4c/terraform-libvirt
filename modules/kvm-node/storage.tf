data "template_file" "user_data" {
  template = "${file("${path.module}/templates/cloud-init.cfg")}"
  vars = {
    hostname = var.name
    fqdn     = "${var.name}.${var.dns_domain}"
    password = var.user_pwd
  }
}

data "template_file" "network_config" {
  template = "${file("${path.module}/templates/network-config.cfg")}"
  vars = {
    domain     = var.dns_domain
    ip_address = var.ip_address
    gw_address = var.gw_address
  }
}

resource "libvirt_cloudinit_disk" "commoninit" {
    name = "${var.name}-commoninit.iso"
    pool = var.libvirt_pool.name
    user_data = "${data.template_file.user_data.rendered}"
    network_config = "${data.template_file.network_config.rendered}"
}

resource "libvirt_volume" "node-disk-qcow2" {
  name   = "${var.name}-disk-ubuntu-focal.qcow2"
  pool   = var.libvirt_pool.name

  size   = 1024*1024*1024*var.disk_size

  base_volume_id   = var.install_image
  base_volume_pool = var.libvirt_pool.name

  format = "qcow2"
}
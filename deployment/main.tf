module "host01-node" {
    source = "../modules/kvm-node"

    name         = "host01"
    dns_domain   = var.dns_domain
    memory       = 8192 # in Mb
    vcpu         = 4
    disk_size    = 40 # in Gb
    ip_address   = "10.1.2.10"
    gw_address   = var.gw_address
    user_pwd     = var.default_password

    install_image   = libvirt_volume.local_install_image.id
    libvirt_pool    = libvirt_pool.default
    libvirt_network = libvirt_network.my_network
}

module "host02-node" {
    source = "../modules/kvm-node"

    name         = "host02"
    dns_domain   = var.dns_domain
    memory       = 8192 # in Mb
    vcpu         = 4
    disk_size    = 40 # in Gb
    ip_address   = "10.1.2.20"
    gw_address   = var.gw_address
    user_pwd     = var.default_password

    install_image   = libvirt_volume.local_install_image.id
    libvirt_pool    = libvirt_pool.default
    libvirt_network = libvirt_network.my_network
}

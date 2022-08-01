terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  ## Configuration options
  # uri = "qemu:///system"
  #alias = "server2"
  uri   = "qemu+ssh://root@10.49.42.23/system"
}

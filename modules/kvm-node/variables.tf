variable "name" {
    description = "The name of the node"
}

variable "dns_domain" {
    description = "DNS domain name"
}

variable "gw_address" {
    description = "IP address of the gateway"
}

variable "user_pwd" {
    description = "Default password for user accounts"
}

variable "memory" {
    description = "The amount of memory in megabytes"
}

variable "vcpu" {
    description = "The amount of virtual CPUs" 
}

variable "disk_size" {
    description = "The disk size in gigabytes" 
}

variable "ip_address" {
    description = "The IP address of the node" 
}

variable "libvirt_pool" {
    description = "The libvirt_pool object where to create images"
}

variable "libvirt_network" {
    description = "The libvirt_network object where to network interfaces"
}

variable "install_image" {
    description = "The name of the local install image"
}

# Variables with a default value
# 
variable "os_img_url" {
  description = "URL to the OS image"
  default     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

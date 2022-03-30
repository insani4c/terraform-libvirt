variable "os_img_url" {
  description = "URL to the OS image"
  default     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "dns_domain" {
    description = "DNS domain name"
    default     = "localdomain"
}

variable "gw_address" {
    description = "IP address of the gateway"
    default     = "10.1.2.1"
}

variable "default_password" {
    description = "Default password for user accounts"
    default     = "Linux5432!"
}

variable "local_install_image" {
    description = "The name of the local install image"
    default     = "base-os-ubuntu-focal.qcow2"
}
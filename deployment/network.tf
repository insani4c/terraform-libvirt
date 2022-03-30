resource "libvirt_network" "my_network" {
  # the name used by libvirt
  name = "my_net"

  # mode can be: "nat" (default), "none", "route", "open", "bridge"
  mode = "nat"

  #  list of subnets the addresses allowed for domains connected
  # also derived to define the host addresses
  # also derived to define the addresses served by the DHCP server
  addresses = ["10.1.2.0/24"]
  domain    = var.dns_domain

  autostart = true

  dhcp {
    enabled = false
  }

    # (Optional) DNS configuration
  dns {
    # (Optional, default false)
    # Set to true, if no other option is specified and you still want to 
    # enable dns.
    enabled = true
    # (Optional, default false)
    # true: DNS requests under this domain will only be resolved by the
    # virtual network's own DNS server
    # false: Unresolved requests will be forwarded to the host's
    # upstream DNS server if the virtual network's DNS server does not
    # have an answer.
    local_only = false
    forwarders { address = "127.0.0.53" }

    # (Optional) one or more DNS forwarder entries.  One or both of
    # "address" and "domain" must be specified.  The format is:
    # forwarders {
    #     address = "my address"
    #     domain = "my domain"
    #  } 
    # 

    # (Optional) one or more DNS host entries.  Both of
    # "ip" and "hostname" must be specified.  The format is:
    hosts  {
        hostname = "host01"
        ip = "10.1.2.10"
      }
    hosts {
        hostname = "host02"
        ip = "10.1.2.20"
      }
  }
    
  # (Optional) one or more static routes.
  # "cidr" and "gateway" must be specified. The format is:
  routes {
      cidr = "10.1.2.0/24"
      gateway = "10.1.2.1"
  }
}

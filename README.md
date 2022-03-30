# terraform-libvirt
Simple example of how to use Terraform with libvirt

Blog post: https://jmorano.moretrix.com/2022/03/terraform-and-libvirtd-nodes/

# Set up the hypervisor
The base OS used for the hypervisor in this example was Ubuntu Linux 20.4-LTS

## KVM/ Qemu Hypervisor Packages
```bash
apt install qemu-kvm libvirt-daemon bridge-utils virtinst libvirt-daemon-system virt-top libguestfs-tools libosinfo-bin qemu-system virt-manager qemu pm-utils
```

## Preload vnet_host module
```bash
echo vhost_net | tee -a /etc/modules
```

# Deploy with Terraform

```bash
cd deployment/
terraform init --upgrade
terraform plan -out myplan
terraform apply "myplan"
```

## After Terraform deployment
On the hypervisor

```bash
# enable IP forwarding in /etc/sysctl.conf
net.ipv4.ip_forward = 1

sysctl -a

# allow ssh access to virtual machines from openvpn networks only
iptables -I LIBVIRT_FWI -p tcp -i tun0 -o virbr1 -s 0.0.0.0/0 -d 10.1.2.0/24 --dport 22 -m state --state NEW -j ACCEPT
```

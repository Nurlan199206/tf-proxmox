resource "proxmox_vm_qemu" "srv-01" {
    name        = "srv-01"
    desc        = "Ubuntu Server"
    vmid        = "101"
    target_node = "proxmox"
    cores       = 2
    sockets     = 1
    cpu         = "host"
    memory      = 2048


    network {
      bridge   = "vmbr0"
      model    = "virtio"
      firewall = false
    }

    os_type    = "cloud-init"
    ipconfig0  = "ip=192.168.1.160/24,gw=192.168.1.1"
    nameserver = "192.168.1.1" 
    ciuser     = "nurlan"
    cipassword = "123"
}



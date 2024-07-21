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


resource "proxmox_vm_qemu" "srv-02" {
    name        = "srv-02"
    desc        = "Ubuntu Server"
    vmid        = "102"
    target_node = "proxmox"
    cores       = 2
    sockets     = 1
    cpu         = "host"
    memory      = 2048
    bootdisk    =  "scsi0"
    scsihw      = "lsi"
     

disks {
  scsi {
    scsi0 {
      cdrom {
        iso = "local:iso/ubuntu-22.04.4-live-server-amd64.iso"
      }
      }
  scsi1 {
    disk {
        storage = "local-lvm"
        size = "20G"
      }
    }
  }
}

network {
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = false
    }
   
    os_type    = "cloud-init"
    ipconfig0  = "ip=192.168.1.161/24,gw=192.168.1.1"
    nameserver = "192.168.1.1" 
    ciuser     = "nurlan"
    cipassword = "123"  
}
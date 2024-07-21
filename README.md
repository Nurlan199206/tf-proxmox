

wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
apt install guestfs-tools
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

qm create 9000 --name ci-template --memory 2048 --net0 virtio,bridge=vmbr2 --scsihw virtio-scsi-pci
qm set 9000 --scsi0 local-lvm:0,import-from=/root/jammy-server-cloudimg-amd64.img
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --boot order=scsi0
qm set 9000 --serial0 socket --vga serial0
qm template 9000

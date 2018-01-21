#!/bin/bash

spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
#    printf ' '
    while sleep 0.25; do
        printf "%s\b\b" "${sp:i++%n:1}]"
    done
}

#sudo echo "Got sudo permissions"
sudo -p "Grant sudo permissions: " printf "" || exit 1

echo -ne "\r                      \rAdjusting screenlayout"
~/.scripts/screenLayouts/desktop+vm.sh
echo -e "\t\t\t\t\t [DONE]"

echo -n "Starting samba"
sudo systemctl start smbd.service
sudo systemctl start nmbd.service
echo -e "\t\t\t\t\t\t [DONE]"

echo -n "Starting synergy"
synergys -c /etc/synergy.conf -n host -d FATAL &
echo -e "\t\t\t\t\t [DONE]"

cp /usr/share/ovmf/x64/OVMF_VARS.fd /tmp/OVMF_VARS.fd

#echo "Exporting PulseAudio driver"
export QEMU_AUDIO_DRV="pa"
export QEMU_PA_SAMPLE="48000"

echo -n -e "VM active \t\t\t\t\t\t    ["
spinner &
SPINNER_PID=$!

sudo \
        qemu-system-x86_64 \
              -serial none \
              -parallel none \
              -nodefaults \
              -nodefconfig \
              -enable-kvm \
              -name Windows \
              -cpu host,kvm=off,hv_vapic,hv_time,hv_relaxed,hv_spinlocks=0x1fff,hv_vendor_id=sugoidesu \
              -smp sockets=1,cores=4,threads=2 \
              -m 8192 \
              -mem-prealloc \
              -device ich9-usb-uhci3,id=uhci \
              -device usb-ehci,id=ehci \
              -device nec-usb-xhci,id=xhci \
              -machine q35,accel=kvm,kernel_irqchip=on,mem-merge=off \
              -drive if=pflash,format=raw,readonly,file=/usr/share/ovmf/x64/OVMF_CODE.fd \
              -drive if=pflash,format=raw,file=/tmp/OVMF_VARS.fd \
              -rtc base=localtime,clock=host,driftfix=none \
              -drive if=virtio,id=drive0,file=$HOME/VMs/iso/win10.img,format=raw,cache=none,aio=native \
              -soundhw hda \
              -net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no \
              -boot order=c \
              -nographic \
              -device vfio-pci,host=01:00.0,multifunction=on \
              -device vfio-pci,host=01:00.1 \
              -device vfio-pci,host=00:1a.0 

# Alternative network setup 
#-net nic -net bridge,br=br0 

# Standard VGA
# Remove "-nographic \" and "-device vfio-pci" lines
# -vga std

kill -PIPE $SPINNER_PID
#echo "VM closed"
printf "%s\b\b\b\b\b\b\b"
echo "[STOPPED]"

echo -n "Stopping synergy"
kill -INT $(pidof synergys)
echo -e "\t\t\t\t\t [DONE]"

echo -n "Stopping Samba"
sudo systemctl stop smbd.service
sudo systemctl stop nmbd.service
echo -e "\t\t\t\t\t\t [DONE]"

rm /tmp/OVMF_VARS.fd

echo -n "Readjusting screenlayout"
~/.scripts/screenLayouts/desktop.sh
echo -e "\t\t\t\t [DONE]"

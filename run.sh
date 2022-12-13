#!/bin/bash

qemu-system-i386 -kernel build/kernel.bin -no-reboot

# alt: qemu-system-i386 -cdrom output/kernel.iso -curses -no-reboot
#      qemu-system-i386 -kernel output/kernel.bin -curses -no-reboot
#

exit 0

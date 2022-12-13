#!/bin/bash

# Build kernel
CFLAGS="-c -m32 -Wall -O -fno-pie -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -ffreestanding -I./bkerndev/include -I./misc/include -I./tinybasic/include"
CC="i386-elf-gcc"
LD="i386-elf-ld"
mkdir -p build
cd src
nasm -f elf32   -o start.o       bkerndev/start.asm
${CC} ${CFLAGS} -o main.o        bkerndev/main.c
${CC} ${CFLAGS} -o scrn.o        bkerndev/scrn.c
${CC} ${CFLAGS} -o gdt.o         bkerndev/gdt.c
${CC} ${CFLAGS} -o idt.o         bkerndev/idt.c
${CC} ${CFLAGS} -o isrs.o        bkerndev/isrs.c
${CC} ${CFLAGS} -o irq.o         bkerndev/irq.c
${CC} ${CFLAGS} -o timer.o       bkerndev/timer.c
${CC} ${CFLAGS} -o kb.o          bkerndev/kb.c
${CC} ${CFLAGS} -o kbbuf.o       misc/kbbuf.c
${CC} ${CFLAGS} -o unistd.o      misc/unistd.c
${CC} ${CFLAGS} -o stdio.o       misc/stdio.c
${CC} ${CFLAGS} -o stdlib.o      misc/stdlib.c
${CC} ${CFLAGS} -o string.o      misc/string.c
${CC} ${CFLAGS} -o tinybasic.o   tinybasic/tinybasic.c
${LD} -nostdlib -T bkerndev/link.ld -o ../build/kernel.bin start.o main.o scrn.o gdt.o idt.o isrs.o irq.o timer.o kb.o kbbuf.o unistd.o stdio.o stdlib.o string.o tinybasic.o
rm *.o
cd - > /dev/null
if [ "${?}" != "0" ]; then
  echo "Build failed (kernel.bin), exiting."
  exit 1
fi

# Create ISO image
mkdir -p build/isodir/boot/grub
cp build/kernel.bin build/isodir/boot/kernel.bin
cp src/grub/menu.lst build/isodir/boot/grub/
cp src/grub/stage2_eltorito build/isodir/boot/grub/
cd build
mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -quiet -input-charset utf-8 -boot-load-size 4 -boot-info-table -o kernel.iso isodir
rm -rf isodir
cd - > /dev/null
if [ "${?}" != "0" ]; then
  echo "Build failed (kernel.iso), exiting."
  exit 1
fi

exit 0

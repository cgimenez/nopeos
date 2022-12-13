# Nope OS

| **macOS Yeehaw ! it works ! ** |
| ------------------------------ |

Nope OS is a simple OS kernel bundled with a BASIC interpreter, bringing
back the 80s home computing feeling.

![Nope OS Screenshot](/doc/nopeos-helloworld.png)

# Supported Platforms

x86 compatibles.

# Compilation & Usage

Pre-requisites (macOS with Mac Ports):

    sudo port install nasm qemu i386-elf-gcc i386-elf-binutils cdrtools

Download:

    git clone https://github.com/d99kris/nopeos && cd nopeos

Build (outputs `kernel.bin` and `kernel.iso`):

    ./build.sh

Run in QEMU:

    ./run.sh

Stop emulation by pressing ESC.

# Download Pre-Compiled Disk Images

Download links:

- [Nope OS v0.1 IMG](https://github.com/d99kris/nopeos/releases/download/v0.1/nopeos-0.1.img) (2MB)
- [Nope OS v0.1 ISO](https://github.com/d99kris/nopeos/releases/download/v0.1/nopeos-0.1.iso) (0.5MB)

These disk images may be used in a virtualized environment or on a physical
machine.

**Warning:** For usage on a physical machine, take note that Nope OS is just a
proof-of-concept and may contain bugs that could corrupt your system.

## Booting a Physical Machine from USB Drive

Download the IMG disk image above and use for example `dd` or
[balenaEtcher](https://www.balena.io/etcher) to write the image to a drive.

# Design Notes

The implementation is based on [bkerndev - Bran's Kernel Development Tutorial](http://www.osdever.net/bkerndev/Docs/title.htm) and the [TinyBasic interpreter](http://www.ittybittycomputers.com/IttyBitty/TinyBasic/).

# License

Nope OS is distributed under GPLv2 license. See LICENSE file.

# Keywords

simple kernel, BASIC interpreter.

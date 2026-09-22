# SoonaPaana O/S

SoonaPaana O/S is a custom-built operating system designed from the ground up to provide a native, high-performance environment for running retro games, with a primary focus on DOS-based gaming compatibility.

## Features (Planned)
* Native execution of 16-bit and 32-bit x86 code.
* Compatibility layer for DOS system calls (INT 21h, INT 10h, etc.).
* Basic FAT16/FAT32 file system support.
* Direct hardware access for graphics (VGA/VESA) and audio (SoundBlaster compatible).
* Lightweight footprint.

## Project Structure
* `src/boot/`: Bootloader code.
* `src/kernel/`: Core OS kernel and DOS compatibility layer.
* `src/fs/`: File system drivers.
* `docs/`: Documentation and references.

## Getting Started

### Prerequisites
* `nasm`: The Netwide Assembler, used for compiling assembly code.
* `qemu`: System emulator, used for testing the OS.
* `make`: Build automation tool.

### Building and Running
To build the OS image and run it in QEMU:
```bash
make run
```

ASM = nasm
QEMU = qemu-system-x86_64

BUILD_DIR = build
SRC_DIR = src

# Targets
BOOT_BIN = $(BUILD_DIR)/boot.bin
OS_IMAGE = $(BUILD_DIR)/os_image.bin

.PHONY: all clean run

all: $(OS_IMAGE)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Assemble the bootloader
$(BOOT_BIN): $(SRC_DIR)/boot/boot.asm | $(BUILD_DIR)
	$(ASM) -f bin $< -o $@

# Create the OS disk image (for now, just the bootloader padded to floppy size)
$(OS_IMAGE): $(BOOT_BIN)
	cp $(BOOT_BIN) $(OS_IMAGE)
	dd if=/dev/zero bs=512 count=2879 >> $(OS_IMAGE) 2>/dev/null

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Run in QEMU
run: $(OS_IMAGE)
	$(QEMU) -drive format=raw,file=$(OS_IMAGE)

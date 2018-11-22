# Set up environment variables if not present in shell env
export ARCH?=arm
export CROSS_COMPILE?=arm-linux-gnueabi-

TARGETS=dist/u-boot.elf \
		zynq-mkbootimage/mkbootimage \
		dist/devicetree.dtb \
		dist/devicetree.dts \
		dist/BOOT.bin

.PHONY: update-submodules

all: $(TARGETS)
	@echo "Done!"

clean:
	@echo "  CLEAN $(TARGETS)"
	@rm -rf $(TARGETS)

dist/BOOT.bin: configs/boot.bif fsbl.elf
	@echo "  MAKE dist/BOOT.bin"
	@./zynq-mkbootimage/mkbootimage ./configs/boot.bif ./dist/BOOT.bin

dist/u-boot.elf: configs/u-boot.config
	@echo "  MAKE dist/u-boot.elf"
	@git submodule update --init u-boot-xlnx
	@cp configs/u-boot.config u-boot-xlnx/.config
	@make -C u-boot-xlnx olddefconfig
	@make -C u-boot-xlnx u-boot.elf
	@cp u-boot-xlnx/u-boot.elf $@

zynq-mkbootimage/mkbootimage:
	@echo "  MAKE dist/mkbootimage"
	@git submodule update --init zynq-mkbootimage
	@make -j $$(nproc) -C zynq-mkbootimage

# Ubuntu package: device-tree-compiler, ArchLinux package: dtc
dist/devicetree.dtb: configs/devicetree.dts
	@echo "  MAKE dist/devicetree.dtb"
	@dtc -I dts -O dtb -o $@ $<

dist/devicetree.dts: configs/devicetree.dts
	@echo "  COPY $@"
	@cp $< $@
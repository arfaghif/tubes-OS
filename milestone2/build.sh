dd if=/dev/zero of=system.img bs=512 count=2880
dd if=bootloader of=system.img bs=512 count=1 conv=notrunc
dd if=map.img of=system.img bs=512 count=1 seek=1 conv=notrunc
dd if=files.img of=system.img bs=512 count=1 seek=2 conv=notrunc
dd if=sectors.img of=system.img bs=512 count=1 seek=4 conv=notrunc  
bcc -ansi -c -o kernel.o kernel.c
nasm -f as86 kernel.asm -o kernel_asm.o
ld86 -o kernel -d kernel.o kernel_asm.o
dd if=kernel of=system.img bs=512 conv=notrunc seek=5
./loadFile logo.txt
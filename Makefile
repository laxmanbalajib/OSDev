GPP_OPTIONS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
AS_OPTIONS = --32
LD_OPTIONS = -melf_i386

obj = loader.o kernel.o

%.o : %.cpp
	g++ $(GPP_OPTIONS) -o $@ -c $<

%.o : %.s
	as $(AS_OPTIONS) -o $@ -c $<

mykernel.bin: linker.ld $(obj)
	ld  $(LD_OPTIONS) -T $< -o $@ $(obj)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin
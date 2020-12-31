GPP_OPTIONS = -m32
AS_OPTIONS = -m32
LD_OPTIONS = -melf_i386

obj = loader.o kernel.o

%.o : %.cpp
	g++ $(GCC_OPTIONS) -o $@ -c $<

%.o : %.s
	as $(AS_OPTIONS) -o $@ -c $<

mykernel.bin: linker.ld $(obj)
	ld  $(LD_OPTIONS) -T $< -o $@ $(obj)

install: mykernel.bin
	sudo cp $< /boot/mykernel.bin
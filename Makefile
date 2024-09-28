ucode-test:
	customasm asm/microcode.asm -f annotated,base:16,group:2 -o out/ucode --color=off

memory-test:
	customasm asm/memory.asm -f annotated,base:16,group:2 -o out/mem --color=off

ucode:
	customasm asm/microcode.asm -f binary -o out/ucode --color=off

memory:
	customasm asm/memory.asm -f binary -o out/mem --color=off

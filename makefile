answer: answer.o
	gcc answer.o -o answer -no-pie 
answer.o: answer.asm
	nasm -f elf64 -g -F dwarf answer.asm

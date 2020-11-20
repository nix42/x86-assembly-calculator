# x86-assembly-calculator

NASM x86 assembly calculator

- Add, subtract, multiply and divide

## To run on AMD CPU

1. nasm -f elf64 calculator.asm
2. ld -m elf_x86_64 -s -o calc calculator.o
3. ./calc

## To run on Intel CPU

1. nasm -f elf calculator.asm
2. ld -m elf_i386 -s -o calc calculator.o
3. ./calc



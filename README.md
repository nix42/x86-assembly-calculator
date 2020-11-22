# x86-assembly-calculator

NASM x86 assembly calculator

- Add, subtract, multiply and divide

## To run on AMD 32-bit CPU

1. nasm -f elf64 calculator.asm
2. ld -m elf_x86_64 -s -o calc calculator.o
3. ./calc

## To run on Intel 32-bit CPU

1. nasm -f elf calculator.asm
2. ld -m elf_i386 -s -o calc calculator.o
3. ./calc

## notes

- Currently only outputs single digit, need to implement a way to convert each digit in the register to ASCII

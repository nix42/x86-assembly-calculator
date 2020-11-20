segment .data
	
	input1 db 'Enter a number', 0xA,0xD
	len1 equ $- input1

	input2 db 'Enter a second number', 0xA,0xD
	len2 equ $- input2
	
	choice db 'add(0), subtract(1), divide(2) or  multiply(3)', 0xA,0xD
	lenC equ $- choice

	output db 'output is ', 0xA, 0xD
	len3 equ $- output

segment .bss
	num1 resb 2
	num2 resb 2
	c resb 2
	res resb 2

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, input1
	mov edx, len1
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, input2
	mov edx, len2
	int 0x80
	
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, choice
	mov edx, lenC
	int 0x80
	
	mov eax, 3
	mov ebx, 0
	mov ecx, c
	mov edx, 2
	int 0x80
	
	mov ah, [c]
	sub ah, '0'

	cmp ah, 0
	JE sum_values
	cmp ah, 1
	JE sub_values
	cmp ah, 2
	JE divide_values
	int 0x80

sum_values:
	mov al, [num1]
	sub al, '0'
	
	mov bl, [num2]
	sub bl, '0'

	add al, bl
	add al, '0'
	
	mov [res], al

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80
	
	jmp exit

sub_values:
	mov al, [num1]
	sub al, '0'
	
	mov bl, [num2]
	sub bl, '0'
	
	sub al, bl
	add al, '0'
	
	mov [res], al
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80
	
	jmp exit

divide_values:
	mov ah, 0
	mov al, [num1]
	sub al, '0'
	
	mov bl, [num2]
	sub bl, '0'
	
	div bl
	add ax, '0'
	
	mov [res], ax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 2
	int 0x80
	
	jmp exit

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80


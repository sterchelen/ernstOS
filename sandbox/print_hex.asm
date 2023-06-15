print_hex:
pusha
mov si, 4 ; loop counter
mov bx, MESSAGE ; resets bx
start:
cmp si, 0 ; we decrement so we want to test if we are at
je end ; if 0 ; stop
dec si ; decrement otherwise
mov ax, dx 
shr dx, 4 ; shifting dx by 1 byte to access remaining char
and ax, 0xf ; masking everything except last char
cmp al, 10 ; is it a number?
jl __isnumber
jmp __ischar
accumulator: ; accumulate al results to bx
mov byte[bx+2+si], al ; padding to +2 b/c bx starts with "Ox"
jmp start

end: 
call print_string
popa
ret

__isnumber:
	add al, 0x30
	jmp accumulator
	
__ischar:
	add al, 0x37
	jmp accumulator

MESSAGE:
	db '0x0000',0ah,0dh,0

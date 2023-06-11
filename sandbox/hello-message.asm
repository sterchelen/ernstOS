[org 0x7c00]

mov bx, MESSAGE_0
call print_string

mov bx, MESSAGE_1
call print_string

mov bx, MESSAGE_1
call print_string

jmp $

%include "print_string.asm"
MESSAGE_0:
	db 'Booting message',0ah,0dh,0

MESSAGE_1:
	db 'New message',0ah,0dh,0

times 510-($-$$) db 0
dw 0xaa55

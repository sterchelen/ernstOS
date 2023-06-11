; a boot program to demonstrate addressing

;tells the assembler to locatet the resulting code at 0x7c00 in memory
[org 0x7c00]


mov ah, 0x0e

;wrong, it loads the offset of the label not the value at the offset
mov al, the_secret
int 0x10

;wrong without the [org 0x7c00], it loads the offset at the start address of the program
mov al, [the_secret]
int 0x10

;works; this boot sector is loaded at 0x7c00
;so we add to the boot sector address the "the_secret" offset
;then with [] we make an indirect call to the value referencing the bx value
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

jmp $

the_secret:
	db "x"

times 510-($-$$) db 0
dw 0xaa55

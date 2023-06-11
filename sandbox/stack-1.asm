; a boot program to demonstrate stack concept

mov ah, 0x0e

mov bp, 0x8000 ; set the base of the stack a bit above the boot sector (0x7000)
mov sp, bp ; sp is stack top & bp bottom (reminder, stack is growing downwards)

push 'M'
push 'E'
push 'A'

;pop bx ; we can only pop 16-bits
;mov al, bl ; bl to copy only the first 8 bits)
;int 0x10

;pop bx
;mov al, bl
;int 0x10
;
;mov al, [0x7ffe] ; demonstrates that the stack is growing downwards
;int 0x10

; x86 is little endian boy
mov al, [0x7ffe] ; M -> 0x8000 - 0x2 (0x004d)
int 0x10
mov al, [0x7ffc] ; E -> 0x8000 - 0x4 (0x0045)
int 0x10
mov al, [0x7ffa] ; A -> 0x8000 - 0x6 (0x0041)
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55

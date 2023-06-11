; Let's print hello forever

; interrupt call 10h (17th, 10h in dec -> 16, interrupt vector in x86)
; this interrupt handler provides video services ; character & string output, graphics primitives.
mov ah, 0x0e 

mov al, 'C'
int 0x10
mov al, 'h'
int 0x10
mov al, 'a'
int 0x10
mov al, 'z'
int 0x10
mov al, 'a'
int 0x10
mov al, 'm'
int 0x10

jmp $ ; jumping forever here, right here... just here 

times 510-($-$$) db 0
dw 0xaa55

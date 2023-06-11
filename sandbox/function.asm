
mov al, 'H'
call print_fct

jmp $


print_fct:
	mov ah, 0x0e
	int 0x10
	ret

times 510-($-$$) db 0
dw 0xaa55

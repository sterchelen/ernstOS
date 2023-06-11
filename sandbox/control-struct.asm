mov bx , 30


cmp bx, 4
jle if ; if bx < 4 then call if label
cmp bx, 40; otherwise compare bx to 40
jl elseif; if bx < 40 then call elseif label
mov al, 'C' ; else show 'C'
jmp end ; jmp to env to avoid running below labels

if:
	mov al, 'A'
elseif:
	mov al, 'B'
end:

mov ah, 0x0e
int 0x10



jmp $

times 510-($-$$) db 0
dw 0xaa55

print_string:
	pusha
	mov ah, 0x0e
compare:
	mov al, [bx]
	cmp al, 0 ;until ! than terminated string character
	je done ; otherwise return
	int 0x10 ; print character
	inc bx
	jmp compare ; simulate loop
done:
	popa
	ret

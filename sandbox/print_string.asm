print_string:
	pusha
	mov ah, 0x0e
__compare:
	mov al, [bx]
	cmp al, 0 ;until ! than terminated string character
	je __done ; otherwise return
	int 0x10 ; print character
	inc bx
	jmp __compare ; simulate loop
__done:
	popa
	ret

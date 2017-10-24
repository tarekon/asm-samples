

.386
.model FLAT

EXTERN _ExitProcess@4:NEAR
ExitProcess EQU _ExitProcess@4

.const
	msg db "Hello, world!", 13, 10, 0

.code
strlen proc
	mov ebp, esp
	push ebp
	push edi
	push ecx

	mov edi, [ebp+4]
	mov ecx, 1000
	mov al, 0
	cld
	repne scasb
	je found

failed:
	mov eax, -1
	jmp cleanup

found:
	mov eax, 1000
	sub eax, ecx
	jmp cleanup

cleanup:

	pop ecx
	pop edi
	pop ebp

	retn 4
strlen endp

_START:
	push offset msg
	call strlen

	push 0
	call ExitProcess


end _START

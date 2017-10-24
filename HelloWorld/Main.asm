.386
.model FLAT
.data
EXTERN _ExitProcess@4:NEAR
ExitProcess EQU _ExitProcess@4

.code
_START:
	push 0DEADBEEFh
	push 0
	call ExitProcess

end _START

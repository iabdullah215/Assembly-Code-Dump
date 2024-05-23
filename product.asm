; We already know that SHL performs unsigned multiplication efficiently when the multiplier is a power of 2.
;  • You can factor any binary number into powers of 2.
;  • For example, to multiply EAX * 36,
;  • factor 36 into 32 + 4 and
;  • use the distributive property of multiplication to carry out the operation.

.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode:DWORD

.code
main PROC
	
	mov eax, 123
	mov ebx, eax
	shl eax, 5			; multiply by 2^5
	shl ebx, 2			; multiply by 2^2
	add eax, ebx

INVOKE ExitProcess, 0
main ENDP
END main

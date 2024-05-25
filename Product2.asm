; Multiply AX by 26, using shifting and addition instructions.
;    • Hint: 26 = 16 + 8 + 2.

.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode:DWORD

.code
main PROC
	
	mov eax, 123
	mov eax, ebx
	mov ebx, ecx

	shl eax, 4
	shl ebx, 3
	shl ecx, 1

	add eax, ebx
	add eax, ecx

INVOKE ExitProcess, 0
main ENDP
END main

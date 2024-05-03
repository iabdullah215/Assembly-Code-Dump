; Array usage

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode: DWORD
.data
val1 WORD 3, 8, 12
answer DWORD ?
.code
main PROC
movsx eax, [val1+2]
neg eax
add eax, 23
neg [val1+4]
movsx ecx, [val1+4]
movsx ebx, val1
add eax, ecx
add eax, ebx
mov answer, eax
INVOKE ExitProcess, 0
main ENDP
END main

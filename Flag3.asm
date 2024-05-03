; carry flag

.model flat, stdcall
.stack 4096
ExitProcess PROTO,
dwExitCode:DWORD
.data
 myVariable DWORD 16, 12, 43
 sum DWORD ?
.code
main PROC
 mov al, 0FFh
 add al, 1
 mov al, 0
 sub al, 1
COMPUTER ORGANIZATION AND ASSEMBLY LANGUAGE LAB NO: 08 7
 INVOKE ExitProcess, 0
main ENDP
END main

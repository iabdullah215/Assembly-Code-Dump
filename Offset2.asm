; Increment while dereferencing

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
someData WORD 01h, 02h, 03h, 04h ; 16-bit WORDs
.code
main PROC
 mov ebx, OFFSET someData ; Load the base address of someData into ebx
 mov eax, [ebx] ; Load the first WORD into eax (01h)
 mov eax, [ebx + 2] ; Load the second WORD into eax (02h)
 mov eax, [ebx + 6] ; Load the fourth WORD into eax (04h)
 invoke ExitProcess, 0 ; Exit the program
main ENDP
END main
